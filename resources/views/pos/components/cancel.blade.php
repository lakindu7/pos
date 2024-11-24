<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cancelModalLabel">Cancel Invoice</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <input type="text" class="form-control" id="txtInvoiceid" placeholder="Invoice Id">
                    </div>
                </div>
                <div class="row pt-4">
                    <div class="col-12 ">
                        <div class="col-12 mt-3" id="invoiceDetails">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .ui-autocomplete {
        z-index: 2500 !important;
        position: absolute;
    }
</style>
