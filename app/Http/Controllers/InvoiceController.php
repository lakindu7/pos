<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Stock;
use App\Models\Invoice;
use App\Models\Setting;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\InvoiceDetail;
use App\Models\RewardSetting;
use Illuminate\Support\Facades\DB;

class InvoiceController extends Controller
{
    public function index() {}

    public function create()
    {
        $customers = Customer::where('status', 1)->get();
        return view('invoices.create', compact('customers'));
    }

    public function store(Request $request)
    {

        $customerid = "";
        $customer = Customer::where('email', $request->email)
            ->orWhere('telephone', $request->telephone)
            ->first();
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
        $invoice->invoiceid = $this->generateInvoiceId();
        $invoice->customer_id = $customerid;
        $invoice->invoicetype = $request->invoicetype ?? "Cash";
        $invoice->save();

        $isPoints = Setting::first()->loyaltypoints;
        if ($isPoints) {
            $points = $this->calculatePoints($request->amount);
            $invoice->points = $points;
            $invoice->save();
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
        }

        return redirect()->route('invoices.print', $invoice->id);
    }


    function generateInvoiceId()
    {
        $yearMonth = Carbon::now()->format('Y-m');
        return DB::transaction(function () use ($yearMonth) {
            $latestInvoice = Invoice::where('invoiceid', 'like', 'INV-' . $yearMonth . '%')
                ->lockForUpdate()
                ->orderBy('created_at', 'desc')
                ->first();

            $nextNumber = $latestInvoice ? (int) substr($latestInvoice->invoiceid, -3) + 1 : 1;
            $nextNumberFormatted = str_pad($nextNumber, 3, '0', STR_PAD_LEFT);
            $invoiceId = 'INV' . $yearMonth . '' . $nextNumberFormatted;
            return $invoiceId;
        });
    }

    function calculatePoints($total)
    {
        $pointdetail = RewardSetting::first();
        if ($pointdetail->mintotal < $total) {
            $points = $total / 100;
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
}
