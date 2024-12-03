@extends('layouts.admin', ['pagetitle' => 'Supplier Management', 'subtitle' => 'Edit Supplier Contact'])

@section('content')
    <div class="row">
        <div class="col-12 mb-3 mb-md-4">
            <div class="card h-100 pb-5">
                <div class="card-header d-flex">
                    <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Edit Supplier Contact</h5>
                </div>
                <div class="card-body p-0">
                    <form action="{{ route('suppliercontact.update', $contact->id) }}" method="post" id="frmSupplier">
                        @csrf
                        <div class="container-fluid">
                            <div class="row pt-3 contact-details">
                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="txtPrimaryCP">Primary Contact Person</label>
                                        <input type="text" class="form-control" id="txtPrimaryCP" name="name"
                                            value="{{ $contact->name }}">
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="txtPrimaryTP">Primary Telephone</label>
                                        <input type="number" class="form-control @error('telephone') is-invalid @enderror"
                                            id="txtPrimaryTP" name="telephone" value="{{ $contact->telephone }}">
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="txtPrimaryDes">Designation</label>
                                        <input type="text" class="form-control" id="txtPrimaryDes" name="position"
                                            value="{{ $contact->position }}">
                                    </div>
                                </div>
                            </div>
                            <textarea name="contacts" id="txtContacts" cols="30" rows="10" hidden></textarea>
                            <input type="hidden" value="{{ Auth::user()->id }}" name="user_id">
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <button type="submit" class="btn btn-primary" id="submitButton">Update</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
