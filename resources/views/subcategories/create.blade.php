@extends('layouts.admin', ['pagetitle' => 'Subcategory Management', 'subtitle' => 'Create Subcategory', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create Subcategory</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('subcategories.store') }}" method="post" enctype="multipart/form-data">
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
                                        <label for="cmbCategory">Image</label>
                                        <select name="category_id" id="cmbCategory" class="form-control" required>
                                            <option value="" selected disabled>Select Category</option>
                                            @foreach ($categories as $key => $category)
                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="fleImage">Image</label>
                                        <input type="file" class="form-control" id="fleImage" name="image"
                                            accept="image/*">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtDescription">Description</label>
                                        <textarea name="description" id="txtDescription" cols="30" rows="4" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
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
