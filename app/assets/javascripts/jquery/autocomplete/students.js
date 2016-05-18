$(document).ready(function() {
  var nameStudentsListSource = '/api/v1/students/search'
  $( ".students" ).autocomplete({
    source: nameStudentsListSource
  });

  $(".aggressors").on('cocoon:before-insert', function(e, added_aggressor) {
    added_aggressor.find(".students").autocomplete({
      source: nameStudentsListSource
    });
  });
});
