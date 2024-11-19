@extends('layouts.admin', ['pagetitle' => 'Stocks Management', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Products</h5>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive-xl">
                                    <table class="table text-nowrap mb-0 data-table-be">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Sinhala Name</th>
                                                <th>SKU</th>
                                                <th>Selling Type</th>
                                                <th>Category</th>
                                                <th>Subcategory</th>
                                                <th>Child Category</th>
                                                <th>Brand</th>
                                                <th>Supplier</th>
                                                <th>Created By</th>
                                                <th>Created Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
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

@push('js')
    <script>
        $(document).ready(function() {
            $('.data-table-be').DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{ route('stocks') }}',
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'name_si',
                        name: 'name_si'
                    },
                    {
                        data: 'sku',
                        name: 'sku'
                    },
                    {
                        data: 'sellingtype',
                        name: 'sellingtype'
                    },
                    {
                        data: 'category',
                        name: 'category.name'
                    },
                    {
                        data: 'subcategory',
                        name: 'subcategory.name'
                    },
                    {
                        data: 'childcategory',
                        name: 'childcategory.name'
                    },
                    {
                        data: 'brand',
                        name: 'brand.name'
                    },
                    {
                        data: 'supplier',
                        name: 'supplier.name',
                        searchable: false
                    },
                    {
                        data: 'created_by',
                        name: 'user.name'
                    },
                    {
                        data: 'created_date',
                        name: 'created_at'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    }
                ]
            });
        });
    </script>
@endpush
