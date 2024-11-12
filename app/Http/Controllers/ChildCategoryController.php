<?php

namespace App\Http\Controllers;

use App\Models\Childcategory;
use Illuminate\Http\Request;

class ChildCategoryController extends Controller
{
    public function index()
    {
        $childcategories = Childcategory::with('category', 'subcategory')->where('status', 1)->get();
        return view('childcategories.index', compact('childcategories'));
    }
}
