var $modal;

$modal = $('#ajax-modal');

$('[data-dynamic_modal]').on('click', function() {
  var create, related_element, submit_button, url;
  $('body').modalmanager('loading');
  url = $(this).data('source');
  create = $(this).data('create');
  related_element = $(this).siblings('select:first');
  submit_button = $modal.find('.ajax-modal-submit');
  return setTimeout((function() {
    return $('#ajax-modal .modal-body').load(url, '', function() {
      $modal.modal();
      submit_button.data('source', create);
      if (related_element !== void 0) {
        return submit_button.data('related_element', related_element);
      }
    });
  }), 1000);
});

$('.ajax-modal-submit').click(function(e) {
  var related_element, submit_button, url;
  submit_button = $(this);
  related_element = submit_button.data('related_element');
  url = submit_button.data('source');
  return $.ajax(url, {
    type: 'POST',
    dataType: 'json',
    data: $('#ajax-modal .modal-body form').serialize(),
    success: function(data) {
      if (related_element !== void 0) {
        $(related_element).append($('<option></option>').attr('value', data.id).text(data.name));
        $(related_element).select2('val', data.id);
      }
      $modal.modal('hide');
      $('#ajax-modal .modal-body').empty();
      $(submit_button).removeData('source');
      return $(submit_button).removeData('related_element');
    },
    error: function(data) {
      var errors;
      return errors = $.map($.parseJSON(data.responseText), function(index, value) {
        return "" + index + " " + value[0] + " ";
      });
    }
  });
});
