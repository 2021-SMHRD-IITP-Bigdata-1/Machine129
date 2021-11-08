let allpercent = document.getElementById("allpercent").value;
let allphpercent = document.getElementById("allphpercent").value;
let alloutpercent = document.getElementById("alloutpercent").value;
let mon = document.getElementById("mon").value;
let tue = document.getElementById("tue").value;



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
        data:[1,5,0,0,0,0,0],
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
                    y: '월요일',
                    a: mon,             
                }, {
                    y: '화요일',
                    a: tue,                  
                }, {
                    y: '수요일',
                    a: 0,                  
                }, {
                    y: '목요일',
                    a: 0,               
                }, {
                    y: '금요일',
                    a: 0,                   
                }, {
                    y: '토요일',
                    a: 0,                   
                }, {
                    y: '일요일',
                    a: 0,                   
                }],
                xkey: 'y',
                ykeys: ['a'],
                labels: ['Series A'],
				 barColors: [ '#2196F3'
                    
                 
  ],
                hideHover: 'auto',
                resize: true
            });
	 


            /* MORRIS DONUT CHART
			----------------------------------------*/
            Morris.Donut({
                element: 'morris-donut-chart',
                data: [{
                    label: "순 공부시간",
                    value: allpercent
                }, {
                    label: "휴대폰 사용 시간",
                    value: allphpercent
                }, {
                    label: "이탈 시간",
                    value: alloutpercent
                }],
				   colors: [
                    '#2196F3','#ff9800','#F44336'
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
