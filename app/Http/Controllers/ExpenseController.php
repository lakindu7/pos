<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use App\Models\ExpenseCategory;
use Illuminate\Http\Request;

class ExpenseController extends Controller
{
    public function index()
    {
        $expenses = Expense::with('category')->where('status', 1)->get();
        return view('expenses.index', compact('expenses'));
    }

    public function create()
    {
        $categories = ExpenseCategory::where('status', 1)->where('id', '!=', 1)->get();
        return view('expenses.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $expense = Expense::create($request->all());
        if ($request->has('submitlocation') && $request->submitlocation == "pos") {
            return redirect()->route('pos')->with('success', 'Expense created successfully.');
        } else {
            return redirect()->route('expenses')->with('success', 'Expense created successfully.');
        }
    }


    public function edit($id)
    {
        $expense = Expense::find($id);
        $categories = ExpenseCategory::where('status', 1)->where('id', '!=', 1)->get();
        return view('expenses.edit', compact('expense', 'categories'));
    }

    public function update(Request $request, $id)
    {
        $expense = Expense::findOrFail($id);
        $expense->update($request->all());
        return redirect()->route('expenses')->with('success', 'Expense updated successfully.');
    }

    public function destroy($id)
    {
        $expense = Expense::findOrFail($id);
        $expense->status = 0;
        $expense->save();
        return redirect()->route('expenses')->with('success', 'Expense deleted successfully.');
    }
}
