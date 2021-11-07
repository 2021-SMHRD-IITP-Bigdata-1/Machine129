/*------------------------------------------------------
    Author : www.webthemez.com
    License: Commons Attribution 3.0
    http://creativecommons.org/licenses/by/3.0/
---------------------------------------------------------  */

(function ($) {
    "use strict";
    var mainApp = {

        initFunction: function () {
            /*MENU 
            ------------------------------------*/
            $('#main-menu').metisMenu();
			
            $(window).bind("load resize", function () {
                if ($(this).width() < 768) {
                    $('div.sidebar-collapse').addClass('collapse')
                } else {
                    $('div.sidebar-collapse').removeClass('collapse')
                }
            });
            

var ctx1 = $('#line-chart1');
var lineChart1 = new Chart(ctx1, {
  type:'line',
  data:{
    labels:[
      '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    datasets:[
      {
        label:'일주일간 공부',
        data:[1,5,7,9,22,17,15],
        backgroundColor:'white',        
        borderWidth:1,
        borderColor: "#900",
        lineTension:0,       
        fill:false
      }
     
    ]
  },
  options: {
    
    legend: {
        display: false
    },
    
    tooltips: {
        callbacks: {
           label: function(tooltipItem) {
                  return tooltipItem.yLabel;
           }
        }
    }
}
});
            /* MORRIS BAR CHART
			-----------------------------------------*/
            Morris.Bar({
                element: 'morris-bar-chart',
                data: [{
                    y: '일요일',
                    a: 100,             
                }, {
                    y: '월요일',
                    a: 75,                  
                }, {
                    y: '화요일',
                    a: 50,                  
                }, {
                    y: '수요일',
                    a: 75,               
                }, {
                    y: '목요일',
                    a: 50,                   
                }, {
                    y: '금요일',
                    a: 75,                   
                }, {
                    y: '토요일',
                    a: 100,                   
                }],
                xkey: 'y',
                ykeys: ['a'],
                labels: ['Series A'],
				 barColors: [
                    '#EE82EE',
                 
  ],
                hideHover: 'auto',
                resize: true
            });
	 


            /* MORRIS DONUT CHART
			----------------------------------------*/
            Morris.Donut({
                element: 'morris-donut-chart',
                data: [{
                    label: "집중시간",
                    value: 12
                }, {
                    label: "핸드폰",
                    value: 30
                }, {
                    label: "이탈시간",
                    value: 20
                }],
				   colors: [
                    '#fed6e3','#a8edea','#fbfcdb','#e4efe9' 
  ],
                resize: true
            });

           
        
            $('.bar-chart').cssCharts({type:"bar"});
            $('.donut-chart').cssCharts({type:"donut"}).trigger('show-donut-chart');
            $('.line-chart').cssCharts({type:"line"});

            $('.pie-thychart').cssCharts({type:"pie"});
       
	 
        },

        initialization: function () {
            mainApp.initFunction();

        }

    }
    // Initializing ///

    $(document).ready(function () {
		$(".dropdown-button").dropdown();
		$("#sideNav").click(function(){
			if($(this).hasClass('closed')){
				$('.navbar-side').animate({left: '0px'});
				$(this).removeClass('closed');
				$('#page-wrapper').animate({'margin-left' : '260px'});
				
			}
			else{
			    $(this).addClass('closed');
				$('.navbar-side').animate({left: '-260px'});
				$('#page-wrapper').animate({'margin-left' : '0px'}); 
			}
		});
		
        mainApp.initFunction(); 
    });

	$(".dropdown-button").dropdown();
	
}(jQuery));
