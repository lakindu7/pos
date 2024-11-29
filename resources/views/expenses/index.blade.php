@extends('layouts.admin', ['pagetitle' => 'Expenses', 'selectedlink' => 'Expenses'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Expenses</h5>
                    <div class="ml-auto">
                        <a href="{{ route('expenses.create') }}" class="btn btn-primary btn-sm">Add New</a>
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
                                                <th class="font-weight-semi-bold border-top-0 py-2">Expense Id</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Reference</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Category</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Amount</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Created Date</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($expenses as $key => $expense)
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="py-3">{{ $expense->expenseid }}</td>
                                                    <td class="py-3">{{ $expense->reference }}</td>
                                                    <td class="py-3">{{ $expense->category->name }}</td>
                                                    <td class="py-3">{{ $expense->amount }}</td>
                                                    <td class="py-3">{{ $expense->created_at->format('F d, Y') }}</td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('expenses.edit', $expense->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>

                                                            <form action="{{ route('expenses.destroy', $expense->id) }}"
                                                                method="POST"
                                                                onsubmit="return confirm('Are you sure you want to delete this expense?');">
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
