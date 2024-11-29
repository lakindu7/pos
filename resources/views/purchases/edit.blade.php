@extends('layouts.admin', ['pagetitle' => 'Purchases', 'subtitle' => 'Edit Purchase'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Edit Purchase</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('purchases.update', $purchase->id) }}" method="post" enctype="multipart/form-data"
                        id="frmPurchases">
                        @csrf
                        @method('PUT')
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbSupplier">Supplier *</label>
                                        <select name="supplier_id" id="cmbSupplier" class="form-control">
                                            <option value="" disabled>Select Supplier</option>
                                            @foreach ($suppliers as $supplier)
                                                <option value="{{ $supplier->id }}"
                                                    {{ $purchase->supplier_id == $supplier->id ? 'selected' : '' }}>
                                                    {{ $supplier->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtReference">Reference</label>
                                        <input type="text" class="form-control" id="txtReference" name="reference"
                                            value="{{ $purchase->reference }}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="fleDocument">Attach Document</label>
                                    <input type="file" name="document" id="fleDocument" class="form-control"
                                        accept="image/*, application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
                                    @if ($purchase->document)
                                        <small class="text-muted">Current Document: <a
                                                href="{{ asset('/uploads/purchases/' . $purchase->id . '/document/' . $purchase->document) }}"
                                                target="_blank">View</a></small>
                                    @endif
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="txtDate">Date</label>
                                    <input type="date" name="date" id="txtDate" class="form-control"
                                        value="{{ $purchase->created_at->format('Y-m-d') }}" readonly>
                                </div>
                            </div>
                            <div class="row pt-4">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtProduct">Product</label>
                                        <input type="text" class="form-control" id="txtProduct"
                                            placeholder="Product Name / SKU">
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-4">
                                <div class="col-12">
                                    <div class="invoice-table pt-3">
                                        <table class="table table-borderd table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Quantity</th>
                                                    <th>Unit Price</th>
                                                    <th>Buying Price</th>
                                                    <th>Market Price</th>
                                                    <th>Subtotal</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            {{-- <tbody id="tblBody">
                                                @foreach ($stocks as $product)
                                                    <tr data-product-id="{{ $product->id }}" id="row-{{ $product->id }}"
                                                        data-sellingtype="{{ $product->sellingtype }}"
                                                        data-productname="{{ $product->name }}">
                                                        <td>{{ $product->name }}</td>
                                                        <td>
                                                            <input type="number" value="{{ $product->pivot->quantity }}"
                                                                min="1" id="quantity-{{ $product->id }}"
                                                                class="quantity">
                                                        </td>
                                                        <td>
                                                            <input type="number" value="{{ $product->pivot->unit_price }}"
                                                                min="1" id="unitprice-{{ $product->id }}"
                                                                class="unitprice">
                                                        </td>
                                                        <td>
                                                            <input type="number"
                                                                value="{{ $product->pivot->buying_price }}" min="1"
                                                                id="buyingprice-{{ $product->id }}" class="buyingprice">
                                                        </td>
                                                        <td>
                                                            <input type="number"
                                                                value="{{ $product->pivot->market_price }}" min="1"
                                                                id="marketprice-{{ $product->id }}" class="marketprice">
                                                        </td>
                                                        <td>
                                                            <input type="number" value="{{ $product->pivot->subtotal }}"
                                                                min="1" id="subtotal-{{ $product->id }}"
                                                                class="subtotal" readonly>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-danger"
                                                                onclick="removeProduct({{ $product->id }})">
                                                                <i class="bi bi-x-lg"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody> --}}
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-4">
                                <div class="col-12 text-right">
                                    <div>
                                        <strong>Item Count:</strong>
                                        {{-- <span id="itemCount">{{ $purchase->products->count() }}</span> --}}
                                    </div>
                                    <div>
                                        <strong>Grand Total:</strong>
                                        <span id="grandTotal">{{ number_format($purchase->grand_total, 2) }}</span>
                                    </div>
                                </div>
                            </div>
                            <textarea name="products" id="txtJson" cols="30" rows="10" hidden></textarea>
                            <div class="row pt-4">
                                <div class="col-12">
                                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Payment Details</h5>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <label for="cmbPayment">Payment Method *</label>
                                    <select name="paymentmethod" id="cmbPayment" class="form-control">
                                        <option value="" disabled>Select Payment Method</option>
                                        <option value="Cash" {{ $purchase->payment_method == 'Cash' ? 'selected' : '' }}>
                                            Cash</option>
                                        <option value="Credit"
                                            {{ $purchase->payment_method == 'Credit' ? 'selected' : '' }}>Credit Bill
                                        </option>
                                        <option value="Cheque"
                                            {{ $purchase->payment_method == 'Cheque' ? 'selected' : '' }}>Cheque</option>
                                        <option value="Card" {{ $purchase->payment_method == 'Card' ? 'selected' : '' }}>
                                            Card</option>
                                        <option value="Bank" {{ $purchase->payment_method == 'Bank' ? 'selected' : '' }}>
                                            Bank Transfer
                                        </option>
                                    </select>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="txtTotal">Total *</label>
                                    <input type="text" name="total" class="form-control" id="txtTotal"
                                        value="{{ number_format($purchase->grand_total, 2) }}">
                                </div>
                            </div>
                            <div class="row" id="paymentinfo">
                                <!-- Populate payment info based on the existing payment method -->
                            </div>
                            <div class="row pt-4">
                                <div class="col-12 d-flex justify-content-end">
                                    <button class="btn btn-primary" id="submitBtn">Update</button>
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
        $(document).ready(function() {
            // Adjust JavaScript logic as needed for editing
        });
    </script>
@endpush
