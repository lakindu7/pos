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
                </div>
                <div class="row invoice-table pt-3">
                    <div class="col-12">
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
            <div class="col-12 col-md-5 products-area">
                <div class="row pt-4">
                    @foreach ($products as $key => $product)
                        <div class="col-12 col-md-3 text-center pb-3">
                            <div class="card pos-card d-flex justify-content-center align-items-center"
                                onclick="getStock({{ $product->id }})">
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
                            <h5>LKR <span id="spnGTotal">0</span> </h5>
                            <p>No. of Items: <span id="spnTotalItems">0</span></p>
                        </div>
                    </div>
                    <div class="col-12 text-center pt-2" id="credit-section" hidden>
                        <div class="card credit-card p-2">
                            <p>This Customer has outstanging payment of <span id="itemcount"> <b>LKR 2000</b></span></p>
                        </div>
                    </div>
                    <div class="col-12 pt-2 ">
                        <div class="card cash-card p-2">
                            <form action="{{ route('invoices.store') }}" id="frmInvoice" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <p><b>Cash Payment</b></p>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-12">
                                        <input type="number" name="payment" id="txtCashPayment" class="form-control"
                                            placeholder="Payment" required>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-12">
                                        <p>Balance: <b>LKR <span id="spnBalance">0</span></b></p>
                                        <input type="hidden" name="balance" id="txtBalance">
                                    </div>
                                </div>
                                <textarea name="invoicedetails" id="txtInvoicedetails" cols="30" rows="10" readonly hidden> </textarea>
                                <input type="hidden" class="form-control" id="txtCusName" name="name" readonly>
                                <input type="hidden" class="form-control" id="txtFulltotal" name="amount" readonly>
                                <input type="hidden" class="form-control" id="txtMarketTotal" name="markettotal"
                                    readonly>
                                <input type="hidden" class="form-control" id="txtBuyingTotal" name="buyingtotal"
                                    readonly>
                                <input type="hidden" class="form-control" id="txtTelephone" name="telephone" readonly>
                                <input type="hidden" id="customerId" name="customer_id" readonly>
                                <input type="hidden" id="txtEmail" name="email" readonly>
                                <input type="hidden" id="txtDOB" name="dob" readonly>
                                <input type="hidden" name="user_id" value="{{ Auth::user()->id }}" readonly>
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
                                <button type="button" id="btnCreatecus" class="btn btn-primary">Add Customer</button>
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
            $('#txtProduct').autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: '/autocomplete-products',
                        data: {
                            term: request.term
                        },
                        success: function(data) {
                            response(data);
                        }
                    });
                },
                minLength: 2,
                select: function(event, ui) {
                    getStock(ui.item.id);
                    $('#txtProduct').val("");
                    return false;
                }
            }).autocomplete('instance')._renderItem = function(ul, item) {
                return $('<li>')
                    .append(`<div>${item.label}</div>`)
                    .appendTo(ul);
            };


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
                    const outstanding = selectedRow.data('outstanding');

                    $('#customerId').val(customerId);
                    $('#txtName').val(customerName);
                    $('#txtCusName').val(customerName);
                    $('#txtTelephone').val(customerTelephone);
                    $('#txtEmail').val(customerEmail);
                    $('#txtDOB').val(customerDOB);

                    $('#customerModal').modal('hide');

                    if (outstanding > 0) {
                        $('#credit-section').removeAttr('hidden');
                        $('#warningAudio').get(0).play();
                    } else {
                        $('#credit-section').attr('hidden', 'hidden');
                    }
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

        $('#txtCashPayment').on('keyup', function() {
            calculateBalance();
        })

        let isSubmitting = false;

        $('#frmInvoice').on('submit', function(event) {
            if (!isSubmitting) {
                event.preventDefault();
                const jsonData = getTableData();
                $('#txtInvoicedetails').val(jsonData);
                isSubmitting = true;
                $(this).submit();
            }
        });

        function getStock(productId) {
            $.ajax({
                url: `/getstocks/${productId}`,
                method: 'GET',
                success: function(response) {
                    if (response.status === 'success') {
                        if (response.stock.length > 1) {
                            $('#stockCards').empty();
                            response.stock.forEach(function(stockItem) {
                                let quantity = stockItem.availablequantity;
                                let unit = "g";
                                if (stockItem.product && stockItem.product.sellingtype === "Grams" &&
                                    quantity > 1000) {
                                    quantity = quantity / 1000;
                                    unit = "kg";
                                }

                                const card = `
                            <div class="col-md-4">
                                <div class="card stock-card" data-productname ="${stockItem.product.name_si}"  data-stock-id="${stockItem.id}" data-product-id="${stockItem.product.id}"
                                data-product-price="${stockItem.price}" data-available-quantity="${stockItem.availablequantity}"
                                data-marketprice="${stockItem.marketprice}" data-buyingprice="${stockItem.buyingprice}" data-sellingtype="${stockItem.product.sellingtype}">
                                    <div class="card-body">
                                        <h5 class="card-title">${stockItem.product.name_si} (${stockItem.product.name})</h5>
                                        <p class="card-text">Quantity: ${quantity}${stockItem.product.sellingtype === "Grams" ? unit : "Pc"}</p>
                                        <p class="card-text">Price: LKR ${stockItem.price}</p>
                                        <p class="card-text">Market Price: LKR ${stockItem.marketprice}</p>
                                    </div>
                                </div>
                            </div>
                        `;
                                $('#stockCards').append(card);
                            });

                            $('#stockModal').modal('show');

                            $('.stock-card').on('click', function() {
                                $('.stock-card').removeClass('selected');
                                $(this).addClass('selected');

                                const productName = $(this).data('productname');
                                const productId = $(this).data('product-id');
                                const productPrice = $(this).data('product-price');
                                const availableQuantity = $(this).data('available-quantity');
                                const stockid = $(this).data('stock-id');
                                const sellingtype = $(this).data('sellingtype');
                                const marketprice = $(this).data('marketprice');
                                const buyingprice = $(this).data('buyingprice');

                                appendTable(productName, productId, productPrice, availableQuantity,
                                    stockid, sellingtype, marketprice, buyingprice);
                                $('#stockModal').modal('hide');
                                $(`#quantity-${productId}`).focus();
                            });
                        } else if (response.stock.length != 0) {
                            const productName = response.stock[0].product.name_si;
                            const productId = response.stock[0].product.id;
                            const sellingtype = response.stock[0].product.sellingtype;
                            const productPrice = response.stock[0].price;
                            const stockId = response.stock[0].id;
                            const marketprice = response.stock[0].marketprice;
                            const buyingprice = response.stock[0].buyingprice;
                            const availableQuantity = parseInt(response.stock[0].availablequantity);
                            appendTable(productName, productId, productPrice, availableQuantity, stockId,
                                sellingtype, marketprice, buyingprice);
                            $(`#quantity-${productId}`).focus();

                        } else {
                            alert('Not Enough Stock Available');
                        }
                    } else {
                        alert('Error: ' + response.message);
                    }
                },
                error: function(xhr) {
                    alert('An error occurred: ' + xhr.status + ' ' + xhr.statusText);
                }
            });
        }

        function highlightMC(productId) {
            $(`#quantity-${productId}`).select();
        }



        function removeProduct(productId) {
            const isConfirmed = confirm("Are you sure you want to remove this product?");
            if (isConfirmed) {
                $(`#row-${productId}`).remove();
                calculateGrandTotal();
            }
        }

        function appendTable(productName, productId, productPrice, availableQuantity, stockid, sellingtype, marketprice,
            buyingprice) {
            let productExists = false;
            $('#tblBody tr').each(function() {
                const existingProductId = $(this).data('product-id');
                const existingStockId = $(this).data('stockid');
                if (existingProductId == productId && existingStockId == stockid) {
                    productExists = true;
                    return false;
                }
            });

            if (productExists) {
                alert(`${productName} is already added to the table.`);
                return;
            }

            let markup = `
                        <tr data-product-id="${productId}" id="row-${productId}" data-stockid="${stockid}", data-marketprice="${marketprice}",
                        data-buyingprice="${buyingprice}">
                            <td>${productName}</td>
                            <td>
                                <input type="number" value="${productPrice}" min="1" id="price-${productId}" class="price" readonly>
                            </td>
                            <td  hidden>
                                <input type="number" value="${marketprice}" min="1" id="marketprice-${productId}" class="marketprice" readonly>
                            </td>
                            <td  hidden>
                                <input type="number" value="${buyingprice}" min="1" id="buyingprice-${productId}" class="buyingprice" readonly>
                            </td>
                            <td>
                                <input type="number" value="1" min="1" id="quantity-${productId}" class="quantity" onfocus="highlightMC(${productId})">
                            </td>
                            <td>
                                <input type="number" value="${productPrice}" min="1" id="subtotal-${productId}" class="subtotal" readonly>
                            </td>
                            <td hidden>
                                <input type="number" value="${marketprice}" min="1" id="markettotal-${productId}" class="markettotal" readonly>
                            </td>
                            <td hidden>
                                <input type="number" value="${buyingprice}" min="1" id="buyingtotal-${productId}" class="buyingtotal" readonly>
                            </td>
                            <td>
                                <button class="btn btn-danger" onclick="removeProduct(${productId})">
                                    <i class="bi bi-x-lg"></i>
                                </button>
                            </td>
                        </tr>
                    `;

            $('#tblBody').append(markup);

            calculateGrandTotal();

            $(`#quantity-${productId}`).on('input', function() {
                let quantity = parseInt($(this).val());

                if (quantity > availableQuantity) {
                    alert(
                        `The quantity cannot exceed the available stock of ${availableQuantity}.`
                    );
                    $(this).val(availableQuantity);
                    quantity = availableQuantity;
                }
                const price = parseFloat($(`#price-${productId}`).val());
                const marketprice = parseFloat($(`#marketprice-${productId}`).val());
                const buyingprice = parseFloat($(`#buyingprice-${productId}`).val());
                calculateTotal(productId, price, quantity, sellingtype, marketprice, buyingprice);
            });
        }

        function calculateTotal(productId, price, quantity, sellingtype, marketprice, buyingprice) {

            let subtotal = 0;
            let markettotal = 0;
            let buyingtotal = 0;

            if (sellingtype === 'Grams') {
                subtotal = (quantity * price) / 1000;
                markettotal = (quantity * marketprice) / 1000;
                buyingtotal = (quantity * buyingprice) / 1000;
                console.log(markettotal);
                console.log(buyingtotal);
            } else {
                subtotal = quantity * price;
                markettotal = quantity * marketprice;
                buyingtotal = quantity * buyingprice;
            }


            $(`#subtotal-${productId}`).val(subtotal.toFixed(
                2));
            $(`#markettotal-${productId}`).val(markettotal.toFixed(
                2));
            $(`#buyingtotal-${productId}`).val(buyingtotal.toFixed(
                2));
            calculateGrandTotal();
        }

        function calculateGrandTotal() {
            let grandTotal = 0;
            let totalItems = 0;
            let grandMarkettotal = 0;
            let grandBuyingtotal = 0;

            $('#tblBody .subtotal').each(function() {
                const subtotal = parseFloat($(this).val()) || 0;
                grandTotal += subtotal;
                totalItems += 1;
            });

            $('#tblBody .markettotal').each(function() {
                const markettotal = parseFloat($(this).val()) || 0;
                grandMarkettotal += markettotal;

            });

            $('#tblBody .buyingtotal').each(function() {
                const buyingtotal = parseFloat($(this).val()) || 0;
                grandBuyingtotal += buyingtotal;

            });

            $('#spnGTotal').html(`${grandTotal.toFixed(2)}`);
            $('#txtFulltotal').val(`${grandTotal.toFixed(2)}`);
            $('#txtMarketTotal').val(`${grandMarkettotal.toFixed(2)}`);
            $('#txtBuyingTotal').val(`${grandBuyingtotal.toFixed(2)}`);
            $('#spnTotalItems').html(`${totalItems}`);
            calculateBalance();
        }

        function calculateBalance() {
            let payment = $('#txtCashPayment').val();
            let total = $('#spnGTotal').html();
            let balance = payment - total;
            $('#spnBalance').html(`${balance.toFixed(2)}`);
            $('#txtBalance').val(`${balance.toFixed(2)}`);
        }

        function getTableData() {
            const rows = document.querySelectorAll('tr[data-product-id]');
            const data = [];

            rows.forEach(row => {
                const productId = row.getAttribute('data-product-id');
                const stockId = row.getAttribute('data-stockid');
                const marketprice = row.getAttribute('data-marketprice');
                const buyingprice = row.getAttribute('data-buyingprice');
                const productName = row.querySelector('td:nth-child(1)').innerText;
                const productPrice = row.querySelector(`#price-${productId}`).value;
                const quantity = row.querySelector(`#quantity-${productId}`).value;
                const subtotal = row.querySelector(`#subtotal-${productId}`).value;
                const markettotal = row.querySelector(`#markettotal-${productId}`).value;
                const buyingtotal = row.querySelector(`#buyingtotal-${productId}`).value;

                data.push({
                    productId,
                    stockId,
                    productName,
                    productPrice: parseFloat(productPrice),
                    quantity: parseInt(quantity, 10),
                    subtotal: parseFloat(subtotal),
                    markettotal: parseFloat(markettotal),
                    buyingtotal: parseFloat(buyingtotal),
                    marketprice: parseFloat(marketprice),
                    buyingprice: parseFloat(buyingprice)
                });
            });

            return JSON.stringify(data);
        }
    </script>
@endpush
