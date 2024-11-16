<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CustomerController extends Controller
{
    public function index()
    {
        $customers = Customer::where('status', 1)->get();
        return view('customers.index', compact('customers'));
    }

    public function create()
    {
        return view('customers.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required',  'max:255'],
            'email' => ['required', 'unique:customers', 'email'],
            'telephone' => ['required', 'unique:customers', 'regex:/^[0-9]{10}$/']
        ]);

        $customer = Customer::create($request->all());
        $customer->user_id = Auth::user()->id;
        $customer->save();

        return redirect()->route('customers')->with('success', 'Customer created successfully');
    }

    public function edit($id)
    {
        $customer = Customer::find($id);
        return view('customers.edit', compact('customer'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => ['required',  'max:255'],
            'email' => ['required', 'unique:customers,email,' . $id, 'email'],
            'telephone' => ['required', 'unique:customers,telephone,' . $id, 'regex:/^[0-9]{10}$/']
        ]);

        $customer = Customer::find($id);
        $customer->update($request->all());
        $customer->user_id = Auth::user()->id;
        $customer->save();

        return redirect()->route('customers')->with('success', 'Customer updated successfully');
    }

    public function destroy($id)
    {
        $customer = Customer::find($id);
        $customer->status = 0;
        $customer->user_id = Auth::user()->id;
        $customer->save();
        return redirect()->route('customers')->with('success', 'Customer deleted successfully');
    }
}
