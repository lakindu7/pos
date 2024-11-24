<?php

namespace App\Http\Controllers\Pos;

use App\Models\Invoice;
use App\Models\Product;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\ExpenseCategory;
use App\Http\Controllers\Controller;
use App\Models\InvoiceDetail;
use App\Models\Stock;

class PosController extends Controller
{
    public function index()
    {
        $products = Product::where('status', 1)->orderby('salescount', 'desc')->limit(12)->get();
        $customers = Customer::where('status', 1)->get();
        $categories = ExpenseCategory::where('status', 1)->where('id', '!=', 1)->get();
        $recenttransactions = Invoice::where('status', 1)->with('customer')->limit(10)->get();
        return view('pos.index', compact('products', 'customers', 'categories', 'recenttransactions'));
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
}
