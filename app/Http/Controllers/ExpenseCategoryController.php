<?php

namespace App\Http\Controllers;

use App\Models\ExpenseCategory;
use Illuminate\Http\Request;

class ExpenseCategoryController extends Controller
{
    public function index()
    {
        $categories = ExpenseCategory::where('status', 1)->get();
        return view('expensecategories.index', compact('categories'));
    }

    public function create()
    {
        return view('expensecategories.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:expense_categories|max:255'
        ]);

        $category = ExpenseCategory::create($request->all());
        return redirect()->route('expensecategories')->with('success', 'Expense Category created successfully.');
    }


    public function edit($id)
    {
        $category = ExpenseCategory::find($id);
        return view('expensecategories.edit', compact('category'));
    }


    public function update(Request $request, $id)
    {
        $category = ExpenseCategory::findOrFail($id);
        $category->update($request->all());
        return redirect()->route('expensecategories')->with('success', 'Expense Category updated successfully.');
    }

    public function destroy($id)
    {
        $category = ExpenseCategory::findOrFail($id);
        $category->status = 0;
        $category->save();
        return redirect()->route('expensecategories')->with('success', 'Expense Category deleted successfully.');
    }
}