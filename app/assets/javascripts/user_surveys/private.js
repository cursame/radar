$(function() {
  var checkbox = $("#private");
  var denouncer_name = $(".form-group.name")
  var denouncer_phone_number = $(".form-group.phone_number")

  checkbox.change(function() {
    if (checkbox.is(':checked')) {
      denouncer_name.hide();
      denouncer_phone_number.hide();
    } else {
      denouncer_name.show();
      denouncer_phone_number.show();
    }
  });
})();
