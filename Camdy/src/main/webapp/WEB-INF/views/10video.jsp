<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/video.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>


    
    
         
        <section>
                  
            <div id="myvideo" class="myvideo">              
                <div class="video">
                    <video width=100% height=70% autoplay="true" id="videoElement">
                    <canvas id="canvas" width="320" height="240" "></canvas>
                </div>
                
                <div id='box' class="box">                 
                    
                        <div id="time" class="time" style="font-size:30px; margin-top:3px !important;margin-left:10px !important">00:00:00</div>
                    	<p style="color:white; margin-top:60px !important; margin-left:20px;">시작시간<br>${study_now}</p>
                    	
                       <!-- <div class="btnbox" style="margin-top:10px !important;">
                              <i id="startbtn" class="fa fa-play" aria-hidden="true"></i>
                            <i id="stopbtn" class="fa fa-stop" aria-hidden="true"></i>
                            <i id="pausebtn" class="fa fa-pause" aria-hidden="true"></i>-->
                    	</div>
                </div>
                
            </div>
            
            <div class="sorryimg mb-2" >
                <div class="nosignal"> <br><br><br><br><br>no signal </div>
               
            </div>
            
            <div class="sorryimg mb-2" >
                <div class="nosignal"> <br><br><br><br><br>no signal </div>            
            </div>
            
            <div class="sorryimg mb-2" >
                 <div class="nosignal"> <br><br><br><br><br>no signal </div>           
            </div>
            
        </section>
        
        <div class="exit hide">
	    	<button class="exit2" onclick="location.href='result?study_seq=${study_seq}'">나가기</button>
	    	
    	</div>
    	
    	<div id="stop" class="stop">
	    	<button id="stop2" onclick="">STOP!</button>
    	</div>
    	
    	
    	<input type="hidden" id="user_id" name="user_id" value=${user_id} >
    	
    
    
    
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/resources/js/stopwatch.js"></script>
    <script type="text/javascript">
        
        var video = document.querySelector("#videoElement");
        var canvas = document.getElementById('canvas');
        var context = canvas.getContext('2d');
        var user_id = document.getElementById('user_id').value;
        
        
        

        if (navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(function (stream) {
            video.srcObject = stream;
            })
            
        }
        
       
        
        //stopwatch.js
        var time = 0;
        
        var starFlag = true;
        $(document).ready(function(){
          buttonEvt();
        });

        function init(){
          document.getElementById("time").innerHTML = "00:00:00";
        }

        function buttonEvt(){
          var hour = 0;
          var min = 0;
          var sec = 0;
          var timer;
          
          if(time == 0){
              init();
            }

            timer = setInterval(function(){
              time++;

              min = Math.floor(time/60);
              hour = Math.floor(min/60);
              sec = time%60;
              min = min%60;

              var th = hour;
              var tm = min;
              var ts = sec;
              if(th<10){
              th = "0" + hour;
              }
              if(tm < 10){
              tm = "0" + min;
              }
              if(ts < 10){
              ts = "0" + sec;
              }

              document.getElementById("time").innerHTML = th + ":" + tm + ":" + ts;
            }, 1000);
            
          // start btn => 시작되야함.
          document.getElementById("stop2").addEventListener("click",cap);
          
          function cap() {
			   context.drawImage(video,0,0,320,240);
			   var dataURL = canvas.toDataURL();
			   $.ajax({
			         type: "POST",
			         url: "http://127.0.0.1:8082/img",
			         contentType: "application/x-www-form-urlencoded; charset=utf-8",
			         data: { "imgBase64": dataURL,
			        	     "user_id":user_id},
			         success: function(data) {
			            console.log(data);
			        },
			        error: function(e){
			            console.log(e);
			        }
			   });
			   
			   

			}
          
          
          let capinter = setTimeout(function tick(){
				 cap();
				 capinter = setTimeout(tick,1000)
			   }, 1000);
          
          
          
          document.getElementById("stop").addEventListener("click",clear);
          
          
          function clear(){
        	  document.querySelector('.exit').classList.remove('hide');
        	  document.querySelector('.stop').classList.add('hide');
        	  clearTimeout(capinter);
          }
          
          

        

         
        }

    </script>   
</body>
</html>