<!DOCTYPE html>
<html lang="en">

<head>
    <title>{{ $subtitle ?? $pagetitle }} | {{ config('app.name') }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="shortcut icon" href="{{ asset('dist/img/favicon.ico') }}">
    <link rel="stylesheet" href="{{ asset('dist/graindashboard/css/graindashboard.css') }}">
    <link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
</head>

<body class="has-sidebar has-fixed-sidebar-and-header">
    @include('components.header')

    <main class="main">
        @include('components.sidebar')
        <div class="content">
            <div class="py-4 px-3 px-md-4">
                <div class="mb-3 mb-md-4 d-flex justify-content-between">
                    <div class="h3 mb-0">{{ $subtitle ?? $pagetitle }}</div>
                </div>
                @yield('content')
            </div>
            @include('components.footer')
        </div>
    </main>


    <script src="{{ asset('dist/graindashboard/js/graindashboard.js') }}"></script>
    <script src="{{ asset('dist/graindashboard/js/graindashboard.vendor.js') }}"></script>
    <script src="//cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function() {
            $('.data-table').DataTable();
        });
    </script>

</body>

</html>
