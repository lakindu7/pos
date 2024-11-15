@extends('layouts.admin', ['pagetitle' => 'Products Management', 'subtitle' => 'Create Product', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create Product</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('products.store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control" id="txtName" name="name" required>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtNameSI">Name (Sinhala)</label>
                                        <input type="text" class="form-control" id="txtNameSI" name="name_si">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtBarcode">Barcode</label>
                                        <input type="text" class="form-control" id="txtBarcode" name="barcode">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="fleImage">Image</label>
                                        <input type="file" class="form-control" id="fleImage" name="image">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbCategory">Category</label>
                                        <select name="category_id" id="cmbCategory" class="form-control">
                                            <option value="" selected disabled>Select Category</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbSubcategory">Subcategory</label>
                                        <select name="subcategory_id" id="cmbSubcategory" class="form-control">
                                            <option value="" selected disabled>Select Subcategory</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbChildcategory">Child Category</label>
                                        <select name="childcategory_id" id="cmbChildcategory" class="form-control">
                                            <option value="" selected disabled>Select Child Category</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbBrand">Brand</label>
                                        <select name="brand_id" id="cmbBrand" class="form-control">
                                            @foreach ($brands as $brand)
                                                <option value="{{ $brand->id }}"
                                                    {{ $brand->name == 'No Brand' ? 'selected' : '' }}>{{ $brand->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbSecttion">Section</label>
                                        <select name="section_id" id="cmbSection" class="form-control">
                                            <option value="" selected disabled>Select Section</option>
                                            @foreach ($sections as $section)
                                                <option value="{{ $section->id }}">{{ $section->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbUnit">Unit *</label>
                                        <select name="sellingtype" id="cmbUnit" class="form-control" required>
                                            <option value="" selected disabled>Select Unit</option>
                                            <option value="Grams">Grams (g)</option>
                                            <option value="Pieces">Pieces</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="txtAlert">Stock Alert Limit
                                            <i class="gd-info-alt text-primary ml-1" data-toggle="tooltip"
                                                data-placement="top"
                                                title="Get alert when product stock reaches or goes below the specified quantity."></i>
                                        </label>
                                        <input type="number" class="form-control" id="txtAlert" name="alertlimit"
                                            value="0">
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="txtYoutube">Youtube Link</label>
                                        <input type="number" class="form-control" id="txtYoutube" name="youtubelink">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtDescription">Description</label>
                                        <textarea name="description" id="txtDescription" cols="30" rows="10"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-5">
                                <div class="col-12">
                                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Stock Details</h5>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="txtReference">Reference</label>
                                    <input type="text" class="form-control" id="txtReference" name="reference">
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="txtQuantity">Quantity *</label>
                                    <input type="number" class="form-control" id="txtQuantity" name="quantity"
                                        required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-4">
                                    <label for="txtPrice">Price *</label>
                                    <input type="number" class="form-control" id="txtPrice" name="price" required>
                                </div>
                                <div class="col-12 col-md-4">
                                    <label for="txtBuy">Buying Price *</label>
                                    <input type="number" class="form-control" id="txtBuy" name="buyingprice"
                                        required>
                                </div>
                                <div class="col-12 col-md-4">
                                    <label for="txtMarket">Market Price *</label>
                                    <input type="number" class="form-control" id="txtMarket" name="marketprice"
                                        required>
                                </div>
                            </div>
                            <input type="hidden" readonly name="user_id" value="{{ Auth::user()->id }}">
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        tinymce.init({
            selector: 'textarea',
            plugins: [
                'anchor', 'autolink', 'charmap', 'codesample', 'emoticons', 'image', 'link',
                'lists', 'media',
                'searchreplace', 'table', 'visualblocks', 'wordcount',
            ],
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat'
        });

        $(document).ready(function() {
            $('#cmbCategory').on('change', function() {
                var categoryId = $(this).val();
                if (categoryId) {
                    $.ajax({
                        url: '/get-subcategories/' + categoryId,
                        type: 'GET',
                        dataType: 'json',
                        success: function(data) {
                            $('#cmbSubcategory').empty().append(
                                '<option selected disabled>Select Subcategory</option>');
                            $('#cmbChildcategory').empty().append(
                                '<option selected disabled>Select Child Category</option>');
                            $.each(data, function(key, subcategory) {
                                $('#cmbSubcategory').append('<option value="' +
                                    subcategory.id + '">' + subcategory.name +
                                    '</option>');
                            });
                        }
                    });
                } else {
                    $('#cmbSubcategory').empty().append(
                        '<option selected disabled>Select Subcategory</option>');
                    $('#cmbChildcategory').empty().append(
                        '<option selected disabled>Select Child Category</option>');
                }
            });

            $('#cmbSubcategory').on('change', function() {
                var subcategoryId = $(this).val();
                if (subcategoryId) {
                    $.ajax({
                        url: '/get-childcategories/' + subcategoryId,
                        type: 'GET',
                        dataType: 'json',
                        success: function(data) {
                            $('#cmbChildcategory').empty().append(
                                '<option selected disabled>Select Child Category</option>');
                            $.each(data, function(key, childcategory) {
                                $('#cmbChildcategory').append('<option value="' +
                                    childcategory.id + '">' + childcategory.name +
                                    '</option>');
                            });
                        }
                    });
                } else {
                    $('#cmbChildcategory').empty().append(
                        '<option selected disabled>Select Child Category</option>');
                }
            });

            $(function() {
                $('[data-toggle="tooltip"]').tooltip({
                    html: true // Enable HTML content in the tooltip
                });
            });

        });
    </script>
@endpush
