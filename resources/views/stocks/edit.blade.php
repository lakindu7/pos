@extends('layouts.admin', ['pagetitle' => 'Stocks Management', 'subtitle' => 'Edit Stock', 'selectedlink' => 'Products'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Add Stocks</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('stocks.update', $stock->id) }}" method="post">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6 form-group">
                                    <label for="txtReference">Reference</label>
                                    <input type="text" class="form-control" id="txtReference" name="reference"
                                        value="{{ $stock->reference }}">
                                </div>
                                <div class="col-12 col-md-6 form-group">
                                    <label for="txtQuantity">Quantity *</label>
                                    <input type="number" class="form-control" id="txtQuantity" name="quantity" required
                                        value="{{ $stock->quantity }}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-4 form-group">
                                    <label for="txtPrice">Price *</label>
                                    <input type="number" class="form-control" id="txtPrice" name="price" required
                                        value="{{ $stock->price }}">
                                </div>
                                <div class="col-12 col-md-4 form-group">
                                    <label for="txtBuy">Buying Price *</label>
                                    <input type="number" class="form-control" id="txtBuy" name="buyingprice" required
                                        value="{{ $stock->buyingprice }}">
                                </div>
                                <div class="col-12 col-md-4 form-group">
                                    <label for="txtMarket">Market Price *</label>
                                    <input type="number" class="form-control" id="txtMarket" name="marketprice" required
                                        value="{{ $stock->marketprice }}">
                                </div>
                            </div>
                            <input type="hidden" readonly name="user_id" value="{{ Auth::user()->id }}">
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
