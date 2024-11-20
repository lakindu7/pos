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
            <div class="col-12 col-md-7 pt-3">
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
                </div>
                <div class="row pt-1">
                    <div class="col-12">
                        <div class="invoice-table pt-3">
                            <table class="table table-borderd table-striped">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Unit Price</th>
                                        <th>Quantity</th>
                                        <th>Subtotal</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody id="tblBody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-5 products-area">
                <div class="row pt-4">
                    @foreach ($products as $key => $product)
                        <div class="col-12 col-md-3 text-center pb-3">
                            <div class="card pos-card d-flex justify-content-center align-items-center"
                                onclick="getStock({{ $product->id }})">
                                <div class="row">
                                    <div class="col-12">
                                        @if ($product->image != null)
                                            <img src="{{ asset('uploads/products/' . $product->id . '/' . $product->image . '') }}"
                                                alt="" style="width:auto; max-height:48px">
                                        @else
                                            <img src="{{ asset('dist/img/logo-mini.png') }}" alt=""
                                                style="width:auto; max-height:48px">
                                        @endif

                                    </div>
                                    <div class="col-12">
                                        <p>{{ ucwords(Str::limit($product->name_si, 12, '...')) }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="row pt-2 pb-2">
                <div class="col-12 col-md-3">
                    <div class="card payable-card bottom-panel p-2">
                        <div class="row">
                            <div class="col-6">
                                <p>Total: <span id="spnGTotal">0</span></p>
                            </div>
                            <div class="col-6">
                                <p># Items: <span id="spnTotalItems">0</span></p>
                            </div>
                        </div>
                        <p>Discount: <span id="spnDiscount">0</span></p>
                        <h6>Total Payable: LKR <span id="spnPayable">0</span></h6>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card cash-card bottom-panel ps-2">
                        <form action="{{ route('invoices.store') }}" id="frmInvoice" method="POST">
                            @csrf
                            <textarea name="invoicedetails" id="txtInvoicedetails" cols="30" rows="10" readonly hidden> </textarea>
                            <input type="hidden" class="form-control" id="txtCusName" name="name" readonly>
                            <input type="hidden" class="form-control" id="txtFulltotal" name="amount" readonly>
                            <input type="hidden" class="form-control" id="txtDiscounttype" name="discounttype" readonly>
                            <input type="hidden" class="form-control" id="txtDiscount" name="discount" readonly>
                            <input type="hidden" class="form-control" id="txtPayable" name="payable" readonly>
                            <input type="hidden" class="form-control" id="txtDiscountamount" name="discountamount"
                                readonly>
                            <input type="hidden" class="form-control" id="txtMarketTotal" name="markettotal" readonly>
                            <input type="hidden" class="form-control" id="txtBuyingTotal" name="buyingtotal" readonly>
                            <input type="hidden" class="form-control" id="txtTelephone" name="telephone" readonly>
                            <input type="hidden" id="customerId" name="customer_id" readonly>
                            <input type="hidden" id="txtEmail" name="email" readonly>
                            <input type="hidden" id="txtDOB" name="dob" readonly>
                            <input type="hidden" name="user_id" value="{{ Auth::user()->id }}" readonly>
                            <div class="row pt-2">
                                <div class="col-6">
                                    <input type="number" name="payment" id="txtCashPayment" class="form-control"
                                        placeholder="Payment" required>
                                    <p>Balance: <b>LKR <span id="spnBalance">0</span></b></p>
                                    <input type="hidden" name="balance" id="txtBalance">
                                </div>
                                <div class="col-6">
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#discountModal"><i class="bi bi-plus"></i>
                                        Discount</button>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card other-card bottom-panel p-1 text-center">
                        <div class="row">
                            <div class="col-12">
                                <p><b>Other Payment Methods</b></p>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-12">
                                <a href="#" class="btn btn-danger flex-fill"><i class="bi bi-wallet"></i>
                                    Credit</a>
                                <a href="#" class="btn btn-success flex-fill"> <i
                                        class="bi bi-credit-card-2-front"></i> Card</a>
                                <a href="#" class="btn btn-warning flex-fill"><i class="bi bi-qr-code-scan"></i>
                                    QR</a>
                                <a href="#" class="btn btn-primary flex-fill"><i class="bi bi-cash-coin"></i>
                                    Multi</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-1">
                    <div class="card transcation-card bottom-panel text-center">
                        <p>Recent Transactions </p>
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
                                            data-dob="{{ $customer->dob }}"
                                            data-outstanding="{{ $customer->outstandingbalance }}">
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
                                <button type="button" id="btnCreatecus" class="btn btn-primary">Add
                                    Customer</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="stockModal" tabindex="-1" aria-labelledby="stockModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="stockModalLabel">Stock Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="stockCards" class="row g-3">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="discountModal" tabindex="-1" aria-labelledby="discountModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="discountModalLabel">Add Discount</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 form-group">
                                <label for="cmbType" class="pb-2">DiscountType</label>
                                <select class="form-control" id="cmbType" required>
                                    <option value="" selected>No discount</option>
                                    <option value="amount">Amount</option>
                                    <option value="percentage">Percentage</option>
                                </select>
                            </div>
                            <div class="col-12 form-group pt-3">
                                <label for="txtDiscount" class="pb-2">Discount Amount/Percentage</label>
                                <input type="number" class="form-control" id="txtMDiscount" required>
                            </div>
                            <div class="col-12 d-flex pt-3 justify-content-end">
                                <button type="button" class="btn btn-primary" onclick="addDiscount()">Add</button>
                            </div>
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
    @include('pos.scripts')
@endpush
