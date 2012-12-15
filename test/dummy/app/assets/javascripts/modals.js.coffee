# var $modal = $('#ajax-modal');
# 
# $('.ajax .demo').on('click', function(){
#   # create the backdrop and wait for next modal to be triggered
#   $('body').modalmanager('loading');
# 
#   setTimeout(function(){
#      $('#ajax-modal .modal-body').load('/dashboard/new.js', '', function(){
#       $modal.modal();
#     });
#   }, 1000);
# });
# 
# $modal.on('click', '.update', function(){
#   $modal.modal('loading');
#   setTimeout(function(){
#     $modal
#       .modal('loading')
#       .find('.modal-body')
#         .prepend('<div class="alert alert-info fade in">' +
#           'Updated!<button type="button" class="close" data-dismiss="alert">&times;</button>' +
#         '</div>');
#   }, 1000);
# });

# Coffeescript version

# $modal = $("#stack1")
# $(".ajax .demo").on "click", ->
#   
#   # create the backdrop and wait for next modal to be triggered
#   $("body").modalmanager "loading"
#   setTimeout (->
#     $modal.load "modal_ajax_test.html", "", ->
#       $modal.modal()
# 
#   ), 1000
# 
# $modal.on "click", ".update", ->
#   $modal.modal "loading"
#   setTimeout (->
#     $modal.modal("loading").find(".modal-body").prepend "<div class=\"alert alert-info fade in\">" + "Updated!<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" + "</div>"
#   ), 1000