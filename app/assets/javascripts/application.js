// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//require turbolinks
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require highcharts
//= require highcharts/highcharts-more

$(document).ready(function(){
    // validates 
  $(".validate").validate();
   // to target function 

  $('.totarget').click(function(){
   var to_div = $(this).data('target');
   $('#'+to_div).toggle('blind', 400);
  });

  WidthScaleDIV('scalex');

});

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content, id_recive) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  var execute = $(link).before(content.replace(regexp, new_id));
  //console.log(execute);
  event.preventDefault()
}

$(document).on('change','select',function(e){
    var id = e.target.id
    var option = $("#"+id).val();
    var getNext = $("#"+id).next("div");
    var getNextId = $(getNext).attr('id');
    Generate_Question_TYPES_by_Dinamic_USES(option, getNextId );

});

function Generate_Question_TYPES_by_Dinamic_USES(option, getNextId){
     console.log(option);
     console.log(getNextId);
    if (option == 'mULT'){
        
    }
}

function WidthScaleDIV(div){
 var action =  $('.'+div);
  $.each( action, function( i, l ){
    var act = $(l);
    var actual_width = $(act).width();
    var secont_id =  act.attr('id') + '_responsive'
    var rest = act.data('target') ;
    var seft = $('#'+rest).width(actual_width);
  });
}





