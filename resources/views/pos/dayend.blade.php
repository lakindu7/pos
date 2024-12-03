@extends('layouts.pos')
@section('content')
    <div class="container-fluid d-flex flex-column min-vh-100">
        <div class="row">
            <div class="col-12 topbar">
                <div class="row">
                    <div class="col-12 text-center">
                        <p><b id="timeDisplay"></b></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row flex-grow-1 pt-5">
            <div class="col-12 col-md-6">
                <div class="card p-4">
                    <div class="row">
                        <div class="col-12">
                            <h4>Summary - {{ $date }}</h4>
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Payment Method</th>
                                        <th>Income</th>
                                        <th>Expense</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Cash in Hand</td>
                                        <td>{{ 'Rs. ' . number_format($totalAmount + $dailydetail->startingbalance - ($totalExpense + $totalPurchase), 2) }}
                                        </td>
                                        <td>-</td>
                                    </tr>
                                    <tr>
                                        <td>Cash Payment:</td>
                                        <td>{{ 'Rs. ' . number_format($totalAmount, 2) }}</td>
                                        <td>{{ 'Rs. ' . number_format($totalExpense + $totalPurchase, 2) }}</td>
                                    </tr>
                                    <tr>
                                        <td>Cheque Payment:</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Card Payment:</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Bank Transfer:</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>QR Payment:</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row footer d-flex flex-column ">
            <div class="col-12 ">
                &copy; Retailly {{ date('Y') }} <a href="https://teksalad.com/" target="_blank">TekSalad (Pvt)
                    Ltd</a>.
                All
                Rights Reserved.
            </div>
        </div>
    @endsection
