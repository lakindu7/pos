@extends('layouts.admin', ['pagetitle' => 'Supplier Management', 'subtitle' => 'Create Supplier'])

@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Create Contact for {{ $supplier->name }}</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('suppliercontact.store', $supplier->id) }}" method="post" id="frmSupplier">
                        @csrf
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Name *</label>
                                        <input type="text" class="form-control" id="txtName" name="name"
                                            value="{{ $supplier->name }}" readonly>
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
                                        <label for="txtPrimaryCP">Contact Person</label>
                                        <input type="text" class="form-control" id="txtContact1">
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="txtPrimaryTP">Telephone</label>
                                        <input type="number" class="form-control" id="txtTelephone1">
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="txtPrimaryDes">Designation</label>
                                        <input type="text" class="form-control" id="txtPosition1">
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
            let contactIndex = 1;
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



        $('#submitButton').on('click', function(e) {
            e.preventDefault();
            let contactsJson = collectContacts();
            if (!contactsJson) {
                alert('Please complete all contact details before proceeding.');
            } else {
                $('#frmSupplier').submit();

            }
        });
    </script>
@endpush
