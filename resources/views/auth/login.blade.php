<!DOCTYPE html>
<html lang="en">

<head>
    <title>Login | {{ config('app.name') }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="shortcut icon" href="{{ asset('dist/img/favicon.ico') }}">
    <link rel="stylesheet" href="{{ asset('dist/graindashboard/css/graindashboard.css') }}">
</head>

<body class="">
    <main class="main">
        <div class="content">
            <div class="container-fluid pb-5">
                <div class="row justify-content-md-center">
                    <div class="card-wrapper col-12 col-md-4 mt-5">
                        <div class="brand text-center mb-3">
                            <a href="/"><img src="{{ asset('dist/img/logo.png') }}"></a>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Login</h4>
                                <x-auth-session-status class="mb-4" :status="session('status')" />
                                <form method="POST" action="{{ route('login') }}">
                                    @csrf
                                    <div class="form-group">
                                        <label for="email">E-Mail Address</label>
                                        <input class="form-control" id="email" class="block mt-1 w-full"
                                            type="email" name="email" :value="old('email')" required autofocus
                                            autocomplete="username">
                                        <x-input-error :messages="$errors->get('email')" class="mt-2" />
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password
                                        </label>
                                        <input class="form-control" id="password" class="block mt-1 w-full"
                                            type="password" name="password" required autocomplete="current-password">
                                        <x-input-error :messages="$errors->get('password')" class="mt-2" />
                                        <div class="text-right">
                                            @if (Route::has('password.request'))
                                                <a href="{{ route('password.request') }}" class="small">
                                                    Forgot Your Password?
                                                </a>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="form-check position-relative mb-2">
                                            <input type="checkbox" class="form-check-input d-none" id="remember_me"
                                                name="remember">
                                            <label class="checkbox checkbox-xxs form-check-label ml-1" for="remember_me"
                                                data-icon="&#xe936">Remember Me</label>
                                        </div>
                                    </div>
                                    <div class="form-group no-margin">
                                        <button class="btn btn-primary btn-block">
                                            Sign In
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <footer class="footer mt-3">
                            <div class="container-fluid">
                                <div class="footer-content text-center small">
                                    <span class="text-muted">&copy; {{ date('Y') }} <a href="https://teksalad.com/"
                                            target="_blank">TekSalad (Pvt)
                                            Ltd</a>. All Rights
                                        Reserved.</span>
                                </div>
                            </div>
                        </footer>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="{{ asset('dist/graindashboard/js/graindashboard.js') }}"></script>
    <script src="{{ asset('dist/graindashboard/js/graindashboard.vendor.js') }}"></script>

</body>

</html>
