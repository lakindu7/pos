@extends('layouts.admin', ['pagetitle' => 'Customer Management'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Customers</h5>
                    <div class="ml-auto">
                        <a href="{{ route('customers.create') }}" class="btn btn-primary btn-sm">Add New</a>
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
                                                <th class="font-weight-semi-bold border-top-0 py-2">Telephone</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Email</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Date of Birth</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Created Date</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($customers as $key => $customer)
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="py-3">{{ $customer->name }}</td>
                                                    <td class="py-3">{{ $customer->telephone }}</td>
                                                    <td class="py-3">{{ $customer->email }}</td>
                                                    <td class="py-3">{{ $customer->dob }}</td>
                                                    <td class="py-3">{{ $customer->created_at->format('F d, Y') }}</td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('customers.edit', $customer->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>
                                                            <form action="{{ route('customers.destroy', $customer->id) }}"
                                                                method="POST"
                                                                onsubmit="return confirm('Are you sure you want to delete this customer?');">
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
