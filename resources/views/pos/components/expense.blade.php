<div class="modal fade" id="expenseModal" tabindex="-1" aria-labelledby="expenseModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="expenseModalLabel">Add Expemse</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="{{ route('expenses.store') }}" method="post">
                    @csrf
                    <input type="hidden" name="submitlocation" value="pos">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="txtName">Reference</label>
                                    <input type="text" class="form-control" id="txtName" name="reference">
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="txtAmount">Amount *</label>
                                    <input type="number" class="form-control" id="txtAmount" name="amount" required>
                                </div>
                            </div>
                        </div>
                        <div class="row pt-4">
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="expense_category_id">Expense Category *</label>
                                    <select class="form-control" id="expense_category_id" name="expense_category_id"
                                        required>
                                        <option value="" disabled selected>Select Category</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row pt-4">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="txtExpenseNote">Expense Note</label>
                                    <textarea class="form-control" id="txtExpenseNote" name="expensenote" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" readonly name="user_id" value="{{ Auth::user()->id }}">
                        <div class="row pt-4">
                            <div class="col-12 d-flex justify-content-end">
                                <button class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
