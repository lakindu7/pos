<?php

namespace App\Http\Controllers\Pos;

use App\Models\Product;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\ExpenseCategory;
use App\Http\Controllers\Controller;

class PosController extends Controller
{
    public function index()
    {
        $products = Product::where('status', 1)->orderby('salescount', 'desc')->limit(12)->get();
        $customers = Customer::where('status', 1)->get();
        $categories = ExpenseCategory::where('status', 1)->where('id', '!=', 1)->get();
        return view('pos.index', compact('products', 'customers', 'categories'));
    }
}
