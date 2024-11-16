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
                                        <div class="col-12">
                                            <div class="form-group">
                                                <div class="switch-wrapper">
                                                    <span class="switch-label">Enable Reward Points:</span>
                                                    <div class="custom-control custom-switch">
                                                        <input type="checkbox" class="custom-control-input"
                                                            id="customSwitch1">
                                                        <label class="custom-control-label" for="customSwitch1"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="txtSpend">Amount spend for unit point *</label>
                                                <input type="number" name="spendamount" id="txtSpend" class="form-control"
                                                    value="{{ $reward->spendamount ?? '' }}" required disabled>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="txtmintotal">Minimum order total to earn reward *</label>
                                                <input type="number" name="mintotal" id="txtmintotal" class="form-control"
                                                    value="{{ $reward->mintotal ?? '' }}" required disabled>
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

@push('js')
    <script>
        $(document).ready(function() {
            const $toggleSwitch = $('#customSwitch1');
            const $statusText = $('#status');
            checkToggleStatus();

            function checkToggleStatus() {
                if ($toggleSwitch.is(':checked')) {
                    $('input').removeAttr('disabled');
                } else {
                    $('input').attr('disabled', 'disabled');
                }
                $('#customSwitch1').removeAttr('disabled');
            }

            $toggleSwitch.on('change', checkToggleStatus);
        });
    </script>
@endpush
