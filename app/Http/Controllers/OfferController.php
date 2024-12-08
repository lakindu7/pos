<?php

namespace App\Http\Controllers;

use App\Models\Offer;
use App\Models\Product;
use Illuminate\Http\Request;

class OfferController extends Controller
{
    public function index() {}

    public function create()
    {
        return view('offers.create');
    }

    public function store(Request $request)
    {
        $offer = Offer::create($request->all());
    }

    public function searchProducts(Request $request)
    {
        $term = $request->input('term');
        $products = Product::where('name', 'LIKE', '%' . $term . '%')
            ->select('id', 'name_si')
            ->get();

        $formattedProducts = $products->map(function ($product) {
            return [
                'id' => $product->id,
                'label' => $product->name_si,
                'value' => $product->name_si
            ];
        });

        return response()->json($formattedProducts);
    }
}
