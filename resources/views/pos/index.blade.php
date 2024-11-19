@extends('layouts.pos')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 topbar">
                <div class="row">
                    <div class="col-4">
                        <button class="btn btn-warning btn-sm"><i class="bi bi-cash-coin"></i> Add Expense</button>
                        <button class="btn btn-primary btn-sm"><i class="bi bi-receipt-cutoff"></i> Sales
                            Details</button>
                        <button class="btn btn-info btn-sm"><i class="bi bi-arrow-left-right"></i> Exchange</button>
                    </div>
                    <div class="col-4 text-center">
                        <p><b id="timeDisplay"></b></p>
                    </div>
                    <div class="col-4 d-flex justify-content-end">
                        <span>
                            <button class="btn btn-danger btn-sm"><i class="bi bi-calendar3"></i> Day End</button>
                            <button class="btn btn-success btn-sm"><i class="bi bi-person-fill"></i>
                                {{ Auth::user()->name }}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row register-area">
            <div class="col-12 col-md-5 pt-3">
                <div class="row">
                    <div class="col-12 col-md-10">
                        <div class="form-group">
                            <input type="text" class="form-control" id="txtProduct" placeholder="Product Name / SKU">
                        </div>
                    </div>
                    <div class="col-12 col-md-2 d-flex justify-content-end">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#customerModal">
                            Customer
                        </button>
                    </div>
                </div>
                <div class="row pt-3">
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <input type="text" class="form-control" id="txtBarcode" name="barcode" placeholder="Barcode">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <input type="text" class="form-control" id="txtName" name="name" readonly
                                placeholder="Customer Name">
                        </div>
                    </div>
                    <input type="hidden" class="form-control" id="txtTelephone" name="telephone" readonly>
                    <input type="hidden" id="customerId" name="customerid" readonly>
                    <input type="hidden" id="txtEmail" name="email" readonly>
                    <input type="hidden" id="txtDOB" name="dob" readonly>
                </div>
                <div class="row invoice-table pt-3">
                    <div class="col-12">
                        <table class="table table-borderd table-striped">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carrot</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Papadam</td>
                                    <td>
                                        <input type="number" value="1">
                                    </td>
                                    <td> 500</td>
                                    <td>
                                        <button class="btn btn-danger">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-5 products-area">
                <div class="row pt-4">
                    @foreach ($products as $key => $product)
                        <div class="col-12 col-md-3 text-center pb-3">
                            <div class="card pos-card d-flex justify-content-center align-items-center">
                                <div class="row">
                                    <div class="col-12">
                                        <img src="{{ asset('uploads/products/1/680b5fbb-eca8-4fda-ab02-bd93ee7073d5.jpg') }}"
                                            alt="" style="width:auto; max-height:48px">
                                    </div>
                                    <div class="col-12">
                                        <p>{{ ucwords(Str::limit($product->name_si, 12, '...')) }}</p>
                                        <p><b>2500/-</b></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-12 col-md-2">
                <div class="row">
                    <div class="col-12 text-center">
                        <div class="card p-2">
                            <h5>Total Payable:</h5>
                            <h5>LKR 5000</h5>
                            <p>No. of Items: <span id="itemcount">10</span></p>
                        </div>
                    </div>
                    <div class="col-12 text-center pt-2" hidden>
                        <div class="card credit-card p-2">
                            <p>This Customer has outstanging payment of <span id="itemcount"> <b>LKR 2000</b></span></p>
                        </div>
                    </div>
                    <div class="col-12 pt-2 ">
                        <div class="card cash-card p-2">
                            <form action="goofl">
                                <div class="row">
                                    <div class="col-12">
                                        <p><b>Cash Payment</b></p>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-12">
                                        <input type="number" id="txtCashPayment" class="form-control"
                                            placeholder="Payment" required>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-12">
                                        <p>Balance: <b>LKR 2500</b></p>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 pt-2 ">
                        <div class="card other-card p-2">
                            <form action="goofl">
                                <div class="row">
                                    <div class="col-12">
                                        <p><b>Other Payment Methods</b></p>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-12">
                                        <div class="d-flex gap-2">
                                            <a href="#" class="btn btn-danger flex-fill"><i
                                                    class="bi bi-wallet"></i> Credit</a>
                                            <a href="#" class="btn btn-success flex-fill"> <i
                                                    class="bi bi-credit-card-2-front"></i> Card</a>
                                        </div>
                                    </div>
                                    <div class="col-12 pt-1">
                                        <div class="d-flex gap-2">
                                            <a href="#" class="btn btn-warning flex-fill"><i
                                                    class="bi bi-qr-code-scan"></i> QR</a>
                                            <a href="#" class="btn btn-primary flex-fill"><i
                                                    class="bi bi-cash-coin"></i> Multi</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row footer">
            <div class="col-12 ">
                &copy; Retailly {{ date('Y') }} <a href="https://teksalad.com/" target="_blank">TekSalad (Pvt)
                    Ltd</a>.
                All
                Rights Reserved.
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="customerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="customerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="customerModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs" id="customerTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="select-customer-tab" data-bs-toggle="tab"
                                href="#select-customer" role="tab" aria-controls="select-customer"
                                aria-selected="true">Select Customer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="add-customer-tab" data-bs-toggle="tab" href="#add-customer"
                                role="tab" aria-controls="add-customer" aria-selected="false">Add Customer</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="customerTabContent">
                        <div class="tab-pane fade show active" id="select-customer" role="tabpanel"
                            aria-labelledby="select-customer-tab">
                            <table class="table table-hover dataTable text-nowrap mb-0 data-table">
                                <thead>
                                    <tr>
                                        <th class="font-weight-semi-bold border-top-0 py-2">#</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">Name</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">Telephone</th>
                                    </tr>
                                </thead>
                                <tbody class="">
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
                            <div class="row pt-4">
                                <div class="col-12">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" id="selectCustomerButton">Select
                                        Customer</button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="add-customer" role="tabpanel" aria-labelledby="add-customer-tab">
                            <form id="addCustomerForm">
                                <div class="row pt-4 pb-4">
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
                                            <input type="number"
                                                class="form-control @error('telephone') is-invalid @enderror"
                                                id="newtxtTelephone" name="telephone" value="{{ old('telephone') }}"
                                                required>
                                            @error('telephone')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row pb-4">
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label for="txtEmail">Email</label>
                                            <input type="email"
                                                class="form-control @error('email') is-invalid @enderror" id="newtxtEmail"
                                                name="email" value="{{ old('email') }}">
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
            </div>
        </div>
    </div>
@endsection
<style>
    .table-hover tbody tr:hover {
        background-color: #f5f5f5;
        cursor: pointer;
    }

    .selected {
        background-color: #007bff !important;
        color: #fff !important;
    }
</style>
@push('js')
    <script>
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

                    $('#customerModal').modal('hide');
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
