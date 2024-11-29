<?php

namespace App\Http\Controllers;

use App\Models\Stock;
use App\Models\Product;
use App\Models\Purchase;
use App\Models\Supplier;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    public function index()
    {
        $purchases = Purchase::where('status', 1)->get();
        return view('purchases.index', compact('purchases'));
    }

    public function create()
    {
        $suppliers = Supplier::where('status', 1)->get();
        return view('purchases.create', compact('suppliers'));
    }

    public function autocomplete(Request $request)
    {
        $term = $request->get('term');
        $supplier_id = $request->get('supplier_id');
        $products = Product::where(function ($query) use ($term) {
            $query->where('name', 'LIKE', "%{$term}%")
                ->orWhere('sku', 'LIKE', "%{$term}%");
        })
            ->where('supplier_id', $supplier_id)
            ->where('status', 1)
            ->take(10)
            ->get();


        $data = [];
        foreach ($products as $product) {
            $data[] = [
                'label' => "{$product->name} ({$product->name_si})",
                'value' => $product->name,
                'id' => $product->id,

            ];
        }

        return response()->json($data);
    }

    public function getProduct($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json([
                'message' => 'Product not found'
            ], 404);
        }
        return response()->json($product);
    }

    public function store(Request $request)
    {
        $purchase = Purchase::create($request->all());

        if ($request->hasFile('document')) {
            $image = $request->file('document');
            $imageName = Str::uuid() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/purchases/' . $purchase->id . '/document');

            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }

            if ($purchase->image && File::exists($destinationPath . '/' . $purchase->image)) {
                File::delete($destinationPath . '/' . $purchase->image);
            }

            $image->move($destinationPath, $imageName);
            $purchase->document = $imageName;
            $purchase->save();
        }
        $purchase->purchaseid = Purchase::generatePurchaseId();
        $purchase->save();

        $formData = $request->input('products');
        $decodedData = json_decode($formData, true);

        foreach ($decodedData['products'] as $product) {
            $stock = new Stock();

            $stock->stockid = $this->generateStockID();
            $stock->quantity = $product['quantity'];
            $stock->availablequantity = $product['quantity'];
            $stock->price = $product['unit_price'];
            $stock->buyingprice = $product['buying_price'];
            $stock->marketprice = $product['market_price'];
            $stock->total = $product['unittotal'];
            $stock->buyingtotal = $product['subtotal'];
            $stock->product_id = $product['product_id'];
            $stock->expiredate = $product['expiredate'];
            $stock->purchase_id = $purchase->id;
            $stock->user_id = Auth::user()->id;
            $stock->save();
        }

        return redirect()->route('purchases')->with('success', 'Purchase added successfully.');
    }

    function generateStockID()
    {
        $prefix = "STK";
        $year = date('Y');

        $latestStockID = DB::table('stocks')
            ->where('stockid', 'like', "$prefix-$year%")
            ->orderBy('stockid', 'desc')
            ->first();

        if ($latestStockID) {
            $lastNumber = (int)substr($latestStockID->stockid, -4);
            $nextNumber = str_pad($lastNumber + 1, 4, '0', STR_PAD_LEFT);
        } else {
            $nextNumber = "0001";
        }

        return "$prefix-$year-$nextNumber";
    }

    public function edit($id)
    {
        $purchase = Purchase::find($id);
        $stocks = Stock::where('purchase_id', $id)->get();
        $suppliers = Supplier::where('status', 1)->get();
        return view('purchases.edit', compact('purchase', 'suppliers', 'stocks'));
    }
}