@extends('layouts.admin', ['pagetitle' => 'Invoice Management'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">All Invoices</h5>
                    <div class="ml-auto">
                        <a href="{{ route('pos') }}" target="_blank" class="btn btn-primary btn-sm">Add New</a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table text-nowrap mb-0 yajra-datatable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Invoice ID</th>
                                                <th>Invoice Type</th>
                                                <th>Amount</th>
                                                <th>Payment</th>
                                                <th>Balance</th>
                                                <th>Points</th>
                                                <th>Customer Name</th>
                                                <th>Action</th>
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
            var table = $('.yajra-datatable').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('invoices') }}",
                columns: [{
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'invoiceid',
                        name: 'invoiceid'
                    },
                    {
                        data: 'invoicetype',
                        name: 'invoicetype'
                    },
                    {
                        data: 'amount',
                        name: 'amount'
                    },
                    {
                        data: 'payment',
                        name: 'payment'
                    },
                    {
                        data: 'balance',
                        name: 'balance'
                    },
                    {
                        data: 'points',
                        name: 'points'
                    },
                    {
                        data: 'customer_name',
                        name: 'customer_name',
                        orderable: false,
                        searchable: false
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
