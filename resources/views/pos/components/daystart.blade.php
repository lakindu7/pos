 <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title" id="staticBackdropLabel">Starting Balance</h5>
             </div>
             <form action="{{ route('startday') }}" method="post">
                 @csrf
                 <input type="hidden" name="started_by" value="{{ Auth::user()->id }}">
                 <div class="modal-body">
                     <div class="container">
                         <div class="row">
                             <div class="col-12">
                                 <div class="form-group">
                                     <label for="txtStaring">Starting Balance *</label>
                                     <input type="number" step=".01" name="startingbalance" id="txtStaring"
                                         class="form-control" required>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="modal-footer">
                     <button type="submit" class="btn btn-primary">Start Day</button>
                 </div>
             </form>
         </div>
     </div>
 </div>
