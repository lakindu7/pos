@extends('layouts.admin', ['pagetitle' => 'Subcategory Management', 'subtitle' => 'Edit Subcategory', 'selectedlink' => 'Products'])

@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Edit Subcategory</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('subcategories.update', $subcategory->id) }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control" id="txtName" name="name"
                                            value="{{ old('name', $subcategory->name) }}" required>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbCategory">Category *</label>
                                        <select name="category_id" id="cmbCategory" class="form-control" required>
                                            <option value="" disabled>Select Category</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}"
                                                    {{ $subcategory->category_id == $category->id ? 'selected' : '' }}>
                                                    {{ $category->name }}
                                                </option>
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
                                        @if ($subcategory->image)
                                            <small class="form-text text-muted">Current Image: <a
                                                    href="{{ asset('uploads/subcategories/' . $subcategory->id . '/' . $subcategory->image) }}"
                                                    target="_blank">View</a></small>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtDescription">Description</label>
                                        <textarea name="description" id="txtDescription" cols="30" rows="4" class="form-control">{{ old('description', $subcategory->description) }}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button class="btn btn-primary">Update</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
