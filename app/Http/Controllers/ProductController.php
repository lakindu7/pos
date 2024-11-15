<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Product;
use App\Models\Section;
use App\Models\Category;
use App\Models\Childcategory;
use App\Models\Stock;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
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
                    return '<a href="' . route('products.view', $product->id) . '" class="link-dark mr-2">
                            <i class="gd-eye icon-text"></i>
                        </a>
                        <a href="' . route('products.edit', $product->id) . '" class="link-dark mr-2">
                            <i class="gd-pencil icon-text"></i>
                        </a>
                        <form action="' . route('products.destroy', $product->id) . '" method="POST" style="display:inline;"
                              onsubmit="return confirm(\'Are you sure you want to delete this product?\');">
                            ' . csrf_field() . '
                            <button type="submit" class="btn btn-link p-0 link-dark"><i class="gd-trash icon-text"></i></button>
                        </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('products.index');
    }

    public function create()
    {
        $categories = Category::where('status', 1)->get();
        $brands = Brand::where('status', 1)->get();
        $sections = Section::where('status', 1)->get();
        return view('products.create', compact('categories', 'brands', 'sections'));
    }

    public function getSubcategories($categoryId)
    {
        $subcategories = Subcategory::where('category_id', $categoryId)->get();
        return response()->json($subcategories);
    }

    public function getChildCategories($subcategoryId)
    {
        $childcategories = Childcategory::where('subcategory_id', $subcategoryId)->get();
        return response()->json($childcategories);
    }

    public function store(Request $request)
    {
        $product = Product::create($request->all());

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = Str::uuid() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/products/' . $product->id);
            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }
            $image->move($destinationPath, $imageName);
            $product->image =  $imageName;
            $product->save();
        }

        $product->slug = $this->createUniqueSlug($product->name);
        $product->sku = $this->generateSKU($product->name, $product->category);
        $product->save();

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

        return redirect()->route('products')->with('success', 'Product created successfully.');
    }

    function createUniqueSlug($productName)
    {
        $slug = Str::slug($productName);
        $originalSlug = $slug;
        $count = 1;
        while (Product::where('slug', $slug)->exists()) {
            $slug = "{$originalSlug}-{$count}";
            $count++;
        }
        return $slug;
    }

    function generateSKU($productName, $categoryName)
    {
        $productPart = strtoupper(substr(Str::slug($productName, ''), 0, 3));
        $categoryPart = strtoupper(substr(Str::slug($categoryName, ''), 0, 3));

        $randomNumber = mt_rand(1000, 9999);
        $sku = "{$categoryPart}-{$productPart}-{$randomNumber}";

        while (Product::where('sku', $sku)->exists()) {
            $randomNumber = mt_rand(1000, 9999);
            $sku = "{$categoryPart}-{$productPart}-{$randomNumber}";
        }

        return $sku;
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

    public function view($id)
    {
        $product = Product::with(
            'category',
            'brand',
            'user'
        )->findOrFail($id);

        $stocks = Stock::with('user')->where('product_id', $id)->where('availablequantity', '>', 0)->where('status', 1)->get();

        return view('products.view', compact('product', 'stocks'));
    }

    public function edit($id)
    {
        $product = Product::find($id);
        $categories = Category::where('status', 1)->get();
        $subcategories = Subcategory::where('status', 1)->where('category_id', $product->category_id)->get();
        $childcategories = Childcategory::where('status', 1)->where('subcategory_id', $product->subcategory_id)->get();
        $brands = Brand::where('status', 1)->get();
        $sections = Section::where('status', 1)->get();
        return view('products.edit', compact('product', 'categories', 'brands', 'sections', 'subcategories', 'childcategories'));
    }

    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);

        $product->name = $request->input('name');
        $product->name_si = $request->input('name_si');
        $product->barcode = $request->input('barcode');
        $product->category_id = $request->input('category_id') ?: null;
        $product->subcategory_id = $request->input('subcategory_id') ?: null;
        $product->childcategory_id = $request->input('childcategory_id') ?: null;
        $product->brand_id = $request->input('brand_id');
        $product->section_id = $request->input('section_id') ?: null;
        $product->sellingtype = $request->input('sellingtype');
        $product->alertlimit = $request->input('alertlimit', 0);
        $product->youtubelink = $request->input('youtubelink');
        $product->description = $request->input('description');

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = Str::uuid() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/products/' . $product->id);

            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }

            if ($product->image && File::exists($destinationPath . '/' . $product->image)) {
                File::delete($destinationPath . '/' . $product->image);
            }

            $image->move($destinationPath, $imageName);
            $product->image = $imageName;
        }

        $product->save();

        return redirect()->route('products')->with('success', 'Product updated successfully.');
    }

    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->status = 0;
        $product->save();

        Stock::where('product_id', $id)->update(['status' => 0]);
        return redirect()->route('products')->with('success', 'Product deleted successfully.');
    }
}
