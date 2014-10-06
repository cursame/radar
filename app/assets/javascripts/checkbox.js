$(function() { 
  $(".multi-checkbox-label-js").click(function(event) {
    event.preventDefault();
    var self = $(this),
        checkbox = self.find("input[type=checkbox]");

    if ( checkbox.prop("checked") ) {
      self.removeClass("active");
      checkbox.prop("checked", false);
    } else {
      self.addClass("active");
      checkbox.prop("checked", "checked");
    }
    return false;
  });
});


