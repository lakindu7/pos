@extends('layouts.admin', ['pagetitle' => 'Supplier Management'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Suppliers</h5>
                    <div class="ml-auto">
                        <a href="{{ route('suppliers.create') }}" class="btn btn-primary btn-sm">Add New</a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive-xl">
                                    <table class="table text-nowrap mb-0 data-table">
                                        <thead>
                                            <tr>
                                                <th class="font-weight-semi-bold border-top-0 py-2">#</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Name</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Contact Person</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Telephone</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Delivary Day</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Delivary Frequency</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Est. Next Delivery</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Created Date</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($suppliers as $key => $supplier)
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="py-3">{{ $supplier->name }}</td>
                                                    <td class="py-3">{{ $supplier->contactperson }}</td>
                                                    <td class="py-3">{{ $supplier->telephone }}</td>
                                                    <td class="py-3">{{ ucfirst($supplier->delivaryday) }}</td>
                                                    <td class="py-3">{{ ucfirst($supplier->frequency) }}</td>
                                                    <td class="py-3">{{ $supplier->nextdelivary }}</td>
                                                    <td class="py-3">{{ $supplier->created_at->format('F d, Y') }}</td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('suppliers.edit', $supplier->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>
                                                            <form action="{{ route('suppliers.destroy', $supplier->id) }}"
                                                                method="POST"
                                                                onsubmit="return confirm('Are you sure you want to delete this supplier?');">
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
