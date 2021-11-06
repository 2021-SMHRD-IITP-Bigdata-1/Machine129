<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<video id="video" width="320" height="240" autoplay></video>
<canvas id="canvas" width="320" height="240"></canvas>
<button type="button" id="webcamBtn">캡쳐하기</button>
<script src="js/html2canvas.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
   navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
      var video = document.getElementById('video');
      video.srcObject = stream;
      video.play();
   });
}

var canvas = document.getElementById('canvas');
var context = canvas.getContext('2d');
var video = document.getElementById('video');
document.getElementById("webcamBtn").addEventListener("click",function() {
   context.drawImage(video,0,0,320,240);
   var dataURL = canvas.toDataURL();
   $.ajax({
         type: "POST",
         url: "http://127.0.0.1:8082/img",
         contentType: "application/x-www-form-urlencoded; charset=utf-8",
         data: { "imgBase64": dataURL },
         success: function(data) {
            console.log(data);
        },
        error: function(e){
            console.log(e);
        }
   });
});
</script>
</head>
<body>

</body>
</html>