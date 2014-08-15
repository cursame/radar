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

	});
    
    $('#copy_jquery').click(function(){
	  $(this).zclip({
	    path: 'http://www.steamdev.com/zclip/js/ZeroClipboard.swf',
	    copy: $('#jquery').val(),
	    beforeCopy:function(){
	    	$('#red_acces').css('border', '#04B431');
	    }
	  });
	});

    $('#copy_red_acces').click(function(){
       $(this).zclip({
		    path: 'http://www.steamdev.com/zclip/js/ZeroClipboard.swf',
		    copy: $('#red_acces').val(),
		    beforeCopy:function(){
		    	$('#red_acces').css('border', '#04B431');
		    }
	  });
    });

    $( "form#new_red_light" ).submit(function( event ) {
	    var n = 0
	    $('.questions-list').find('input[type=checkbox]').each(function(i,e){
	       if($(e).is(':checked')){
	          n = n + 1
	       }
	    });
	    if (n == 0) {
	    	alert('No puede dejar las casillas de la encuesta vacias solo los campos de texto pueden ser anónimos');
	        return false;

	    }
    });
	
});



