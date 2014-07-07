$(function() {
    $('.tabs').click(function(){
          var to_div = $(this).data('target');
          $('.to_tabs').hide();
          $('#'+to_div).toggle();
	});
});