 <div class="modal fade" id="dayendNot" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="dayendNotLabel" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title" id="dayendNotLabel">Day End Process not Completed</h5>
             </div>
             <div class="modal-body">
                 <div class="container">
                     <div class="row">
                         <div class="col-12">
                             <div class="alert alert-warning" role="alert">
                                 <p>
                                     Day End Process not completed for Last Day, Please Complete it before start a new
                                     day
                                 </p>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="modal-footer">
                 <a href="{{ route('dayend', $dayEndcompleted->format('Y-m-d')) }}" class="btn btn-danger">Day End</a>
             </div>
         </div>
     </div>
 </div>
