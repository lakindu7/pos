@extends('layouts.admin', ['pagetitle' => 'Subcategory Management', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Subcategories</h5>
                    <div class="ml-auto">
                        <a href="{{ route('subcategories.create') }}" class="btn btn-primary btn-sm">Add New</a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table text-nowrap mb-0 data-table">
                                        <thead>
                                            <tr>
                                                <th class="font-weight-semi-bold border-top-0 py-2">#</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Name</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Description</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Category</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Created Date</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($subcategories as $key => $subcategory)
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="py-3">{{ $subcategory->name }}</td>
                                                    <td>{{ Str::limit($subcategory->description, 25, '...') }}</td>
                                                    <td>{{ $subcategory->category->name }}</td>
                                                    <td class="py-3">{{ $subcategory->created_at->format('F d, Y') }}</td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('subcategories.edit', $subcategory->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>
                                                            <form
                                                                action="{{ route('subcategories.destroy', $subcategory->id) }}"
                                                                method="POST"
                                                                onsubmit="return confirm('Are you sure you want to delete this subcategory?');">
                                                                @csrf
                                                                <button type="submit"
                                                                    class="btn btn-link p-0 link-dark d-inline-block">
                                                                    <i class="gd-trash icon-text"></i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
