@extends('layouts.admin', ['pagetitle' => 'Products Management', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">
                        {{ $product->name }}{{ $product->name_si ? ' - (' . $product->name_si . ')' : '' }}
                    </h5>
                    <div class="ml-auto">
                        <a href="{{ route('stocks.create', $product->id) }}" class="btn btn-primary btn-sm">Add Stock</a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Product Details </h5>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-4">
                                <p>
                                    <b>Product
                                        Name:</b>
                                    {{ $product->name }}{{ $product->name_si ? ' - (' . $product->name_si . ')' : '' }}
                                </p>
                                <p>
                                    <b>Barcode:</b>
                                    {{ $product->barcode ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>SKU:</b>
                                    {{ $product->sku ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>Alert Limit:</b>
                                    {{ $product->alertlimit }}
                                </p>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>
                                    <b>Selling Type:</b>
                                    {{ $product->sellingtype ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>Youtube Link:</b>
                                    {{ $product->youtubelink ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>Sales Section:</b>
                                    {{ $product->section->name ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>Supplier:</b>
                                    {{ $product->supplier->name ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>Created by at:</b>
                                    {{ $product->user->name . ' (' . $product->created_at->format('F d, Y') . ')' ?? 'N/A' }}
                                </p>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>
                                    <b>Category:</b>
                                    {{ $product->category->name }}
                                </p>
                                <p>
                                    <b>Subcategory:</b>
                                    {{ $product->subcategory->name ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>Child Category:</b>
                                    {{ $product->childcategory->name ?? 'N/A' }}
                                </p>
                                <p>
                                    <b>Brand:</b>
                                    {{ $product->brand->name ?? 'N/A' }}
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                @if ($product->description)
                                    <p>
                                        <b>Description:</b>
                                        {!! $product->description ?? 'N/A' !!}
                                    </p>
                                @endif
                            </div>
                        </div>
                        <div class="row pt-5">
                            <div class="col-12">
                                <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Stock Details </h5>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table text-nowrap mb-0 data-table-be">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Reference</th>
                                                <th>Quantity</th>
                                                <th>Available Quantity</th>
                                                <th>Price</th>
                                                <th>Buying Price</th>
                                                <th>Market Price</th>
                                                <th>Total</th>
                                                <th>Buying Total</th>
                                                <th>Exp Date</th>
                                                <th>Created By</th>
                                                <th>Created Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($stocks as $key => $stock)
                                                <tr>
                                                    <td class="py-3">{{ $key + 1 }}</td>
                                                    <td class="py-3">{{ $stock->reference }}</td>
                                                    <td class="py-3">
                                                        {{ $product->sellingtype == 'Grams' ? $stock->quantity / 1000 : $stock->quantity }}
                                                    </td>
                                                    <td class="py-3">
                                                        {{ $product->sellingtype == 'Grams' ? $stock->availablequantity / 1000 : $stock->availablequantity }}
                                                    </td>
                                                    <td class="py-3">{{ $stock->price }}</td>
                                                    <td class="py-3">{{ $stock->buyingprice }}</td>
                                                    <td class="py-3">{{ $stock->marketprice }}</td>
                                                    <td class="py-3">{{ $stock->total }}</td>
                                                    <td class="py-3">{{ $stock->buyingtotal }}</td>
                                                    <td class="py-3">{{ $stock->expiredate ?? '-' }}</td>
                                                    <td class="py-3">{{ $stock->user->name ?? '' }}</td>
                                                    <td class="py-3">{{ $stock->created_at->format('F d, Y') }}</td>
                                                    <td class="py-3">
                                                        <div class="position-relative d-flex">
                                                            <a class="link-dark d-inline-block mr-2"
                                                                href="{{ route('stocks.edit', $stock->id) }}">
                                                                <i class="gd-pencil icon-text"></i>
                                                            </a>
                                                            <form action="{{ route('stocks.destroy', $stock->id) }}"
                                                                method="POST"
                                                                onsubmit="return confirm('Are you sure you want to delete this stock?');">
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
