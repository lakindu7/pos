@extends('layouts.admin', ['pagetitle' => 'Supplier Management', 'subtitle' => 'Supplier View'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pt-5">
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Supplier Details </h5>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-4">
                                <p>
                                    <b>Supplier
                                        Name:</b>
                                    {{ $supplier->name }}
                                </p>
                                <p>
                                    <b>Primary Contact Person:</b>
                                    {{ ucwords($supplier->contactperson) }}
                                </p>
                                <p>
                                    <b>Primary Contact Number:</b>
                                    <a href="tel:{{ $supplier->telephone }}">{{ $supplier->telephone }}</a>
                                </p>
                                <p>
                                    <b>Created by:</b>
                                    {{ $supplier->user->name . ' (' . $supplier->created_at->format('F d, Y') . ')' ?? 'N/A' }}
                                </p>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>
                                    <b>Delivery Day:</b>
                                    {{ ucwords($supplier->delivaryday) }}
                                </p>
                                <p>
                                    <b>Delivery Frequency:</b>
                                    {{ ucwords($supplier->frequency) }}
                                </p>
                                <p>
                                    <b>Last Delivery:</b>
                                    {{ $supplier->lastdelivary ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>Est. Next Delivery:</b>
                                    {{ $supplier->nextdelivary ?? 'N/A' }}
                                </p>
                            </div>
                        </div>
                        <div class="row pt-5 pb-5">
                            <div class="col-12 col-md-6">
                                <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Contacts </h5>
                            </div>
                            <div class="col-12 col-md-6 d-flex justify-content-end">
                                <a href="{{ route('suppliercontact.create', $supplier->id) }}" id="addContactButton"
                                    class="btn btn-success">
                                    <i class="bi bi-plus-circle"></i> Add Contact
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table text-nowrap mb-0 data-table-be">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Contact Person</th>
                                                <th>Designation</th>
                                                <th>Contact Number</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($supplier->suppliercontacts as $key => $contact)
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="py-3">{{ $contact->name }}</td>
                                                    <td class="py-3">{{ $contact->position }}</td>
                                                    <td class="py-3">{{ $contact->telephone }}</td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('suppliercontact.edit', $contact->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>
                                                            <form
                                                                action="{{ route('suppliercontact.destroy', $contact->id) }}"
                                                                method="POST"
                                                                onsubmit="return confirm('Are you sure you want to delete this contact?');">
                                                                @csrf
                                                                <button type="submit"
                                                                    class="btn btn-link p-0 link-dark d-inline-block">
                                                                    <i class="gd-trash icon-text"></i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
