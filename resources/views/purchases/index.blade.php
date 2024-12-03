@extends('layouts.admin', ['pagetitle' => 'Purchases'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Purchases</h5>
                    <div class="ml-auto">
                        <a href="{{ route('purchases.create') }}" class="btn btn-primary btn-sm">Add New</a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table text-nowrap mb-0 data-table">
                                        <thead>
                                            <tr>
                                                <th class="font-weight-semi-bold border-top-0 py-2">#</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Purchase Id</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Total</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Payment</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Balance</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Payment Method</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Supplier</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Created Date</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($purchases as $key => $purchase)
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="py-3">{{ $purchase->purchaseid }}</td>
                                                    <td class="py-3">{{ $purchase->total }}</td>
                                                    <td class="py-3">{{ $purchase->payment }}</td>
                                                    <td class="py-3">{{ $purchase->balance }}</td>
                                                    <td class="py-3">
                                                        @if ($purchase->paymentmethod === 'Cash')
                                                            <span class="badge bg-success">Cash</span>
                                                        @elseif ($purchase->paymentmethod === 'Credit')
                                                            <span class="badge bg-danger">Credit</span>
                                                        @elseif ($purchase->paymentmethod === 'Half')
                                                            <span class="badge bg-warning text-dark">Half</span>
                                                        @else
                                                            <span
                                                                class="badge bg-primary">{{ $purchase->paymentmethod }}</span>
                                                        @endif
                                                    </td>
                                                    <td class="py-3">{{ $purchase->supplier->name }}</td>
                                                    <td class="py-3">{{ $purchase->created_at->format('F d, Y') }}</td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('purchases.edit', $purchase->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>
                                                            <form action="{{ route('purchases.destroy', $purchase->id) }}"
                                                                method="POST"
                                                                onsubmit="return confirm('Are you sure you want to delete this purchase?');">
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
