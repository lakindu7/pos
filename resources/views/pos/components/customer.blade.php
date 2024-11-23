<div class="modal fade" id="customerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="customerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="customerModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" id="customerTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="select-customer-tab" data-bs-toggle="tab" href="#select-customer"
                            role="tab" aria-controls="select-customer" aria-selected="true">Select Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="add-customer-tab" data-bs-toggle="tab" href="#add-customer"
                            role="tab" aria-controls="add-customer" aria-selected="false">Add Customer</a>
                    </li>
                </ul>
                <div class="tab-content" id="customerTabContent">
                    <div class="tab-pane fade show active" id="select-customer" role="tabpanel"
                        aria-labelledby="select-customer-tab">
                        <table class="table table-hover dataTable text-nowrap mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="font-weight-semi-bold border-top-0 py-2">#</th>
                                    <th class="font-weight-semi-bold border-top-0 py-2">Name</th>
                                    <th class="font-weight-semi-bold border-top-0 py-2">Telephone</th>
                                </tr>
                            </thead>
                            <tbody class="">
                                @foreach ($customers as $key => $customer)
                                    <tr data-id="{{ $customer->id }}" data-telephone="{{ $customer->telephone }}"
                                        data-name="{{ $customer->name }}" data-email="{{ $customer->email }}"
                                        data-dob="{{ $customer->dob }}"
                                        data-outstanding="{{ $customer->outstandingbalance }}">
                                        <td class="py-3">{{ $key + 1 }}</td>
                                        <td class="py-3">{{ $customer->name }}</td>
                                        <td class="py-3">{{ $customer->telephone }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="row pt-4">
                            <div class="col-12">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="selectCustomerButton">Select
                                    Customer</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="add-customer" role="tabpanel" aria-labelledby="add-customer-tab">
                        <form id="addCustomerForm">
                            <div class="row pt-4 pb-4">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            id="newtxtName" name="name" value="{{ old('name') }}" required>
                                        @error('name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtTelephone">Telephone *</label>
                                        <input type="number"
                                            class="form-control @error('telephone') is-invalid @enderror"
                                            id="newtxtTelephone" name="telephone" value="{{ old('telephone') }}"
                                            required>
                                        @error('telephone')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row pb-4">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtEmail">Email</label>
                                        <input type="email" class="form-control @error('email') is-invalid @enderror"
                                            id="newtxtEmail" name="email" value="{{ old('email') }}">
                                        @error('email')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtDOB">Date of Birth</label>
                                        <input type="date" class="form-control @error('dob') is-invalid @enderror"
                                            id="newtxtDOB" name="dob" value="{{ old('dob') }}">
                                        @error('dob')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <button type="button" id="btnCreatecus" class="btn btn-primary">Add
                                Customer</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
