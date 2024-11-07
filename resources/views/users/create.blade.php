@extends('layouts.admin', ['pagetitle' => 'User Management', 'subtitle' => 'Create User'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create User</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('users.store') }}" method="post">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control" id="txtName" name="name" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtEmail">Email *</label>
                                        <input type="email" class="form-control" id="txtEmail" name="email" required>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtTelephone">Telephone</label>
                                        <input type="text" class="form-control" id="txtTelephone" name="telephone">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="repassword">Confirm Password</label>
                                        <input type="password" class="form-control" id="repassword"
                                            name="password_confirmation" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbUserrole">User Role *</label>
                                        <select name="userrole" id="cmbUserrole" class="form-control">
                                            <option value="" selected disabled>Select a Role</option>
                                            @foreach ($roles as $role)
                                                @if (!auth()->user()->hasRole('superadmin') && $role->name == 'superadmin')
                                                    @continue
                                                @endif
                                                <option value="{{ $role->name }}"> {{ $role->displayname }}</option>
                                            @endforeach

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
