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
        $purchases = Purchase::where('status', 1)->orderby('id', "desc")->get();
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

    public function getProductbyBarcode($barcode, $supplierId)
    {
        $product = Product::where('barcode', $barcode)->where('supplier_id', $supplierId)->first();
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
            if ($product['sellingtype'] == "Grams") {
                $oldstocks = Stock::where('availablequantity', '>', 0)->where('status', 1)->where('product_id', $product['product_id'])->get();
                $oldquantity = 0;
                foreach ($oldstocks as $oldstock) {
                    $oldquantity += $oldstock->availablequantity;

                    $oldstock->transferdqty = $oldstock->availablequantity;
                    $oldstock->availablequantity = 0;
                    $oldstock->transfernote = "Merged on" . date('Y-m-d');
                    $oldstock->save();
                }

                $stock = new Stock();
                $stock->stockid = $this->generateStockID();
                $stock->quantity = $oldquantity + $product['quantity'];
                $stock->availablequantity = $oldquantity + $product['quantity'];
                $stock->actualqty = $product['quantity'];
                $stock->fromtransfer = $oldquantity;
                $stock->price = $product['unit_price'];
                $stock->buyingprice = $product['buying_price'];
                $stock->marketprice = $product['market_price'];
                $stock->total = $product['unittotal'];
                $stock->buyingtotal = $product['subtotal'];
                $stock->product_id = $product['product_id'];
                $stock->expiredate = !empty($product['expiredate']) ? $product['expiredate'] : null;
                $stock->purchase_id = $purchase->id;
                $stock->user_id = Auth::user()->id;
                $stock->save();
            } else {
                $stock = new Stock();
                $stock->stockid = $this->generateStockID();
                $stock->quantity = $product['quantity'];
                $stock->availablequantity = $product['quantity'];
                $stock->actualqty = $product['quantity'];
                $stock->price = $product['unit_price'];
                $stock->buyingprice = $product['buying_price'];
                $stock->marketprice = $product['market_price'];
                $stock->total = $product['unittotal'];
                $stock->buyingtotal = $product['subtotal'];
                $stock->product_id = $product['product_id'];
                $stock->expiredate = !empty($product['expiredate']) ? $product['expiredate'] : null;
                $stock->purchase_id = $purchase->id;
                $stock->user_id = Auth::user()->id;
                $stock->save();
            }
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
        $stocks = Stock::with('product')->where('purchase_id', $id)->get();
        $suppliers = Supplier::where('status', 1)->get();
        return view('purchases.edit', compact('purchase', 'suppliers', 'stocks'));
    }

    public function update(Request $request, $id)
    {
        $purchase = Purchase::findOrFail($id);

        $purchase->update($request->except(['document', 'products']));

        if ($request->hasFile('document')) {
            $image = $request->file('document');
            $imageName = Str::uuid() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/purchases/' . $purchase->id . '/document');

            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }

            if ($purchase->document && File::exists($destinationPath . '/' . $purchase->document)) {
                File::delete($destinationPath . '/' . $purchase->document);
            }

            $image->move($destinationPath, $imageName);
            $purchase->document = $imageName;
            $purchase->save();
        }

        $formData = $request->input('products');
        $decodedData = json_decode($formData, true);

        Stock::where('purchase_id', $purchase->id)->delete();

        foreach ($decodedData['products'] as $product) {
            $stock = new Stock();
            $stock->quantity = $product['quantity'];
            $stock->availablequantity = $product['quantity'];
            $stock->price = $product['unit_price'];
            $stock->buyingprice = $product['buying_price'];
            $stock->marketprice = $product['market_price'];
            $stock->total = $product['unittotal'];
            $stock->buyingtotal = $product['subtotal'];
            $stock->product_id = $product['product_id'];
            $stock->expiredate = !empty($product['expiredate']) ? $product['expiredate'] : null;
            $stock->purchase_id = $purchase->id;
            $stock->user_id = Auth::user()->id;
            $stock->save();
        }

        return redirect()->route('purchases')->with('success', 'Purchase updated successfully.');
    }

    public function destroy($id)
    {
        $purchase = Purchase::find($id);
        $purchase->status = 0;
        $purchase->save();

        $stocks = Stock::with('product')->where('purchase_id', $id)->get();
        foreach ($stocks as $stock) {
            $stock = Stock::findOrFail($stock->id);
            $stock->status = 0;
            $stock->save();
        }
        return redirect()->route('purchases')->with('success', 'Purchase deleted successfully.');
    }
}
