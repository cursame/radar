// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require highcharts
//= require highcharts/highcharts-more

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

$(function () {
	
    function CalculusRo(){
      var porcentdially = 18000000 * 0.61

     setInterval(function() {
            var xdate = (new Date()).getTime();
            var simply = Highcharts.dateFormat('%Y-%m-%d ', xdate);
            var howr = Highcharts.dateFormat('%H', xdate);
            var min = Highcharts.dateFormat('%M', xdate);
            


            var docificate =  (porcentdially * 0.020)/24;
            var minutesac =  min * 0.61;
            var acumulado = (docificate * howr) + minutesac
            
            var minute = (docificate/60)/60;
            var dicplayned = acumulado;
                dicplayned = acumulado + minute;
           
            $('#acumulado').html('Posibles casos de violencia hoy:'+' '+dicplayned.toFixed(2));


    }, 1000);

    }

    $(document).ready(function() {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
        
        CalculusRo();

    
        var chart;
        $('#dinamic').highcharts({
            chart: {
                type: 'spline',
                animation: Highcharts.svg, // don't animate in old IE
                marginRight: 10,
                events: {
                    load: function() {
    
                        // set up the updating of the chart each second
                        var series = this.series[0];
                        setInterval(function() {
                            var x = (new Date()).getTime(), // current time
                                y = Math.random();
                            series.addPoint([x, y], true, true);
                        }, 1000);
                    }
                }
            },
            title: {
                text: 'Casos de violencia cada segundo.'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 130
            },
            yAxis: {
                title: {
                    text: 'Casos'
                },
                plotLines: [{
                    value: 2.54,
                    width: 20,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'Random data',
                data: (function() {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i;
    
                    for (i = -145; i <= 2.54; i++) {
                        data.push({
                            x: time + i * 1000,
                            y: Math.random()
                        });
                    }
                    return data;
                })()
            }]
        });
    });
   $('#radar').highcharts({
        
	    chart: {
	        polar: true
	    },
	    
	    title: {
	        text: 'Violencia'
	    },
	    
	    pane: {
	        startAngle: 0,
	        endAngle: 360
	    },
	
	    xAxis: {
	        tickInterval: 45,
	        min: 0,
	        max: 360,
	        labels: {
	        	formatter: function () {
	        		return this.value + '°';
	        	}
	        }
	    },
	        
	    yAxis: {
	        min: 0
	    },
	    
	    plotOptions: {
	        series: {
	            pointStart: 0,
	            pointInterval: 45
	        },
	        column: {
	            pointPadding: 0,
	            groupPadding: 0
	        }
	    },
	
	    series: [{
	    	type: 'area',
	        name: 'Acoso Verbal',
	        data: [44, 47, 50, 63, 65, 68, 70, 85, 70,90],
	        pointPlacement: 'between'
	       
	    },  {
	        type: 'area',
	        name: 'Acoso',
	        data: [40,42,40,50,54,57,60]
	    },{
	        type: 'area',
	        name: 'Amenazas',
	        data: [20,24,25,25,27,30,35]
	    },{
	        type: 'area',
	        name: 'Golpeado',
	        data: [17, 18, 12, 17, 30, 16, 24, 25]
	    }]
	});
});