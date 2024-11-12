@extends('layouts.admin', ['pagetitle' => 'Category Management', 'subtitle' => 'Edit Category', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Edit Category</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('categories.update', $category->id) }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control" id="txtName" name="name"
                                            value="{{ old('name', $category->name) }}" required>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="fleImage">Image</label>
                                        <input type="file" class="form-control" id="fleImage" name="image"
                                            accept="image/*">
                                        @if ($category->image)
                                            <small class="form-text text-muted">Current Image: <a
                                                    href="{{ asset('uploads/categories/' . $category->id . '/' . $category->image) }}"
                                                    target="_blank">View</a></small>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtDescription">Description</label>
                                        <textarea name="description" id="txtDescription" cols="30" rows="4" class="form-control">{{ old('description', $category->description) }}</textarea>
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
