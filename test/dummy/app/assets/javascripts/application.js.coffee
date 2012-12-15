# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require bootstrap_modal_rails/bootstrap-modalmanager
#= require bootstrap_modal_rails/bootstrap-modal
#= require_tree .


# On the fly creation via modal
$('[data-dynamic_modal]').click (e) ->
    $('#ajax-modal .progress').show()
    url = $(@).data('source')
    create = $(@).data('create')
    related_element = $(@).siblings('select:first')
    $modal = $('#ajax-modal')
    submit_button = $modal.find('.ajax-modal-submit')
    $.ajax url,
    type: 'GET'
    dataType: 'html'
    success: (data) ->
        $modal.modal()
        $('#ajax-modal .modal-body').html(data)
        submit_button.data('source', create)
        submit_button.data('related_element', related_element)
    # setTimeout (->
    #     $modal.load url, "", ->
    #         $modal.modal()
    #         $modal.find('.ajax-modal-submit').data('source', create)
    # ), 1000

$('.ajax-modal-submit').click (e) ->
    # Submit form data
    submit_button = $(@)
    $modal = $('#ajax-modal')
    related_element = submit_button.data('related_element')
    url = submit_button.data('source')
    $.ajax url,
    type: 'POST'
    dataType: 'json'
    data: $('#ajax-modal .modal-body form').serialize()
    success: (data) ->
        $(related_element).append($('<option></option>').attr('value', data.id).text(data.name))
        $(related_element).select2 'val', data.id
        $modal.modal('hide')
        $('#ajax-modal .modal-body').empty()
        $(submit_button).removeData('source')
        $(submit_button).removeData('related_element')
    error: (data) ->
        errors = $.map $.parseJSON(data.responseText), (index, value) ->
            "#{index} #{value[0]} "