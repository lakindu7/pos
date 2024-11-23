@extends('layouts.admin', ['pagetitle' => 'Dashboard'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Dashboard</h5>
                    <div class="ml-auto">
                        <a href="" class="btn btn-primary btn-sm">Add New</a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-md-6">
                                <div class="card shadow">
                                    <canvas id="dailyAreaChart"></canvas>
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
            fetchChartData();
        });
        let chart;

        function fetchChartData() {
            $('#refreshBtn').addClass('animation-spin');
            $.get('/get-daily-amounts', function(chartData) {
                chart.data.labels = chartData.labels;
                chart.data.datasets[0].data = chartData.data;
                chart.update();
                $('#refreshBtn').removeClass('animation-spin');
            });
        }

        const ctx = document.getElementById('dailyAreaChart').getContext('2d');
        chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [],
                datasets: [{
                    label: 'Total Sale (Last 30 Days)',
                    data: [],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderWidth: 3,
                    fill: true,
                    tension: 0,
                }],
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'Daily Sale',
                    },
                },
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Date',
                        },
                    },
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Sale',
                        },
                    },
                },
            },
        });

        $('#refreshChartBtn').click(function() {
            fetchChartData();
        });

        setInterval(fetchChartData, 600000);
    </script>
@endpush
