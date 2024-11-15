<?php

namespace App\Http\Controllers;

use App\Models\Stock;
use App\Models\Product;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;

class StockController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $products = Product::with(
                'category',
                'subcategory',
                'childcategory',
                'brand',
                'user'
            )->where('status', 1)->orderBy('id', 'desc');

            return DataTables::of($products)
                ->addIndexColumn()
                ->addColumn('category', fn($product) => $product->category->name ?? '')
                ->addColumn('subcategory', fn($product) => $product->subcategory->name ?? '')
                ->addColumn('childcategory', fn($product) => $product->childcategory->name ?? '')
                ->addColumn('brand', fn($product) => $product->brand->name ?? '')
                ->addColumn('created_by', fn($product) => $product->user->name ?? '')
                ->addColumn('created_date', fn($product) => $product->created_at->format('F d, Y'))
                ->addColumn('action', function ($product) {
                    return '<a href="' . route('stocks.create', $product->id) . '" class="link-dark mr-2">
                            <i class="gd-plus icon-text"></i>
                        </a>
                        <a href="' . route('products.view', $product->id) . '" class="link-dark mr-2">
                            <i class="gd-eye icon-text"></i>
                        </a>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('stocks.index');
    }

    public function create($id)
    {
        return view('stocks.create', compact('id'));
    }

    public function store(Request $request, $id)
    {
        $product = Product::find($id);
        $stock = Stock::create($request->all());
        $total = 0;
        $buyingtotal = 0;
        if ($product->sellingtype == 'Grams') {
            $total = ($stock->quantity * $stock->price) / 1000;
            $buyingtotal = ($stock->quantity * $stock->buyingprice) / 1000;
        } else {
            $total = $stock->quantity * $stock->price;
            $buyingtotal = $stock->quantity * $stock->buyingprice;
        }

        $stock->product_id = $product->id;
        $stock->stockid = $this->generateStockID();
        $stock->availablequantity = $stock->quantity;
        $stock->total = $total;
        $stock->buyingtotal = $buyingtotal;
        $stock->save();

        return redirect()->route('stocks')->with('success', 'Stock added successfully.');
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
        $stock = Stock::find($id);
        return view('stocks.edit', compact('stock'));
    }


    public function update(Request $request, $id)
    {
        $stock = Stock::findOrFail($id);
        $stock->update($request->all());
        return redirect()->route('products.view', $stock->product_id)->with('success', 'Section updated successfully.');
    }

    public function destroy($id)
    {
        $stock = Stock::findOrFail($id);
        $stock->status = 0;
        $stock->save();
        return redirect()->route('products.view', $stock->product_id)->with('success', 'Stock deleted successfully.');
    }
}
