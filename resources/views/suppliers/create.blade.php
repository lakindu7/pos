@extends('layouts.admin', ['pagetitle' => 'Supplier Management', 'subtitle' => 'Create Supplier'])

@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create Supplier</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('suppliers.store') }}" method="post">
                        @csrf
                        <div class="container-fluid">
                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            id="txtName" name="name" value="{{ old('name') }}" required>
                                        @error('name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtTelephone">Telephone *</label>
                                        <input type="number" class="form-control @error('telephone') is-invalid @enderror"
                                            id="txtTelephone" name="telephone" value="{{ old('telephone') }}" required>
                                        @error('telephone')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtContact">Contact Person</label>
                                        <input type="text" class="form-control" id="txtContact" name="contactperson"
                                            value="{{ old('contactperson') }}">
                                        @error('email')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbFrequency">Delivary Frequency</label>
                                        <select name="frequency" id="cmbFrequency" class="form-control">
                                            <option value="" selected disabled>Select Frequency</option>
                                            <option value="daily" {{ old('frequency') == 'daily' ? 'selected' : '' }}>Daily
                                            </option>
                                            <option value="weekly" {{ old('frequency') == 'weekly' ? 'selected' : '' }}>
                                                Weekly
                                            </option>
                                            <option value="monthly" {{ old('frequency') == 'monthly' ? 'selected' : '' }}>
                                                Monthly</option>
                                            <option value="quarterly"
                                                {{ old('frequency') == 'quarterly' ? 'selected' : '' }}>Quarterly</option>
                                            <option value="annually"
                                                {{ old('frequency') == 'annually' ? 'selected' : '' }}>
                                                Annually</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbDelivaryday">Delivary Day</label>
                                        <select name="delivaryday" id="cmbDelivaryday" class="form-control">
                                            <option value="" selected disabled>Select Delivary Day</option>
                                            <option value="monday" {{ old('delivaryday') == 'monday' ? 'selected' : '' }}>
                                                Monday</option>
                                            <option value="tuesday"
                                                {{ old('delivaryday') == 'tuesday' ? 'selected' : '' }}>
                                                Tuesday</option>
                                            <option value="wednesday"
                                                {{ old('delivaryday') == 'wednesday' ? 'selected' : '' }}>Wednesday
                                            </option>
                                            <option value="thursday"
                                                {{ old('delivaryday') == 'thursday' ? 'selected' : '' }}>Thursday</option>
                                            <option value="friday" {{ old('delivaryday') == 'friday' ? 'selected' : '' }}>
                                                Friday</option>
                                            <option value="saturday"
                                                {{ old('delivaryday') == 'saturday' ? 'selected' : '' }}>Saturday</option>
                                            <option value="sunday" {{ old('delivaryday') == 'sunday' ? 'selected' : '' }}>
                                                Sunday</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="{{ Auth::user()->id }}" name="user_id">
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
