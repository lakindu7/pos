@extends('layouts.admin', ['pagetitle' => 'Business Settings', 'selectedlink' => 'Settings'])
@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-4">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Business Settings</h5>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <form action="{{ route('settings.update') }}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="txtBusinessname">Business Name *</label>
                                                <input type="text" name="businessname" id="txtBusinessname"
                                                    class="form-control" value="{{ $settings->businessname ?? '' }}"
                                                    required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="txtLogo">Logo</label>
                                                <input type="file" name="logo" id="txtLogo" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtContactname">Contact Name *</label>
                                                <input type="text" name="contactperson" id="txtContactname"
                                                    class="form-control" value="{{ $settings->contactperson ?? '' }}"
                                                    required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtContactno">Contact No *</label>
                                                <input type="number" name="contact" id="txtContactno" class="form-control"
                                                    value="{{ $settings->contact ?? '' }}" required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtEmail">Email </label>
                                                <input type="email" name="email" id="txtEmail" class="form-control"
                                                    value="{{ $settings->email ?? '' }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtAddress1">Address Line 01 *</label>
                                                <input type="text" name="address1" id="txtAddress1" class="form-control"
                                                    value="{{ $settings->address1 ?? '' }}" required>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtAddress2">Address Line 02</label>
                                                <input type="text" name="address2" id="txtAddress2" class="form-control"
                                                    value="{{ $settings->address2 ?? '' }}">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtCity">City *</label>
                                                <input type="text" name="city" id="txtCity" class="form-control"
                                                    value="{{ $settings->city ?? '' }}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="cmbRegtype">Business Registration Type</label>
                                                <select name="registrationtype" id="cmbRegtype" class="form-control">
                                                    <option value="" selected disabled>Select Registration Type
                                                    </option>
                                                    <option value="Sole proprietorship"
                                                        {{ $settings->registrationtype == 'Sole proprietorship' ? 'selected' : '' }}>
                                                        Sole proprietorship
                                                    </option>
                                                    <option value="Private limited company"
                                                        {{ $settings->registrationtype == 'Private limited company' ? 'selected' : '' }}>
                                                        Private limited company
                                                    </option>
                                                    <option value="Partnership"
                                                        {{ $settings->registrationtype == 'Partnership' ? 'selected' : '' }}>
                                                        Partnership
                                                    </option>
                                                    <option value="Offshore company"
                                                        {{ $settings->registrationtype == 'Offshore company' ? 'selected' : '' }}>
                                                        Offshore company
                                                    </option>
                                                    <option value="Public limited company"
                                                        {{ $settings->registrationtype == 'Public limited company' ? 'selected' : '' }}>
                                                        Public limited company
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="txtRegno">Registration No</label>
                                                <input type="text" name="registrationno" id="txtRegno"
                                                    class="form-control" value="{{ $settings->registrationno ?? '' }}">
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
            </div>
        </div>
    </div>
@endsection
