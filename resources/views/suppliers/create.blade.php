@extends('layouts.admin', ['pagetitle' => 'Supplier Management', 'subtitle' => 'Create Supplier'])

@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create Supplier</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('suppliers.store') }}" method="post" id="frmSupplier">
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
                                        <label for="cmbFrequency">Delivary Frequency *</label>
                                        <select name="frequency" id="cmbFrequency" class="form-control" required>
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
                                            <option value="annually" {{ old('frequency') == 'annually' ? 'selected' : '' }}>
                                                Annually</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="cmbDelivaryday">Delivery Day *</label>
                                        <select name="delivaryday" id="cmbDelivaryday" class="form-control" required>
                                            <option value="" selected disabled>Select Delivery Day</option>
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
                            <div class="row pt-4">
                                <div class="col-12 col-md-6">
                                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Contacts</h5>
                                </div>
                                <div class="col-12 col-md-6 d-flex justify-content-end">
                                    <button type="button" id="addContactButton" class="btn btn-success">
                                        <i class="bi bi-plus-circle"></i> Add Contact
                                    </button>
                                </div>
                            </div>
                            <div class="row pt-3 contact-details">
                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="txtPrimaryCP">Primary Contact Person</label>
                                        <input type="text" class="form-control" id="txtPrimaryCP" name="contactperson"
                                            value="{{ old('contactperson') }}">
                                        @error('email')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="txtPrimaryTP">Primary Telephone</label>
                                        <input type="number" class="form-control @error('telephone') is-invalid @enderror"
                                            id="txtPrimaryTP" name="telephone" value="{{ old('telephone') }}">
                                        @error('telephone')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="txtPrimaryDes">Designation</label>
                                        <input type="text" class="form-control @error('telephone') is-invalid @enderror"
                                            id="txtPrimaryDes" name="designation" value="{{ old('telephone') }}">
                                        @error('telephone')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <textarea name="contacts" id="txtContacts" cols="30" rows="10" hidden></textarea>
                            <input type="hidden" value="{{ Auth::user()->id }}" name="user_id">
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button type="button" class="btn btn-primary" id="submitButton">Submit</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script>
        $(document).ready(function() {
            let contactIndex = 0;
            $('#addContactButton').on('click', function() {
                contactIndex++;

                const contactDetailsTemplate = `
                    <div class="row pt-3 contact-details">
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="txtContact${contactIndex}">Contact Person</label>
                                <input type="text" class="form-control" id="txtContact${contactIndex}"
                                    value="">
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="txtTelephone${contactIndex}">Telephone</label>
                                <input type="number" class="form-control" id="txtTelephone${contactIndex}"
                                    value="">
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="txtPosition${contactIndex}">Designation</label>
                                <input type="text" class="form-control" id="txtPosition${contactIndex}"
                                    value="">
                            </div>
                        </div>
                    </div>
                `;

                $('.contact-details:last').after(contactDetailsTemplate);
            });
        });

        let isContacts = true;

        function collectContacts() {
            let contacts = [];
            $('.contact-details').each(function() {
                const contactPersonId = $(this).find('input[id^="txtContact"]').attr('id');
                const telephoneId = $(this).find('input[id^="txtTelephone"]').attr('id');
                const postionId = $(this).find('input[id^="txtPosition"]').attr('id');

                if (contactPersonId && telephoneId) {
                    const contactPerson = $(`#${contactPersonId}`).val();
                    const telephone = $(`#${telephoneId}`).val();
                    const position = $(`#${postionId}`).val();
                    if (contactPerson && telephone && position) {
                        contacts.push({
                            contactperson: contactPerson,
                            telephone: telephone,
                            designation: position
                        });
                    } else {
                        $(`#${contactPersonId}`).css('border', '1px solid red');
                        $(`#${telephoneId}`).css('border', '1px solid red');
                        $(`#${postionId}`).css('border', '1px solid red');
                        isContacts = false;
                    }
                }
            });
            if (isContacts) {
                const contactsJson = JSON.stringify(contacts);
                $('#txtContacts').val(contactsJson);
                return true;
            } else {
                return false;
            }
        }

        function checkRequrired() {
            var isValid = true;
            let name = $('#txtName').val();
            let freq = $('#cmbFrequency').val();
            let delev = $('#cmbDelivaryday').val();

            if (!name || freq == null || delev == null) {
                alert('Please fill all required fields');
                $('form :required').css('border', '1px solid red');
                var isValid = false;
                return isValid;
            } else {
                $('form :required').css('border', '');
                var isValid = true;
                return isValid;
            }
        }

        $('#submitButton').on('click', function(e) {
            e.preventDefault();
            let contactsJson = collectContacts();
            let requiredFields = checkRequrired();
            if (!contactsJson) {
                alert('Please complete all contact details before proceeding.');
            }
            if (contactsJson && requiredFields) {
                $('#frmSupplier').submit();
            }
        });
    </script>
@endpush
