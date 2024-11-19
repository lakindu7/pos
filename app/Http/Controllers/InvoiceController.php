<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function index() {}

    public function create()
    {
        $customers = Customer::where('status', 1)->get();
        return view('invoices.create', compact('customers'));
    }
}
