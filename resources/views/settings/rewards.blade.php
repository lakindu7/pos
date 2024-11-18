@extends('layouts.admin', ['pagetitle' => 'Reward Point Settings', 'selectedlink' => 'Settings'])
@section('content')
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-4">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Reward Point Settings</h5>
                </div>
                <div class="card-body p-0">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <form action="{{ route('rewards.update') }}" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="text" hidden name="honeycomb" id="txtHoney">
                                            <div class="form-group">
                                                <div class="switch-wrapper">
                                                    <span class="switch-label">Enable Reward Points:</span>
                                                    <div class="custom-control custom-switch">
                                                        <input type="checkbox" class="custom-control-input"
                                                            id="customSwitch1"
                                                            {{ $reward_status->loyaltypoints == 1 ? 'checked' : '' }}
                                                            name="loyaltypoints">
                                                        <label class="custom-control-label" for="customSwitch1"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row pt-4">
                                        <div class="col-12">
                                            <h5 class="h5 font-weight-semi-bold text-uppercase mb-0">Earning Points Settings
                                            </h5>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtSpend">Amount spend for unit point *</label>
                                                <input type="number" name="spendamount" id="txtSpend" class="form-control"
                                                    value="{{ $reward->spendamount ?? '' }}" required disabled>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtmintotal">Minimum order total to earn reward *</label>
                                                <input type="number" name="mintotal" id="txtmintotal" class="form-control"
                                                    value="{{ $reward->mintotal ?? '' }}" disabled>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtMax">Maximum points per order</label>
                                                <input type="number" name="maxpoint" id="txtMax" class="form-control"
                                                    value="{{ $reward->maxpoint ?? '' }}" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row pt-4">
                                        <div class="col-12">
                                            <h5 class="h5 font-weight-semi-bold text-uppercase mb-0">Redeem Points Settings
                                            </h5>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtRedeem">Redeem amount per unit point *</label>
                                                <input type="number" name="pointvalue" id="txtRedeem" class="form-control"
                                                    value="{{ $reward->pointvalue ?? '' }}" required disabled>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtRedeem">Minimum order total to redeem points *</label>
                                                <input type="number" name="min_redeem_total" id="txtRedeem"
                                                    class="form-control" value="{{ $reward->min_redeem_total ?? '' }}"
                                                    required disabled>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="form-group">
                                                <label for="txtMinRedeem">Minimum redeem point</label>
                                                <input type="number" name="min_redeem_per_invoice" id="txtMinRedeem"
                                                    class="form-control" value="{{ $reward->min_redeem_per_invoice ?? '' }}"
                                                    disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="txtMaxRedeem">Maximum redeem point per order</label>
                                                <input type="number" name="max_redeem_per_invoice" id="txtMaxRedeem"
                                                    class="form-control" value="{{ $reward->max_redeem_per_invoice ?? '' }}"
                                                    disabled>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="txtExp">Reward Point expiry period (Months)</label>
                                                <input type="number" name="exp_period" id="txtExp" class="form-control"
                                                    value="{{ $reward->pointvalue ?? '' }}" disabled>
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
                // Get the toggle status
                let isChecked = $('#customSwitch1').is(':checked') ? 1 : 0;

                // Enable or disable inputs and buttons based on the toggle status
                if (isChecked) {
                    $('input').removeAttr('disabled');
                    $('button').removeAttr('disabled');
                } else {
                    $('input').attr('disabled', 'disabled');
                    $('button').attr('disabled', 'disabled');
                }

                $('#customSwitch1').removeAttr('disabled');

                $.ajax({
                    url: '/update-toggle-status',
                    method: 'POST',
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        toggle_status: isChecked
                    },
                    success: function(response) {
                        console.log(response.message);
                    },
                    error: function(xhr, status, error) {
                        console.error('Error updating toggle status:', error);
                    }
                });
            }


            $toggleSwitch.on('change', checkToggleStatus);
        });
    </script>
@endpush
