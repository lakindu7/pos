<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Stock;
use App\Models\Product;
use App\Models\Supplier;
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
            )->where('status', 1)->orderBy('id', 'asc');

            return DataTables::of($products)
                ->addIndexColumn()
                ->addColumn('category', fn($product) => $product->category->name ?? '')
                ->addColumn('brand', fn($product) => $product->brand->name ?? '')
                ->addColumn('supplier', fn($product) => $product->supplier->name ?? 'NA')
                ->addColumn('created_by', fn($product) => $product->user->name ?? '')
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

        if ($product->supplier_id != null) {
            $supplier = Supplier::find($product->supplier_id);
            $date = Carbon::now()->format('Y-m-d');
            $frequency = $supplier->frequency;
            $day = $supplier->delivaryday;
            $nextDelivery = $this->calculateNextDeliveryDate($date, $frequency, $day);
            $supplier->lastdelivary = $date;
            $supplier->nextdelivary = $nextDelivery;
            $supplier->save();
        }

        return redirect()->route('stocks')->with('success', 'Stock added successfully.');
    }



    public function calculateNextDeliveryDate($date, $frequency, $day)
    {
        $currentDate = Carbon::parse($date);
        switch ($frequency) {
            case 'daily':
                $nextDeliveryDate = $currentDate->addDay();
                break;
            case 'weekly':
                $nextDeliveryDate = $currentDate->addWeek();
                break;
            case 'monthly':
                $nextDeliveryDate = $currentDate->addMonth();
                break;
            case 'quarterly':
                $nextDeliveryDate = $currentDate->addMonths(3);
                break;
            case 'annually':
                $nextDeliveryDate = $currentDate->addYear();
                break;
            default:
                $nextDeliveryDate = $currentDate;
                break;
        }

        if ($frequency !== 'daily' && $frequency !== 'weekly') {
            $date = Carbon::parse($nextDeliveryDate);

            $weekdayIndex = [
                'monday' => Carbon::MONDAY,
                'tuesday' => Carbon::TUESDAY,
                'wednesday' => Carbon::WEDNESDAY,
                'thursday' => Carbon::THURSDAY,
                'friday' => Carbon::FRIDAY,
                'saturday' => Carbon::SATURDAY,
                'sunday' => Carbon::SUNDAY
            ];

            $nextDeliveryDate = $date->copy()->startOfWeek()->addDays($weekdayIndex[$day] - 1);
            return $nextDeliveryDate->format('Y-m-d');
        }

        return $nextDeliveryDate->format('Y-m-d');
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
        $stock = Stock::find($id);
        $product = Product::find($stock->product_id);

        if ($product->sellingtype === 'Grams') {
            $total = ($request->quantity * $request->price) / 1000;
            $buyingtotal = ($request->quantity * $request->buyingprice) / 1000;
        } else {
            $total = $request->quantity * $request->price;
            $buyingtotal = $request->quantity * $request->buyingprice;
        }

        $stock->total = $total;
        $stock->expiredate = $request->expiredate;
        $stock->availablequantity = $request->quantity;
        $stock->quantity = $request->quantity;
        $stock->buyingtotal = $buyingtotal;
        $stock->save();

        return redirect()->route('stocks')->with('success', 'Stock edited successfully.');
    }


    public function destroy($id)
    {
        $stock = Stock::findOrFail($id);
        $stock->status = 0;
        $stock->save();
        return redirect()->route('products.view', $stock->product_id)->with('success', 'Stock deleted successfully.');
    }

    public function getStock($id)
    {
        $stock = Stock::with('product')
            ->where('product_id', $id)
            ->where('availablequantity', '>', 0)
            ->where('status', 1)
            ->get();

        if ($stock) {
            return response()->json([
                'status' => 'success',
                'stock' => $stock,
            ]);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Product not found',
            ], 404);
        }
    }
}
