@extends('layouts.pos')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 topbar">
                <div class="row">
                    <div class="col-4">
                        <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#expenseModal"><i
                                class="bi bi-cash-coin"></i> Add Expense</button>
                        <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#cancelModal"><i
                                class="bi bi-receipt-cutoff"></i> Cancel Invoice</button>
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
                    <div class="card transcation-card bottom-panel text-center" data-bs-toggle="modal"
                        data-bs-target="#trasactionModal">
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



    @if ($dayEndcompleted != '')
        @include('pos.components.dayendnotcomp')
    @endif
    @include('pos.components.daystart')

    @include('pos.components.customer')
    @include('pos.components.stock')
    @include('pos.components.discount')
    @include('pos.components.expense', ['categories' => $categories])
    @include('pos.components.transactions', ['recenttransactions' => $recenttransactions])
    @include('pos.components.cancel')
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
    {{-- @if ($dayEndcompleted == '') --}}
    @if ($startday == false)
        <script>
            $(document).ready(function() {
                var myModal = new bootstrap.Modal($('#staticBackdrop')[0]);
                myModal.show();
            });
        </script>
    @endif
    {{-- @else --}}
    <script>
        $(document).ready(function() {
            var myModal = new bootstrap.Modal($('#dayendNot')[0]);
            myModal.show();
        });
    </script>
    {{-- @endif --}}
@endpush
