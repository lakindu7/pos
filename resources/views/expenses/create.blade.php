@extends('layouts.admin', ['pagetitle' => 'Expenses', 'subtitle' => 'Create Expense', 'selectedlink' => 'Expenses'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create Expense</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('expenses.store') }}" method="post">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Reference</label>
                                        <input type="text" class="form-control" id="txtName" name="reference">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtAmount">Amount *</label>
                                        <input type="number" class="form-control" id="txtAmount" name="amount" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="expense_category_id">Expense Category *</label>
                                        <select class="form-control" id="expense_category_id" name="expense_category_id"
                                            required>
                                            <option value="" disabled selected>Select Category</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtExpenseNote">Expense Note</label>
                                        <textarea class="form-control" id="txtExpenseNote" name="expensenote" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" readonly name="user_id" value="{{ Auth::user()->id }}">
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
