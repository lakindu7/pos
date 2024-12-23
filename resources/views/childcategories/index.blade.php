@extends('layouts.admin', ['pagetitle' => 'Child Category Management', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Child Categories</h5>
                    <div class="ml-auto">
                        <a href="{{ route('childcategories.create') }}" class="btn btn-primary btn-sm">Add New</a>
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
                                                <th class="font-weight-semi-bold border-top-0 py-2">Subcategory</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Created Date</th>
                                                <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($childcategories as $key => $childcategory)
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="py-3">{{ $childcategory->name }}</td>
                                                    <td>{{ Str::limit($childcategory->description, 25, '...') }}</td>
                                                    <td>{{ $childcategory->category->name }}</td>
                                                    <td>{{ $childcategory->subcategory->name }}</td>
                                                    <td class="py-3">{{ $childcategory->created_at->format('F d, Y') }}
                                                    </td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('childcategories.edit', $childcategory->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>
                                                            <form
                                                                action="{{ route('childcategories.destroy', $childcategory->id) }}"
                                                                method="POST"
                                                                onsubmit="return confirm('Are you sure you want to delete this childcategory?');">
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
