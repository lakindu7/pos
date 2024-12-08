@extends('layouts.admin', ['pagetitle' => 'Offers', 'subtitle' => 'Create Offer', 'selectedlink' => 'Promotions'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create Offer</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('offers.store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" value="{{ Auth::user()->id }}" name="user_id" readonly>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtName">Offer Name *</label>
                                        <input type="text" class="form-control" id="txtName" name="name" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbOffer">Offer *</label>
                                        <select name="offer" id="cmbOffer" class="form-control">
                                            <option value="" selected disabled>Select Offer</option>
                                            <option value="free">Free Item</option>
                                            <option value="discount">Discount</option>
                                            <option value="voucher">Gift Voucher</option>
                                            <option value="delivery">Free Delivery</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbOfferCondition">Offer Type *</label>
                                        <select name="offertype" id="cmbOfferCondition" class="form-control">
                                            <option value="" selected disabled>Select Offer Type</option>
                                            <option value="total">Total Bill</option>
                                            <option value="product">Products</option>
                                            <option value="category">Product Category</option>
                                            <option value="sales">Sales Section</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtMinval">Min Bill Value *</label>
                                        <input type="number" id="txtMinval" class="form-control" name="minval"
                                            value="1">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtDate">Valid Till</label>
                                        <input type="date" name="vaildtill" id="txtDate" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <span id="spnMarkup"></span>

                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button type="button" class="btn btn-primary" id="getTableData">Submit</button>
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
    .ui-autocomplete {
        z-index: 5000;
        position: absolute;
        background-color: white
    }
</style>
@push('js')
    <script>
        $(document).ready(function() {
            $('#productTable').on('click', '.delete-row', function() {
                $(this).closest('tr').remove();
            });
        });

        function productAuto() {
            $('#txtProduct').autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: '/offers/search-products',
                        type: 'GET',
                        data: {
                            term: request.term
                        },
                        success: function(data) {
                            response(data);
                        }
                    });
                },
                select: function(event, ui) {
                    const productId = ui.item.id;
                    const productName = ui.item.label;

                    const newRow = `
                <tr data-productid='${productId}' id='product-row-${productId}'>
                    <td id='product-name-${productId}'>${productName}</td>
                    <td id='product-quantity-${productId}'>
                        <input type="number" class="form-control" value="1" min="1" id='quantity-${productId}'>
                    </td>
                    <td><button class="btn btn-danger btn-sm delete-row" data-productid="${productId}">Delete</button></td>
                </tr>`;
                    $('#productTable tbody').append(newRow);

                    $('#txtProduct').val('');
                    return false;
                }
            });
        }

        $('#getTableData').on('click', function() {
            if ($('#productTable').length) {
                const tableData = [];
                $('#productTable tbody tr').each(function() {
                    const productId = $(this).data('productid');
                    const productName = $(`#product-name-${productId}`).text();
                    const quantity = $(`#quantity-${productId}`).val();

                    tableData.push({
                        product_id: productId,
                        product_name: productName,
                        quantity: quantity
                    });
                });
                $('#txtProducts').val(JSON.stringify(tableData));
            } else {
                // The table does not exist
                console.log('productTable does not exist');
            }
        });



        $(document).on('change', '#cmbOffer, #cmbOfferCondition', function() {
            appendfields();
        });

        function appendfields() {
            let offer = $('#cmbOffer').val();
            let condition = $('#cmbOfferCondition').val();
            let html = "";
            $('#spnMarkup').empty();
            if (offer == "discount" && condition == "total") {
                html = `<div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtDiscountVal">Discount Value *</label>
                                        <input type="number" id="txtDiscountVal" class="form-control" name="discountvalue">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbDiscounttype">Discount Type *</label>
                                        <select name="discounttype" id="cmbDiscounttype" class="form-control">
                                            <option value="" selected disabled>Select Discount Type</option>
                                            <option value="percentage">Percentage</option>
                                            <option value="amount">Value</option>
                                        </select>
                                    </div>
                                </div>
                            </div>`;
            }
            if (offer == "free" && condition == "total") {
                html =
                    ` <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtProduct">Product</label>
                                        <input type="text" class="form-control" id="txtProduct" onkeyup= "productAuto()">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <table class="table table-stripe table-hover" id="productTable">
                                        <thead>
                                            <tr>
                                                <td>Product</td>
                                                <td>Quantity</td>
                                                <td>Delete</td>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                            <textarea name="productsforFreeTotalbill" id="txtProducts" cols="30" rows="10" hidden></textarea>
                            `;
            }

            $('#spnMarkup').append(html)

        }
    </script>
@endpush
