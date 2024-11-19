@extends('layouts.admin', ['pagetitle' => 'Invoice Management', 'subtitle' => 'Create Invoice'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create Invoice</h5>
                </div>
                <div class="card-body p-0">
                    <form action="" method="post">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <button type="button" id="openModal" class="btn btn-info">Add Customer</button>
                                </div>
                            </div>
                            <div class="row pt-4">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Customer Name</label>
                                        <input type="text" class="form-control" id="txtName" name="name" readonly>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Telephone</label>
                                        <input type="text" class="form-control" id="txtTelephone" name="telephone"
                                            readonly>
                                    </div>
                                </div>
                                <input type="hidden" id="customerId" name="customerid" readonly>
                                <input type="hidden" id="txtEmail" name="email" readonly>
                                <input type="hidden" id="txtDOB" name="dob" readonly>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-12">
                                    <div class="form-group">
                                        <label for="txtProductName">Product</label>
                                        <input type="text" class="form-control" id="txtProductName">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('modal-content')
    <div class="modal-header">
        <h5 class="modal-title" id="customerModalLabel">Select Customer</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
        <ul class="nav nav-tabs" id="customerTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="select-customer-tab" data-toggle="tab" href="#select-customer" role="tab"
                    aria-controls="select-customer" aria-selected="true">Select Customer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="add-customer-tab" data-toggle="tab" href="#add-customer" role="tab"
                    aria-controls="add-customer" aria-selected="false">Add Customer</a>
            </li>
        </ul>
        <div class="tab-content" id="customerTabContent">
            <div class="tab-pane fade show active" id="select-customer" role="tabpanel"
                aria-labelledby="select-customer-tab">
                <table class="table table-hover text-nowrap mb-0 data-table">
                    <thead>
                        <tr>
                            <th class="font-weight-semi-bold border-top-0 py-2">#</th>
                            <th class="font-weight-semi-bold border-top-0 py-2">Name</th>
                            <th class="font-weight-semi-bold border-top-0 py-2">Telephone</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($customers as $key => $customer)
                            <tr data-id="{{ $customer->id }}" data-telephone="{{ $customer->telephone }}"
                                data-name="{{ $customer->name }}" data-email="{{ $customer->email }}"
                                data-dob="{{ $customer->dob }}">
                                <td class="py-3">{{ $key + 1 }}</td>
                                <td class="py-3">{{ $customer->name }}</td>
                                <td class="py-3">{{ $customer->telephone }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="add-customer" role="tabpanel" aria-labelledby="add-customer-tab">
                <form id="addCustomerForm">
                    <div class="row pt-4">
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="txtName">Name *</label>
                                <input type="text" class="form-control @error('name') is-invalid @enderror"
                                    id="newtxtName" name="name" value="{{ old('name') }}" required>
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="txtTelephone">Telephone *</label>
                                <input type="number" class="form-control @error('telephone') is-invalid @enderror"
                                    id="newtxtTelephone" name="telephone" value="{{ old('telephone') }}" required>
                                @error('telephone')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="txtEmail">Email</label>
                                <input type="email" class="form-control @error('email') is-invalid @enderror"
                                    id="newtxtEmail" name="email" value="{{ old('email') }}">
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="txtDOB">Date of Birth</label>
                                <input type="date" class="form-control @error('dob') is-invalid @enderror"
                                    id="newtxtDOB" name="dob" value="{{ old('dob') }}">
                                @error('dob')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <button type="button" id="btnCreatecus" class="btn btn-primary">Add Customer</button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary modal-close" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="selectCustomerButton">Select</button>
    </div>
@endsection
@push('js')
    <script>
        $(document).ready(function() {
            $("#openModal").click(function() {
                $("#myModal").fadeIn();
            });
            $(".close, #closeModal,.modal-close").click(function() {
                $("#myModal").fadeOut();
            });
            $(window).click(function(event) {
                if ($(event.target).is("#myModal")) {
                    $("#myModal").fadeOut();
                }
            });
        });

        $(document).ready(function() {
            let selectedRow = null;
            $('.dataTable tbody').on('click', 'tr', function() {
                if (selectedRow) {
                    selectedRow.removeClass('selected');
                }
                $(this).addClass('selected');
                selectedRow = $(this);
            });

            $('#selectCustomerButton').on('click', function() {
                if (selectedRow) {
                    const customerId = selectedRow.data('id');
                    const customerName = selectedRow.data('name');
                    const customerTelephone = selectedRow.data('telephone');
                    const customerEmail = selectedRow.data('email');
                    const customerDOB = selectedRow.data('dob');

                    $('#customerId').val(customerId);
                    $('#txtName').val(customerName);
                    $('#txtTelephone').val(customerTelephone);
                    $('#txtEmail').val(customerEmail);
                    $('#txtDOB').val(customerDOB);

                    $("#myModal").fadeOut();
                } else {
                    alert('Please select a customer.');
                }
            });

            $('#btnCreatecus').on('click', function(e) {
                e.preventDefault();
                const name = $('#newtxtName').val();
                const telephone = $('#newtxtTelephone').val();
                const email = $('#newtxtEmail').val();
                const dob = $('#newtxtDOB').val();

                if (name != "" && telephone != "") {
                    const newRow = `
                    <tr data-id="new" data-name="${name}" data-telephone="${telephone}" data-email="${email}" data-dob="${dob}" >
                        <td>#</td>
                        <td>${name}</td>
                        <td>${telephone}</td>
                    </tr>
                `;

                    $('.dataTable tbody').prepend(newRow);

                    $('#newtxtName').val("");
                    $('#newtxtTelephone').val("");
                    $('#newtxtEmail').val("");
                    $('#newtxtDOB').val("");

                    $('#select-customer-tab').tab('show');
                } else {
                    alert('Please fill out all required fields.');
                }

            });
        });
    </script>
@endpush
