@extends('layouts.admin', ['pagetitle' => 'Dashboard'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Dashboard</h5>
                    <div class="ml-auto">
                        <a href="{{ route('pos') }}" class="btn btn-primary btn-sm" target="_blank">New Invoice</a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-md-4">
                                <div class="card shadow p-4">
                                    <h5>Daily Summary</h5>
                                    <hr>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Income</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalincome ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Purchasing</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalpurchase ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Expenses</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalexpense ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Profit/Loss</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($profit ?? 0, 2) }}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="card shadow p-4">
                                    <h5>Last 30 Days Summary</h5>
                                    <hr>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Income</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalpurchase30 ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Purchasing</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalincome30 ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Expenses</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalexpense30 ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Profit/Loss</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($profit30 ?? 0, 2) }}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="card shadow p-4">
                                    <h5>Last 365 Days Summary</h5>
                                    <hr>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Income</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalpurchase365 ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Purchasing</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalincome365 ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Total Expenses</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($totalexpense365 ?? 0, 2) }}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <p>Profit/Loss</p>
                                        </div>
                                        <div class="col-6 text-right">{{ number_format($profit365 ?? 0, 2) }}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row pt-4">
                            <div class="col-12 col-md-4">
                                <div class="card shadow p-4">
                                    <h5>Daily Invoice Count</h5>
                                    <hr>
                                    <canvas id="twoHourIntervalChart"></canvas>
                                    <button id="refreshChartBtn" style="margin-top: 20px;"> <i id="refreshBtn"
                                            class="gd-reload icon-text align-middle"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="row pt-4">
                            <div class="col-12">
                                <div class="card shadow p-4">
                                    <h5>Total Sale (Last 30 Days)</h5>
                                    <hr>
                                    <canvas id="dailyTotalsChart"></canvas>
                                    <button id="refreshChartBtn" style="margin-top: 20px;"> <i id="refreshBtn"
                                            class="gd-reload icon-text align-middle"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .card {
            position: relative;
        }

        #refreshChartBtn {
            position: absolute;
            right: 7px;
            top: -15px;
            background-color: transparent;
            border: none;
        }
    </style>
@endsection
@push('js')
    <script>
        $(document).ready(function() {
            // fetchChartData();
            $.ajax({
                url: "{{ route('invoices.chartData') }}",
                method: "GET",
                success: function(data) {
                    // Preprocess labels to include day names
                    const labelsWithDayNames = data.dailyTotals.labels.map(label => {
                        const date = new Date(label); // Convert to Date object
                        const dayName = date.toLocaleString('en-US', {
                            weekday: 'short'
                        }); // Get short day name (e.g., Mon, Tue)
                        return `${label} (${dayName})`; // Combine date and day name
                    });

                    const dailyCtx = $('#dailyTotalsChart')[0].getContext('2d');
                    new Chart(dailyCtx, {
                        type: 'line',
                        data: {
                            labels: labelsWithDayNames, // Use modified labels
                            datasets: [{
                                label: 'Total Sale',
                                data: data.dailyTotals.data,
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1,
                                fill: true,
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                },
                            }
                        }
                    });

                    const intervalCtx = $('#twoHourIntervalChart')[0].getContext('2d');
                    new Chart(intervalCtx, {
                        type: 'bar',
                        data: {
                            labels: data.twoHourIntervals.labels,
                            datasets: [{
                                label: 'Customers',
                                data: data.twoHourIntervals.data,
                                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1,
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                },
                            }
                        }
                    });
                },
                error: function(error) {
                    console.error("Error fetching chart data:", error);
                }
            });
        });
        let chart;

        // function fetchChartData() {
        //     $('#refreshBtn').addClass('animation-spin');
        //     $.get('/get-daily-amounts', function(chartData) {
        //         chart.data.labels = chartData.labels;
        //         chart.data.datasets[0].data = chartData.data;
        //         chart.update();
        //         $('#refreshBtn').removeClass('animation-spin');
        //     });
        // }

        // const ctx = document.getElementById('dailyAreaChart').getContext('2d');
        // chart = new Chart(ctx, {
        //     type: 'line',
        //     data: {
        //         labels: [],
        //         datasets: [{
        //             label: 'Total Sale (Last 30 Days)',
        //             data: [],
        //             borderColor: 'rgba(75, 192, 192, 1)',
        //             backgroundColor: 'rgba(75, 192, 192, 0.2)',
        //             borderWidth: 3,
        //             fill: true,
        //             tension: 0,
        //         }],
        //     },
        //     options: {
        //         responsive: true,
        //         plugins: {
        //             legend: {
        //                 position: 'top',
        //             },
        //             title: {
        //                 display: true,
        //                 text: 'Daily Sale',
        //             },
        //         },
        //         scales: {
        //             x: {
        //                 title: {
        //                     display: true,
        //                     text: 'Date',
        //                 },
        //             },
        //             y: {
        //                 beginAtZero: true,
        //                 title: {
        //                     display: true,
        //                     text: 'Sale',
        //                 },
        //             },
        //         },
        //     },
        // });

        // $('#refreshChartBtn').click(function() {
        //     fetchChartData();
        // });

        // setInterval(fetchChartData, 600000);
    </script>
@endpush
