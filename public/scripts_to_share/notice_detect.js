
$(document).ready(function(){
  reviewNewComments(idofredlightn, countern);
});

function reviewNewComments (idofredlight, counter, callback) {
	setInterval(function(){
       $.get( '/internal_comunication/detect_new_coment?id='+idofredlight+'&counter='+counter, function( data ) {
		 if(data != 0){
		 	PutsCommentUns(data);
		 }
		});
	}, 5000);
       
}

function PutsCommentUns(id){
   $.get( '/internal_comunication/render_comment_asincronus?id='+id, function( data ) {
   });
}