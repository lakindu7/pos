<?php

namespace App\Http\Controllers;

use App\Models\CollectedCredit;
use Carbon\Carbon;
use App\Models\User;
use App\Models\Stock;
use App\Models\Invoice;
use App\Models\Setting;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\InvoiceDetail;
use App\Models\Product;
use App\Models\RewardSetting;
use Illuminate\Support\Facades\DB;
use PDO;
use Yajra\DataTables\Facades\DataTables;


class InvoiceController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $invoices = Invoice::with('customer:id,name')->where('status', 1)->orderby('created_at', 'desc')
                ->select([
                    'id',
                    'invoiceid',
                    'invoicetype',
                    'amount',
                    'payment',
                    'balance',
                    'points',
                    'customer_id',
                ]);

            return DataTables::of($invoices)
                ->addColumn('customer_name', function ($invoice) {
                    return $invoice->customer->name ?? 'Customer';
                })
                ->addColumn('action', function ($invoice) {
                    return '<button class="btn btn-danger btn-sm cancel-invoice" data-id="' . $invoice->id . '">Cancel</button>';
                })
                ->addColumn('action', function ($product) {
                    return '
                        <form action="' . route('invoices.destroy', $product->id) . '" method="POST" style="display:inline;"
                              onsubmit="return confirm(\'Are you sure you want to delete this invoice?\');">
                            ' . csrf_field() . '
                            <button type="submit" class="btn btn-link p-0 link-dark"><i class="gd-trash icon-text"></i></button>
                        </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('invoices.index');
    }

    public function create()
    {
        $customers = Customer::where('status', 1)->get();
        return view('invoices.create', compact('customers'));
    }

    public function store(Request $request)
    {
        $customerid = "";
        $customer = "";

        if ($request->filled('email') || $request->filled('telephone')) {
            $query = Customer::query();
            if ($request->filled('email')) {
                $query->where('email', $request->email);
            }
            if ($request->filled('telephone')) {
                $query->orWhere('telephone', $request->telephone);
            }
            $customer = $query->first();
        }

        if ($customer) {
            $customerid = $customer->id;
        } else {
            if ($request->customer_id == "new") {
                $customer = new Customer();
                $customer->name = $request->name;
                $customer->email = $request->email;
                $customer->telephone = $request->telephone;
                $customer->dob = $request->dob;
                $customer->user_id = $request->user_id;
                $customer->save();

                $customerid = $customer->id;
            } else {
                $customerid = $request->customer_id;
            }
        }
        $invoice = Invoice::create($request->all());

        $invoicetype = $request->invoicetype ?? "Cash";

        if ($invoice->balance < 0) {
            $invoicetype = "Credit";
            $customer->outstandingbalance += abs($invoice->balance);
            $customer->save();
        }

        if ($request->creditsettle == 1) {
            $customer->outstandingbalance -= abs($invoice->balance);
            $customer->save();

            $collectedcredit = new CollectedCredit;
            $collectedcredit->collectedamount = abs($invoice->balance);
            $collectedcredit->customer_id = $customerid;
            $collectedcredit->invoice_id = $invoice->id;
            $collectedcredit->user_id = $request->user_id;
            $collectedcredit->save();
        }

        $invoice->invoiceid = $this->generateInvoiceId();
        $invoice->customer_id = $customerid;
        $invoice->invoicetype = $invoicetype;
        $invoice->save();

        $isPoints = Setting::first()->loyaltypoints;
        if ($isPoints && $invoice->balance >= 0) {
            $points = $this->calculatePoints($request->amount);
            $invoice->points = $points;
            $invoice->save();

            if ($customerid) {
                $customer = Customer::find($customerid);
                $customer->points += $points;
                $customer->save();
            }
        }

        $details = json_decode($request->invoicedetails);
        foreach ($details as $key => $detail) {
            $invoice_detail = new InvoiceDetail();
            $invoice_detail->quantity = $detail->quantity;
            $invoice_detail->itemtotal = $detail->subtotal;
            $invoice_detail->unitprice = $detail->productPrice;
            $invoice_detail->buyingtotal = $detail->buyingtotal;
            $invoice_detail->markettotal = $detail->markettotal;
            $invoice_detail->marketprice = $detail->marketprice;
            $invoice_detail->buyingprice = $detail->buyingprice;
            $invoice_detail->product_id = $detail->productId;
            $invoice_detail->invoice_id = $invoice->id;
            $invoice_detail->stock_id = $detail->stockId;
            $invoice_detail->save();

            $stock = Stock::find($detail->stockId);
            $stock->availablequantity -= $invoice_detail->quantity;
            $stock->save();

            $product = Product::find($detail->productId);
            if ($product->sellingtype == "Grams") {
                $product->salescount += $detail->quantity / 1000;
                $product->save();
            } else {
                $product->salescount += $detail->quantity;
                $product->save();
            }
        }

        return redirect()->route('invoices.print', $invoice->id);
    }


    function generateInvoiceId()
    {
        $yearMonth = Carbon::now()->format('Y-m');
        return DB::transaction(function () use ($yearMonth) {
            $latestInvoice = Invoice::where('invoiceid', 'like', 'INV-' . $yearMonth . '-%')
                ->lockForUpdate()
                ->orderBy('created_at', 'desc')
                ->first();

            $nextNumber = $latestInvoice ? (int) substr($latestInvoice->invoiceid, -3) + 1 : 1;
            $nextNumberFormatted = str_pad($nextNumber, 3, '0', STR_PAD_LEFT);

            $invoiceId = 'INV-' . $yearMonth . '-' . $nextNumberFormatted;

            return $invoiceId;
        });
    }


    function calculatePoints($total)
    {
        $pointdetail = RewardSetting::first();
        if ($pointdetail->mintotal < $total) {
            $points = $total / $pointdetail->spendamount;
            if ($points > $pointdetail->maxpoint && $pointdetail->maxpoint != NULL) {
                $points = $pointdetail->maxpoint;
            }
        } else {
            $points = 0;
        }
        return $points;
    }

    public function print($id)
    {
        $invoice = Invoice::where('id', $id)->with(
            'customer',
            'user'
        )->first();
        $invoicedetails = InvoiceDetail::with('product')->where('invoice_id', $id)->get();
        $setting = Setting::first();

        return view('invoices.print', compact('invoice', 'invoicedetails', 'setting'));
    }

    public function destroy($id)
    {
        $invoice = Invoice::findOrFail($id);
        $invoice->status = 0;
        $invoice->save();
        return redirect()->route('invoices')->with('success', 'Product deleted successfully.');
    }
}
