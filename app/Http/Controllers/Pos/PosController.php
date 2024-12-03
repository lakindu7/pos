<?php

namespace App\Http\Controllers\Pos;

use App\Models\Invoice;
use App\Models\Product;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\ExpenseCategory;
use App\Http\Controllers\Controller;
use App\Models\Dailydetail;
use App\Models\Expense;
use App\Models\InvoiceDetail;
use App\Models\Purchase;
use App\Models\Stock;
use Carbon\Carbon;

class PosController extends Controller
{
    public function index()
    {
        $startday = Dailydetail::whereDate('created_at', Carbon::today())->exists();
        $dayEndcompleted = "";
        if (!$startday) {
            $latestRecord = Dailydetail::latest('created_at')->first();
            if ($latestRecord->ended_by == null) {
                $dayEndcompleted = $latestRecord->created_at;
            }
        }
        $products = Product::where('status', 1)->orderby('salescount', 'desc')->limit(12)->get();
        $customers = Customer::where('status', 1)->get();
        $categories = ExpenseCategory::where('status', 1)->where('id', '!=', 1)->get();
        $recenttransactions = Invoice::where('status', 1)->with('customer')->limit(10)->get();
        return view('pos.index', compact(
            'products',
            'customers',
            'categories',
            'recenttransactions',
            'startday',
            'dayEndcompleted'
        ));
    }

    public function getInvoiceIds(Request $request)
    {
        $search = $request->get('term');
        $invoiceIds = Invoice::where('invoiceid', 'LIKE', "%{$search}%")->where('status', 1)
            ->pluck('invoiceid');

        return response()->json($invoiceIds);
    }

    public function getInvoiceDetails(Request $request)
    {
        $invoiceId = $request->get('id');
        $invoice = Invoice::with('customer')->where('invoiceid', $invoiceId)->first();

        if ($invoice) {
            return response()->json([
                'id' => $invoice->id,
                'invoice_id' => $invoice->invoiceid,
                'date' => $invoice->created_at->toDateString(),
                'amount' => $invoice->amount,
                'customer_name' => $invoice->customer->name ?? 'N/A'
            ]);
        }

        return response()->json(['error' => 'Invoice not found'], 404);
    }

    public function cancel($id)
    {
        $invoice = Invoice::find($id);
        $invoice->status = 0;
        $invoice->save();

        $invoicedetails = InvoiceDetail::where('invoice_id', $invoice->id)->where('status', 1)->get();

        InvoiceDetail::where('invoice_id', $invoice->id)
            ->where('status', 1)
            ->update(['status' => 0]);

        foreach ($invoicedetails as $detail) {
            $stock = Stock::find($detail->stock_id);
            $stock->availablequantity += $detail->quantity;
            $stock->save();
        }
        return redirect()->route('pos')->with('success', 'Invoice Cancelled Successfully');
    }

    public function startday(Request $request)
    {
        Dailydetail::create($request->all());
        return redirect()->route('pos')->with('success', 'Day Started Successfully');
    }

    public function dayend($date = null)
    {
        $date = $date ?? today();
        $dailydetail = Dailydetail::whereDate('created_at', $date)->first();
        $totalAmount = Invoice::whereDate('created_at', $date)->sum('amount');
        $totalExpense = Expense::whereDate('created_at', $date)->sum('amount');
        $totalPurchase = Purchase::whereDate('created_at', $date)
            ->where('paymentmethod', 'cash')
            ->sum('total');
        return view('pos.dayend', compact('totalPurchase', 'totalAmount', 'totalExpense', 'date', 'dailydetail'));
    }
}
