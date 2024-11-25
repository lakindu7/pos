<!DOCTYPE html>
<html lang="en">

<head>
    <title>{{ $subtitle ?? $pagetitle }} | {{ config('app.name') }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="shortcut icon" href="{{ asset('dist/img/favicon.ico') }}">
    <link rel="stylesheet" href="{{ asset('dist/graindashboard/css/graindashboard.css') }}">
    <link rel="stylesheet" href="{{ asset('dist/app.css') }}">
    <link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body class="has-sidebar has-fixed-sidebar-and-header">
    @include('components.header')

    <main class="main">
        <div id="myModal" class="custom-modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                @yield('modal-content')
            </div>
        </div>
        @include('components.sidebar')
        <div class="content">
            <div class="py-4 px-3 px-md-4">
                <div class="mb-3 mb-md-4 d-flex justify-content-between">
                    <div class="h3 mb-0">{{ $pagetitle }}</div>
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
    <script src="https://cdn.tiny.cloud/1/{{ env('TINYMCE_API') }}/tinymce/7/tinymce.min.js" referrerpolicy="origin">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        $(document).ready(function() {
            $('.data-table').DataTable();
        });
    </script>

    @stack('js')

</body>

</html>
