@extends('layouts.admin', ['pagetitle' => 'Sections Management', 'subtitle' => 'Edit Section', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Edit Section</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('sections.update', $section->id) }}" method="post">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control" id="txtName" name="name"
                                            value="{{ old('name', $section->name) }}" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtDescription">Description</label>
                                        <textarea name="description" id="txtDescription" cols="30" rows="4" class="form-control">{{ old('description', $section->description) }}</textarea>
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
