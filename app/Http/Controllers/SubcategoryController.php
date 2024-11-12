<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class SubcategoryController extends Controller
{
    public function index()
    {
        $subcategories = Subcategory::with('category')->where('status', 1)->get();
        return view('subcategories.index', compact('subcategories'));
    }

    public function create()
    {
        $categories = Category::where('status', 1)->get();
        return view('subcategories.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:subcategories|max:255',
            'category_id' => 'required'
        ]);
        $subcategory = Subcategory::create($request->all());

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = Str::uuid() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/subcategories/' . $subcategory->id);

            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }

            $image->move($destinationPath, $imageName);
            $subcategory->image =  $imageName;
            $subcategory->save();
        }

        return redirect()->route('subcategories')->with('success', 'Category created successfully.');
    }

    public function edit($id)
    {
        $subcategory = Subcategory::find($id);
        $categories = Category::where('status', 1)->get();
        return view('subcategories.edit', compact('subcategory', 'categories'));
    }

    public function update(Request $request, $id)
    {
        $subcategory = Subcategory::findOrFail($id);
        $subcategory->update($request->all());

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = Str::uuid() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/subcategories/' . $subcategory->id);

            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }

            $image->move($destinationPath, $imageName);
            $subcategory->image =  $imageName;
            $subcategory->save();
        }
        return redirect()->route('subcategories')->with('success', 'Subcategory updated successfully.');
    }

    public function destroy($id)
    {
        $subcategory = Subcategory::findOrFail($id);
        $subcategory->status = 0;
        $subcategory->save();
        return redirect()->route('subcategories')->with('success', 'Subcategory deleted successfully.');
    }
}
