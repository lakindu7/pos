@extends('layouts.admin', ['pagetitle' => 'Products Management', 'subtitle' => 'Edit Product', 'selectedlink' => 'Products'])

@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Edit Product</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('products.update', $product->id) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="container-fluid">
                            <!-- Basic Information -->
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control" id="txtName" name="name"
                                            value="{{ $product->name }}" required>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtNameSI">Name (Sinhala)</label>
                                        <input type="text" class="form-control" id="txtNameSI" name="name_si"
                                            value="{{ $product->name_si }}">
                                    </div>
                                </div>
                            </div>

                            <!-- Barcode and Image -->
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtBarcode">Barcode</label>
                                        <input type="text" class="form-control" id="txtBarcode" name="barcode"
                                            value="{{ $product->barcode }}">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="fleImage">Image</label>
                                        <input type="file" class="form-control" id="fleImage" name="image">
                                        @if ($product->image)
                                            <small class="form-text text-muted">Current Image: <a
                                                    href="{{ asset('uploads/products/' . $product->id . '/' . $product->image) }}"
                                                    target="_blank">View</a></small>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <!-- Categories and Brand -->
                            <div class="row">
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbCategory">Category</label>
                                        <select name="category_id" id="cmbCategory" class="form-control">
                                            <option value="" disabled>Select Category</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}"
                                                    {{ $product->category_id == $category->id ? 'selected' : '' }}>
                                                    {{ $category->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbSubcategory">Subcategory</label>
                                        <select name="subcategory_id" id="cmbSubcategory" class="form-control">
                                            <option value="">Select Subcategory</option>
                                            @foreach ($subcategories as $subcategory)
                                                <option value="{{ $subcategory->id }}"
                                                    {{ $product->subcategory_id == $subcategory->id ? 'selected' : '' }}>
                                                    {{ $subcategory->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbChildcategory">Child Category</label>
                                        <select name="childcategory_id" id="cmbChildcategory" class="form-control">
                                            <option value="">Select Child Category</option>
                                            @foreach ($childcategories as $childcategory)
                                                <option value="{{ $childcategory->id }}"
                                                    {{ $product->childcategory_id == $childcategory->id ? 'selected' : '' }}>
                                                    {{ $childcategory->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbBrand">Brand</label>
                                        <select name="brand_id" id="cmbBrand" class="form-control">
                                            @foreach ($brands as $brand)
                                                <option value="{{ $brand->id }}"
                                                    {{ $product->brand_id == $brand->id ? 'selected' : '' }}>
                                                    {{ $brand->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <!-- Additional Details -->
                            <div class="row">
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbSection">Section</label>
                                        <select name="section_id" id="cmbSection" class="form-control">
                                            <option value="" disabled>Select Section</option>
                                            @foreach ($sections as $section)
                                                <option value="{{ $section->id }}"
                                                    {{ $product->section_id == $section->id ? 'selected' : '' }}>
                                                    {{ $section->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="cmbUnit">Unit *</label>
                                        <select name="sellingtype" id="cmbUnit" class="form-control" required>
                                            <option value="" disabled>Select Unit</option>
                                            <option value="Grams"
                                                {{ $product->sellingtype == 'Grams' ? 'selected' : '' }}>Grams (g)</option>
                                            <option value="Pieces"
                                                {{ $product->sellingtype == 'Pieces' ? 'selected' : '' }}>Pieces</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="txtAlert">Stock Alert Limit</label>
                                        <input type="number" class="form-control" id="txtAlert" name="alertlimit"
                                            value="{{ $product->alertlimit }}">
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <label for="txtYoutube">YouTube Link</label>
                                        <input type="url" class="form-control" id="txtYoutube" name="youtubelink"
                                            value="{{ $product->youtubelink }}">
                                    </div>
                                </div>
                            </div>

                            <!-- Description -->
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtDescription">Description</label>
                                        <textarea name="description" id="txtDescription" cols="30" rows="10" class="form-control">{{ $product->description }}</textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button class="btn btn-primary">Update</button>
                                </div>
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
                                '<option disabled selected>Select Subcategory</option>');
                            $('#cmbChildcategory').empty().append(
                                '<option disabled selected>Select Child Category</option>');
                            $.each(data, function(key, subcategory) {
                                $('#cmbSubcategory').append(
                                    `<option value="${subcategory.id}">${subcategory.name}</option>`
                                );
                            });
                        }
                    });
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
                                '<option disabled selected>Select Child Category</option>');
                            $.each(data, function(key, childcategory) {
                                $('#cmbChildcategory').append(
                                    `<option value="${childcategory.id}">${childcategory.name}</option>`
                                );
                            });
                        }
                    });
                }
            });
        });
    </script>
@endpush
