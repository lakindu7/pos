@extends('layouts.admin', ['pagetitle' => 'Purchases', 'subtitle' => 'Add New Purchase'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Add New Purchase</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('purchases.store') }}" method="post" enctype="multipart/form-data"
                        id="frmPurchases">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbSupplier">Supplier *</label>
                                        <select name="supplier_id" id="cmbSupplier" class="form-control ">
                                            <option value="" selected disabled>Select Supplier</option>
                                            @foreach ($suppliers as $supplier)
                                                <option value="{{ $supplier->id }}">{{ $supplier->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtReference">Reference</label>
                                        <input type="text" class="form-control" id="txtReference" name="reference">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="fleDocument">Attach Document</label>
                                    <input type="file" name="document" id="fleDocument" class="form-control"
                                        accept="image/*, application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="txtDate">Date</label>
                                    <input type="date" name="date" id="txtDate" class="form-control"
                                        value="{{ date('Y-m-d') }}" readonly>
                                </div>
                            </div>
                            <div class="row pt-4">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtProduct">Product</label>
                                        <input type="text" class="form-control" id="txtProduct"
                                            placeholder="Product Name / SKU">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtBarcode">Barcode</label>
                                        <input type="text" class="form-control" id="txtBarcode" name="barcode"
                                            placeholder="Barcode">
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-4">
                                <div class="col-12">
                                    <div class="invoice-table pt-3">
                                        <table class="table table-borderd table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Quantity</th>
                                                    <th>Buying Price</th>
                                                    <th>Unit Price</th>
                                                    <th>Market Price</th>
                                                    <th>Expire Date</th>
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
                            <div class="row pt-4">
                                <div class="col-12 text-right">
                                    <div>
                                        <strong>Item Count:</strong>
                                        <span id="itemCount">0</span>
                                    </div>
                                    <div>
                                        <strong>Grand Total:</strong>
                                        <span id="grandTotal">0.00</span>
                                    </div>
                                </div>
                            </div>
                            <textarea name="products" id="txtJson" cols="30" rows="10" hidden></textarea>
                            <div class="row pt-4">
                                <div class="col-12">
                                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Payment Details</h5>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="cmbPayment">Payment Method *</label>
                                    <select name="paymentmethod" id="cmbPayment" class="form-control">
                                        <option value="Cash" selected>Cash</option>
                                        <option value="Half">Half Payment</option>
                                        <option value="Credit">Credit Bill</option>
                                        <option value="Cheque">Cheque</option>
                                        <option value="Card">Card</option>
                                        <option value="Bank">Bank Transfer</option>
                                    </select>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="txtTotal">Total *</label>
                                    <input type="text" name="total" class="form-control" id="txtTotal" readonly>
                                </div>
                                <div class="col-12 col-md-6 pt-4">
                                    <label for="txtPayment">Payment *</label>
                                    <input type="text" name="payment" class="form-control" id="txtPayment" readonly
                                        required>
                                </div>
                                <div class="col-12 col-md-6 pt-4">
                                    <label for="txtBalance">Balance *</label>
                                    <input type="text" name="balance" class="form-control" id="txtBalance" required
                                        value="0" readonly>
                                </div>
                            </div>
                            <div class="row" id="paymentinfo">

                            </div>
                            <div class="row pt-4">
                                <div class="col-12 d-flex justify-content-end">
                                    <button class="btn btn-primary" id="submitBtn">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
<style>
    td input {
        width: 75% !important;
    }

    input[readonly] {
        background-color: transparent;
        color: #000000;
        cursor: not-allowed;
        border: none;
    }

    .invoice-table {
        max-height: 250px;
        overflow: auto;
    }
</style>
@push('js')
    <script>
        $(document).ready(function() {
            $('#cmbSupplier').select2({
                placeholder: 'Select Supplier',
                allowClear: true
            });

            $('#cmbPayment').change(function() {
                var paymentMethod = $(this).val();
                var paymentInfoHtml = '';

                $('#paymentinfo').html('');

                if (paymentMethod == 'Card') {
                    $('#txtPayment').attr("readonly", "readonly");
                    paymentInfoHtml += `
                            <div class="col-12 col-md-6 pt-4">
                                <label for="cardNumber">Card Number</label>
                                <input type="text" name="cardno" class="form-control" id="cardNumber">
                            </div>
                            <div class="col-12 col-md-6 pt-4">
                                <label for="paymentReference">Payment Reference</label>
                                <input type="text" name="paymentreference" class="form-control" id="paymentReference">
                            </div>
                            <div class="col-12 col-md-6 pt-4">
                                <label for="cardHolderName">Card Holder Name</label>
                                <input type="text" name="cardholdername" class="form-control" id="cardHolderName">
                            </div>
                        `;
                } else if (paymentMethod == 'Cheque') {
                    $('#txtPayment').attr("readonly", "readonly");
                    paymentInfoHtml += `
                            <div class="col-12 col-md-6 pt-4">
                                <label for="bank">Bank</label>
                                <input type="text" name="chequebank" class="form-control" id="bank">
                            </div>
                            <div class="col-12 col-md-6 pt-4">
                                <label for="chequeNo">Cheque No</label>
                                <input type="text" name="chequeno" class="form-control" id="chequeNo">
                            </div>
                            <div class="col-12 col-md-6 pt-4">
                                <label for="chequeDate">Cheque Date</label>
                                <input type="date" name="chequedate" class="form-control" id="chequeDate">
                            </div>
                        `;
                } else if (paymentMethod == 'Bank') {
                    $('#txtPayment').attr("readonly", "readonly");
                    paymentInfoHtml += `
                            <div class="col-12 col-md-6 pt-4">
                                <label for="paymentReference">Payment Reference</label>
                                <input type="text" name="paymentreference" class="form-control" id="paymentReference">
                            </div>
                            <div class="col-12 col-md-6 pt-4">
                                <label for="bankAccount">Bank Account</label>
                                <input type="text" name="bankaccount" class="form-control" id="bankAccount">
                            </div>
                            <div class="col-12 col-md-6 pt-4">
                                <label for="bankName">Bank</label>
                                <input type="text" name="bankname" class="form-control" id="bankName">
                            </div>
                            <div class="col-12 col-md-6 pt-4">
                                <label for="accountHolderName">Account Holder Name</label>
                                <input type="text" name="accountholdername" class="form-control" id="accountHolderName">
                            </div>
                            <div class="col-12 col-md-6 pt-4">
                                <label for="branch">Branch</label>
                                <input type="text" name="branch" class="form-control" id="branch">
                            </div>
                        `;
                } else if (paymentMethod == 'Credit') {
                    $('#txtPayment').attr("readonly", "readonly");
                    $('#txtPayment').val(0);
                    calculatePayment();
                } else if (paymentMethod == 'Half') {
                    $('#txtPayment').removeAttr("readonly");
                } else if (paymentMethod == 'Cash') {
                    $('#txtPayment').val($('#txtTotal').val());
                    $('#txtPayment').attr("readonly", "readonly");
                }
                $('#paymentinfo').html(paymentInfoHtml);
            });
        });

        $('#txtBarcode').on('change', function() {
            let barcode = $(this).val();
            const supplierId = $('#cmbSupplier').val();
            if (!supplierId) {
                alert("Please select a supplier.");
                $(this).val("");
                $('#cmbSupplier').focus();
                return;
            }
            if (barcode.length >= 8) {
                $.ajax({
                    url: `/get/products/barcode/${barcode}/${supplierId}`,
                    method: 'GET',
                    success: function(response) {
                        appendTable(response.name_si, response.id, response.sellingtype);
                        $('#txtBarcode').val("");
                    },
                    error: function() {
                        alert('Error retrieving product information.');
                    }
                });
            }
        });

        $('#txtProduct').autocomplete({
            source: function(request, response) {
                const supplierId = $('#cmbSupplier').val();
                if (!supplierId) {
                    alert("Please select a supplier.");
                    $('#cmbSupplier').focus();
                    return;
                }

                $.ajax({
                    url: '/purchases/autocomplete/products',
                    data: {
                        term: request.term,
                        supplier_id: $('#cmbSupplier').val()
                    },
                    success: function(data) {
                        response(data);
                    }
                });
            },
            minLength: 2,
            select: function(event, ui) {
                getProduct(ui.item.id);
                $('#txtProduct').val("");
                return false;
            }
        }).autocomplete('instance')._renderItem = function(ul, item) {
            return $('<li>')
                .append(`<div>${item.label}</div>`)
                .appendTo(ul);
        };

        function getProduct(productId) {
            if (!productId) {
                console.error("Invalid product ID provided");
                return;
            }
            $.ajax({
                url: `/get/products/${productId}`,
                method: 'GET',
                success: function(product) {
                    console.log("Product details:", product);
                    appendTable(product.name_si, product.id, product.sellingtype);
                },
                error: function(xhr, status, error) {
                    console.error("Failed to fetch product details:", error);
                }
            });
        }

        function appendTable(productName, productId, sellingtype) {
            let productExists = false;
            $('#tblBody tr').each(function() {
                const existingProductId = $(this).data('product-id');
                if (existingProductId == productId) {
                    productExists = true;
                    return false;
                }
            });

            if (productExists) {
                alert(`${productName} is already added to the table.`);
                return;
            }

            let markup = `
                <tr data-product-id="${productId}" id="row-${productId}" data-sellingtype="${sellingtype}" data-productname="${productName}">
                    <td>${productName}</td>
                    <td>
                        <input type="number" value="1" min="1" id="quantity-${productId}" class="quantity" onfocus="highlightMC(${productId})">
                    </td>
                       <td>
                        <input type="number" min="1" id="buyingprice-${productId}" class="buyingprice">
                    </td>
                    <td>
                        <input type="number" min="1" id="unitprice-${productId}" class="unitprice">
                    </td>
                    <td>
                        <input type="number" min="1" id="marketprice-${productId}" class="marketprice">
                    </td>
                    <td>
                        <input type="date" min="1" id="expiredate-${productId}" class="expiredate">
                    </td>
                    <td>
                        <input type="number" min="1" id="subtotal-${productId}" class="subtotal" readonly step="0.01">
                        <input type="number" min="1" id="unittotal-${productId}" class="unittotal" readonly step="0.01">
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" onclick="removeProduct(${productId})">
                            <i class="bi bi-x-lg"></i>
                        </button>
                    </td>
                </tr>
            `;

            $('#tblBody').append(markup);
            calculateItemCount();

            $(`#quantity-${productId}, #buyingprice-${productId},
            #unitprice-${productId}`).on('keyup', function() {
                const quantity = parseFloat($(`#quantity-${productId}`).val()) || 0;
                const price = parseFloat($(`#buyingprice-${productId}`).val()) || 0;
                const unitprice = parseFloat($(`#unitprice-${productId}`).val()) || 0;
                calculateTotal(productId, price, quantity, sellingtype, unitprice);
                calculateGrandTotal();
            });

            $(`#quantity-${productId}`).focus();
        }


        function calculateTotal(productId, price, quantity, sellingtype, unitprice) {
            let subtotal = 0;
            let unittotal = 0;
            if (sellingtype === 'Grams') {
                subtotal = (quantity * price) / 1000;
                unittotal = (quantity * unitprice) / 1000;
            } else {
                subtotal = quantity * price;
                unittotal = quantity * unitprice;
            }
            $(`#subtotal-${productId}`).val(subtotal.toFixed(
                2));
            $(`#unittotal-${productId}`).val(unittotal.toFixed(
                2));
        }

        function removeProduct(productId) {
            const isConfirmed = confirm("Are you sure you want to remove this product?");
            if (isConfirmed) {
                $(`#row-${productId}`).remove();
                calculateGrandTotal();
                calculateItemCount();
            }
        }

        function calculateGrandTotal() {
            let grandTotal = 0;
            $('#tblBody .subtotal').each(function() {
                const subtotal = parseFloat($(this).val()) || 0;
                grandTotal += subtotal;
            });

            $('#grandTotal').text(grandTotal.toFixed(2));
            $('#txtTotal').val(grandTotal.toFixed(2));
            $('#txtPayment').val(grandTotal.toFixed(2));
            calculatePayment();
        }

        $('#txtPayment').on('keyup', function() {
            calculatePayment();
        });

        function calculatePayment() {
            let total = $('#txtTotal').val();
            let payment = $('#txtPayment').val();
            let balance = total - payment;
            $('#txtBalance').val(balance.toFixed(2));
        }

        function calculateItemCount() {
            const itemCount = $('#tblBody tr').length;
            $('#itemCount').text(itemCount);
        }

        function highlightMC(productId) {
            $(`#quantity-${productId}`).select();
        }

        $('#submitBtn').on('click', function(e) {
            e.preventDefault();

            const paymentMethod = $('#cmbPayment').val();
            if (!paymentMethod) {
                alert("Please select a payment method.");
                return;
            }

            let rows = [];
            let allValid = true;

            $('#tblBody tr').each(function() {
                const productname = $(this).data('productname');
                const productId = $(this).data('product-id');
                const sellingtype = $(this).data('sellingtype');
                const quantity = parseFloat($(`#quantity-${productId}`).val()) || 0;
                const unitPrice = parseFloat($(`#unitprice-${productId}`).val()) || 0;
                const buyingPrice = parseFloat($(`#buyingprice-${productId}`).val()) || 0;
                const marketPrice = parseFloat($(`#marketprice-${productId}`).val()) || 0;
                const subtotal = parseFloat($(`#subtotal-${productId}`).val()) || 0;
                const unittotal = parseFloat($(`#unittotal-${productId}`).val()) || 0;
                const expiredate = $(`#expiredate-${productId}`).val();



                if (quantity <= 0 || unitPrice <= 0 || buyingPrice <= 0 || marketPrice <= 0 || subtotal <=
                    0 || unittotal <= 0) {
                    allValid = false;
                    $(this).addClass('error');
                    alert(`Please fill in all values for product: ${productname}.`);
                    return false;
                } else {
                    rows.push({
                        product_id: productId,
                        sellingtype: sellingtype,
                        quantity: quantity,
                        unit_price: unitPrice,
                        buying_price: buyingPrice,
                        market_price: marketPrice,
                        subtotal: subtotal,
                        unittotal: unittotal,
                        expiredate: expiredate,
                    });
                }
            });

            if (rows.length === 0) {
                alert("Please add at least one valid product to the table.");
                return;
            }

            const formData = {
                products: rows,
            };

            $('#txtJson').val(JSON.stringify(formData));
            if (allValid) {
                const userConfirmed = confirm('Are you sure you want to submit the form?');
                if (userConfirmed) {
                    $('#frmPurchases').submit();
                }
            }
        });
    </script>
@endpush
