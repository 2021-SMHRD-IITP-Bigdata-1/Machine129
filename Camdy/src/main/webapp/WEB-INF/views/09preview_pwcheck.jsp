<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>캠디</title>
<link href="${path}/resources/css/theme.css" rel="stylesheet"/>
<link href="${path}/resources/css/preview.css" rel="stylesheet"/>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${path}/resources/js/preview.js"></script>
<script>
    let id = document.getElementById('user_id');
    let pw = document.getElementById('study_pw');
	console.log(id.value);
	console.log(pw.value);
	
	function pwcheck(){
		
		console.log("비밀번호 체크기능")
		let inputpw = document.getElementById("study_pw").value;
		let pw = document.getElementById("pw").value;
		let seq = document.getElementById("seq").value;
		console.log(inputpw)
		console.log(pw)
		console.log(seq)
		
		
		if(inputpw == pw){
			Swal.fire({
	    		  title: '입장이 진행됩니다😊',
	    		  text: "현재 팝업창은 자동으로 꺼집니다.",
	    		  icon: 'success',
	    		  timer: 3000
	    		}).then((result) => {
	    			  location.href='${path}/studygo.do?study_seq='+seq;
	    		})
		}else{
			Swal.fire({
	            title: '비밀번호가 틀렸습니다',
	            text: "다시 한번 확인해주세요",
	            icon: 'warning',
	            showCancelButton: false,
	            confirmButtonColor: '#3085d6',
	            confirmButtonText: '확인',
	          }).then((result) => {
	            if (result.value) {
	             location.reload();
	            } 
	          })
		}
		
	}
	
    </script>
<style>
#basic{
    background: #f5f6f7;
    position: absolute;
    margin-left: 33%;
    margin-right:33%;
    width: 33%;
}

.in-btn button {
    width: 13%;
    height: 45px;
    background: #b9fbc0;
    font-size: 25px;
    border-radius: 10px;
    text-align: center;
    padding: 4px;
    cursor: pointer;
    float: right;
    border: 0;
}

</style>
</head>

<body>
	<header>
    <div class="w-md-100 pt-sm-4 ps-sm-7" style="background-color:#f5f6f7;" >
    <!-- #f5f6f7 -->
          <div class="row">
            <div class="col-12 col-sm-12 col-lg-6 mb-1 order-0 order-sm-0"><a class="text-decoration-none" href="intro"><img src="${path}/resources/image/logo.png" height="51"/></a></div>
          </div>
        </div>
 	</header>
			<div id="basic">
	            <div class="study-be mt-4 mb-3">
	                    <h5 class="mb-6" style="font-size:24px;"><b style="background-color:#b9fbc0;">"
	                    	
									${vo.study_title}
								
							"</b> 스터디 방 입니다.</h5>
	                    
	                    
	                    
	                    
	                    <h6 style="font-size:24px;"><b>🚨이 방은 비밀번호가 있어요!🚨</b></h6><br>
	                    <div width="100%" style="padding:10px; background-color:#ced4da; border-radius: 10px; font-size:15px;" >
	                    
			
		                    <div class="form-group">
        						<label for="validate-optional">비밀번호를 입력해주세요.</label>
    								<div class="input-group">
										<input type="password" class="form-control" name="study_pw" id="study_pw" required>
										<span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
									</div>
							</div>
							
	          		</div>            
	                    <div class="in-btn">
		                	<button type="button" onclick="pwcheck()">🏃‍♀️🏃‍♂️</button>
	                    </div>  
       		 	
	            </div>
	            <input type="hidden" id="pw" name="pw" value="${vo.study_pw}">
	            <input type="hidden" id="seq" name="seq" value="${vo.study_seq}">
	          		</div>
	          		
	          	
	          	<!-- 끝 -->
        

    
    
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="${path}/resources/js/preview.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
</body>

</html>