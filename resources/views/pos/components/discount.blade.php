<div class="modal fade" id="discountModal" tabindex="-1" aria-labelledby="discountModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="discountModalLabel">Add Discount</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <div class="col-12 form-group">
                            <label for="cmbType" class="pb-2">DiscountType</label>
                            <select class="form-control" id="cmbType" required>
                                <option value="" selected>No discount</option>
                                <option value="amount">Amount</option>
                                <option value="percentage">Percentage</option>
                            </select>
                        </div>
                        <div class="col-12 form-group pt-3">
                            <label for="txtDiscount" class="pb-2">Discount Amount/Percentage</label>
                            <input type="number" class="form-control" id="txtMDiscount" required>
                        </div>
                        <div class="col-12 d-flex pt-3 justify-content-end">
                            <button type="button" class="btn btn-primary" onclick="addDiscount()">Add</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
