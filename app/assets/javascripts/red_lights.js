$(function() {
    $('.tabs').click(function(){
          var to_div = $(this).data('target');
          $('.to_tabs').hide();
          $('#'+to_div).toggle();
	});

	$('.negation').click(function(){
          var to_div = $(this).data('target');
         $('#'+to_div).hide();
	});

	$('.afirmation').click(function(){
		 var to_div = $(this).data('target');
		 $('#'+to_div).show();

	})
});
