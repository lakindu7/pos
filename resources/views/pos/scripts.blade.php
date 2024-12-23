<script>
    let outCredit = 0;
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
                    $('.topbar').addClass('credit-card');
                    $('#warningAudio').get(0).play();
                    $('#spnOut').html('LKR ' + outstanding);
                    $('.pulse-text').removeAttr('hidden');
                    outCredit = outstanding;
                } else {
                    $('#credit-section').attr('hidden', 'hidden');
                    $('.pulse-text').attr('hidden', 'hidden');
                }
            } else {
                toastr.warning('Please Select a Customer!', 'Warning');
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
                toastr.warning('Please Fill all required fields', 'Warning');
            }
        });
    });

    $('#txtBarcode').on('change', function() {
        let barcode = $(this).val();

        if (barcode.length >= 8) {
            $.ajax({
                url: '/get-product-id',
                method: 'POST',
                data: {
                    barcode: barcode,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    if (response.success) {
                        getStock(response.product_id);
                        $('#txtBarcode').val("");
                    } else {
                        toastr.error('Product Not Found', 'Error');
                    }
                },
                error: function() {
                    toastr.error('Something Went Wrong', 'Error');
                }
            });
        }
    });

    $('#txtCashPayment').on('keyup', function() {
        calculateBalance();
    })

    let isSubmitting = false;

    $('#frmInvoice').on('submit', function(event) {
        let customerid = $('#customerId').val();
        let rowCount = $('#tblBody tr').length;
        if (rowCount > 0) {
            if (!isSubmitting) {
                event.preventDefault();
                let balance = $('#txtBalance').val();
                if (balance < 0) {
                    if (customerid == "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "You are going to submit a CREDIT INVOICE, Please add a customer",
                        });
                    } else {
                        Swal.fire({
                            title: "Are you sure?",
                            text: "You are going to submit a Credit Invoice. Are you sure to do this?",
                            icon: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#3085d6",
                            cancelButtonColor: "#d33",
                            confirmButtonText: "Yes, Submit it!"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                submitInvoice();
                            }
                        });
                    }
                } else {
                    if (outCredit > 0) {
                        Swal.fire({
                            title: "Outstanding Credit",
                            text: "This customer has Outstanding Credit. Do you need to settle it from balance?",
                            icon: "warning",
                            showDenyButton: true,
                            showCancelButton: true,
                            confirmButtonText: "Yes, Settle it!",
                            denyButtonText: `Don't Settle!`
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $('#txtCreditSettle').val(1);
                                submitInvoice();
                            } else if (result.isDenied) {
                                submitInvoice();
                            }
                        });
                    } else {
                        Swal.fire({
                            title: "Are you sure?",
                            text: "You are about to submit this invoice",
                            icon: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#3085d6",
                            cancelButtonColor: "#d33",
                            confirmButtonText: "Yes, Submit it!"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                submitInvoice();
                            }
                        });
                    }
                }
            }
        } else {
            toastr.error('Please add products to the invoice.', 'Error');
            event.preventDefault();
        }
    });

    function submitInvoice() {
        const jsonData = getTableData();
        $('#txtInvoicedetails').val(jsonData);
        isSubmitting = true;
        $('#frmInvoice').submit();
    }

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
                                        <p class="card-text"><b>Expire Date: ${stockItem.expiredate}</b></p>
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
                        toastr.warning('Not Enough Stock Available!', 'Warning');
                    }
                } else {
                    console.log('Error: ' + response.message);
                }
            },
            error: function(xhr) {
                console.log('An error occurred: ' + xhr.status + ' ' + xhr.statusText);
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

        // if (productExists) {
        //     alert(`${productName} is already added to the table.`);
        //     return;
        // }

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
                toastr.warning(`The quantity cannot exceed the available stock of ${availableQuantity}.`,
                    'Warning');
                $(this).val(availableQuantity);
                quantity = availableQuantity;
                $(this).select();
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
        calculateDiscount();
    }

    function calculateBalance() {
        let payment = $('#txtCashPayment').val();
        if (payment != '') {
            let total = $('#spnPayable').html();
            let balance = payment - total;
            $('#spnBalance').html(`${balance.toFixed(2)}`);
            $('#txtBalance').val(`${balance.toFixed(2)}`);
        }

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

    function addDiscount() {
        let discounttype = $('#cmbType').val();
        let discount = $('#txtMDiscount').val();
        $('#txtDiscounttype').val(discounttype);
        $('#txtDiscount').val(discount);
        calculateDiscount();
        $('#discountModal').modal('hide');
    }

    function calculateDiscount() {
        let total = parseFloat($('#txtFulltotal').val()) || 0;
        let discounttype = $('#txtDiscounttype').val();
        let discount = parseFloat($('#txtDiscount').val()) || 0;
        let discountedTotal = 0;
        let disct = 0;

        if (discounttype === 'percentage') {
            disct = (discount / 100) * total;
            discountedTotal = total - disct;
            $('#spnDiscount').html(disct.toFixed(2));
            $('#spnPayable').html(discountedTotal.toFixed(2));
            $('#txtDiscountamount').val(disct.toFixed(2));
            $('#txtPayable').val(discountedTotal.toFixed(2));

        } else if (discounttype === 'amount') {
            discountedTotal = total - discount;
            disct = discount;
            $('#spnDiscount').html(disct.toFixed(2));
            $('#spnPayable').html(discountedTotal.toFixed(2));
            $('#txtDiscountamount').val(disct.toFixed(2));
            $('#txtPayable').val(discountedTotal.toFixed(2));

        } else {
            $('#spnDiscount').html("0.00");
            $('#spnPayable').html(total.toFixed(2));
            $('#txtDiscountamount').val(disct.toFixed(2));
            $('#txtPayable').val(discountedTotal.toFixed(2));
        }
    }

    $(function() {
        $('#txtInvoiceid').autocomplete({
            source: '/pos/invoice-ids',
            minLength: 2,
            select: function(event, ui) {
                const selectedInvoiceId = ui.item.value;
                $.ajax({
                    url: '/pos/invoice-details',
                    method: 'GET',
                    data: {
                        id: selectedInvoiceId
                    },
                    success: function(response) {
                        $('#invoiceDetails').html(`
                            <p><strong>Invoice ID:</strong> ${response.invoice_id}</p>
                            <p><strong>Date:</strong> ${response.date}</p>
                            <p><strong>Amount:</strong> ${response.amount}</p>
                            <p><strong>Customer Name:</strong> ${response.customer_name}</p>
                            <a href="/pos/cancel/${response.id}" class="btn btn-danger mt-3" onclick="return confirm('Are you sure you want to cancel?');">Cancel</a>
                        `);

                    },
                    error: function(xhr) {
                        $('#invoiceDetails').html(
                            '<p class="text-danger">Invoice not found.</p>');
                    }
                });
            }
        });
    });

    $('#cancelModal').on('shown.bs.modal', function() {
        $('#txtInvoiceid').focus();
    });

    $('#btnDayend').click(function() {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes"
        }).then((result) => {
            if (result.isConfirmed) {
                let url = "{{ route('dayend') }}";
                window.location.href = url;
            }
        });
    });
</script>
