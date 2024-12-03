<?php

namespace App\Http\Controllers;

use App\Models\SupllierContact;
use App\Models\Supplier;
use Illuminate\Http\Request;

class SupplierController extends Controller
{
    public function index()
    {
        $suppliers = Supplier::where('status', 1)->get();
        return view('suppliers.index', compact('suppliers'));
    }

    public function view($id)
    {
        $supplier = Supplier::with(
            'user',
            'suppliercontacts'
        )->find($id);
        return view('suppliers.view', compact('supplier'));
    }

    public function create()
    {
        return view('suppliers.create');
    }

    public function store(Request $request)
    {
        $supplier = Supplier::create($request->all());
        $contacts = json_decode($request->contacts);
        foreach ($contacts as $contact) {
            $supcontact = new SupllierContact();
            $supcontact->name = $contact->contactperson;
            $supcontact->telephone = $contact->telephone;
            $supcontact->position = $contact->designation;
            $supcontact->supplier_id = $supplier->id;
            $supcontact->save();
        }

        return redirect()->route('suppliers')->with('success', 'Supplier created successfully.');
    }

    public function edit($id)
    {
        $supplier = Supplier::find($id);
        return view('suppliers.edit', compact('supplier'));
    }

    public function update(Request $request, $id)
    {
        $supplier = Supplier::findOrFail($id);
        $supplier->update($request->all());
        return redirect()->route('suppliers')->with('success', 'Supplier updated successfully.');
    }

    public function destroy($id)
    {
        $supplier = Supplier::find($id);
        $supplier->status = 0;
        $supplier->save();
        return redirect()->route('suppliers')->with('success', 'Supplier deleted successfully.');
    }

    public function contactcreate($id)
    {
        $supplier = Supplier::find($id);
        return view('suppliers.createcontact', compact('supplier'));
    }

    public function contactstore(Request $request, $id)
    {
        $contacts = json_decode($request->contacts);
        foreach ($contacts as $contact) {
            $supcontact = new SupllierContact();
            $supcontact->name = $contact->contactperson;
            $supcontact->telephone = $contact->telephone;
            $supcontact->position = $contact->designation;
            $supcontact->supplier_id = $id;
            $supcontact->save();
        }
        return redirect()->route('suppliers.view', $id)->with('success', 'Supplier contact created successfully.');
    }

    public function contactedit($id)
    {
        $contact = SupllierContact::find($id);
        return view('suppliers.contactedit', compact('contact'));
    }

    public function contactupdate(Request $request, $id)
    {
        $contact = SupllierContact::find($id);
        $contact->update($request->all());
        return redirect()->route('suppliers.view', $contact->supplier_id)->with('success', 'Supplier contact updated successfully.');
    }

    public function contactdelete($id)
    {
        $contact = SupllierContact::find($id);
        $contact->delete();
        return redirect()->route('suppliers.view', $contact->supplier_id)->with('success', 'Supplier contact deleted successfully.');
    }
}
