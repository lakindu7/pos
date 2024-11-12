<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Childcategory;
use App\Models\Subcategory;
use Illuminate\Support\Facades\File;

class ChildCategoryController extends Controller
{
    public function index()
    {
        $childcategories = Childcategory::with('category', 'subcategory')->where('status', 1)->get();
        return view('childcategories.index', compact('childcategories'));
    }

    public function create()
    {
        $categories = Category::where('status', 1)->get();
        return view('childcategories.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:subcategories|max:255',
            'category_id' => 'required',
            'subcategory_id' => 'required'
        ]);

        $childcategory = Childcategory::create($request->all());

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = Str::uuid() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/childcategories/' . $childcategory->id);

            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }

            $image->move($destinationPath, $imageName);
            $childcategory->image =  $imageName;
            $childcategory->save();
        }

        return redirect()->route('childcategories')->with('success', 'Child Category created successfully.');
    }

    public function getByCategory($categoryId)
    {
        $subcategories = Subcategory::where('category_id', $categoryId)->get();
        return response()->json($subcategories);
    }

    public function edit($id)
    {
        $childcategory = Childcategory::find($id);
        $categories = Category::where('status', 1)->get();
        $subcategories = Subcategory::where('status', 1)->get();
        return view('childcategories.edit', compact('childcategory', 'categories', 'subcategories'));
    }

    public function update(Request $request, $id)
    {
        $childcategory = Childcategory::findOrFail($id);
        $childcategory->update($request->all());

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = Str::uuid() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/childcategories/' . $childcategory->id);

            if (!File::exists($destinationPath)) {
                File::makeDirectory($destinationPath, 0755, true);
            }

            $image->move($destinationPath, $imageName);
            $childcategory->image =  $imageName;
            $childcategory->save();
        }
        return redirect()->route('childcategories')->with('success', 'Child Category updated successfully.');
    }

    public function destroy($id)
    {
        $childcategory = Childcategory::findOrFail($id);
        $childcategory->status = 0;
        $childcategory->save();
        return redirect()->route('childcategories')->with('success', 'Child Category deleted successfully.');
    }
}
