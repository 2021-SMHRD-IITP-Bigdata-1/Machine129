<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/theme.css" rel="stylesheet"/>

<!-- Swiper API -->
<link  href="${path}/resources/css/swiper-bundle.css" rel="stylesheet">
<link  href="${path}/resources/css/swiper-bundle.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script type="text/javascript">
	function goDel(idx){
		location.href="${cpath}/boardDelete.do?idx="+idx;
	}
	
	function goMain(){
		location.href="board";
	}
	
	$(document).ready(function(){
		$("#fileInput").on('change', function(){  // 값이 변경되면
			if(window.FileReader){  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
	 			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}

	 		// 추출한 파일명 삽입
			$("#userfile").val(filename);
		});
	});
  </script>
  
  
  
</head>
<body>

 <!-- ============================================-->
      <!-- <section> begin ============================-->
      <section class="bg-intro-top py-0 d-none d-sm-block">

        <div class="container">
          <div class="row align-items-center">
            <div class="col-auto d-none d-lg-block">
              <p class="my-2 fs-0"><i class="fas fa-map-marker-alt me-3"></i><span> [이벤트] 📚캠디배 스터디방 승급전! 지금 참여하세요! </span></p>
            </div>
            <div class="col-auto ms-md-auto order-md-2 d-none d-sm-block">
              <ul class="list-unstyled list-inline my-2">
                <a class="btn btn-primary-event order-1 order-lg-0" href="#!">&nbsp참여하기 ▷&nbsp</a>
              </ul>
            </div>
            
          </div>
        </div>
        <!-- end of .container-->

      </section>
      <!-- <section> close ============================-->
      <!-- ============================================-->

 <nav class="navbar navbar-expand-lg navbar-light sticky-top py-4 d-block bg-light" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container"><a class="navbar-brand" href="#!"><img src="${path}/resources/image/logo.png" height="52" alt="로고" /></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base">
              <li class="nav-item px-2 font-2"><a class="nav-link active" aria-current="page" href="intro" >홈</a></li>
              <li class="nav-item px-2 font-2"><a class="nav-link" aria-current="page" href="board" >커뮤니티</a></li>
              <li class="nav-item px-2-1 font-2"><a class="nav-link" aria-current="page" href="#!" >마이페이지</a></li>
            </ul><a class="btn-g btn-primary order-1 order-lg-0 font-1 me-2" href="#!" style="">&nbsp로그인&nbsp</a>  
            </ul><a class="btn-g btn-primary order-1 order-lg-0 font-1" href="#!" style="">&nbsp스터디 참여하기&nbsp</a>
           
          </div>
        </div>
      </nav>
      
     
      
      <div class="container">
  <h2>Camdy 커뮤니티</h2>
  <div class="panel panel-default">
    <div class="panel-heading"></div>
    <br>
    <div class="panel-body">
		<form class="form-horizontal" action="${cpath}/camdy/camdyboardInsert" method="post">
		    
			  <div class="dropdown">
			  <label class="control-label col-sm-2">카테고리:</label>
			    <select class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" name="post_type" required>
			    	<option selected disabled>===선택===</option>
			    	<option>뉴스</option>
			      	<option>사담</option>
			      	<option>꿀팁</option>
			      	<option>정보</option>
			    </select>
			    
			  </div>
			
		   <br>
		    <div class="form-group">
		      <label class="control-label col-sm-2">제목:</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" name = "post_title" placeholder="제목을 입력해주세요" required>
		      </div>
		    </div>
		   <br>
		    <div class="form-group">
		      <label class="control-label col-sm-2">내용:</label>
		      <div class="col-sm-10">          
		      	<textarea class="form-control" rows="5" placeholder="내용을 입력해주세요" name="post_content" required></textarea>
		      </div>
		    </div>
		    <br>
		    <div class="form-group">
		      <label class="control-label col-sm-2">작성자:</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" name = "user_id" required>
		      </div>
		    </div>
		   <br>
			<div class="custom-file">
			<label class="control-label col-sm-2">파일 첨부:</label><br>
				<input type="file" class="custom-file-input" id="customFile" name="post_pic">
				
			</div>


			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary btn-sm">등록</button>
					<button type="reset" class="btn btn-warning btn-sm"
						onclick="goMain()">취소</button>
				</div>
			</div>

		</form>
    </div>
    <br>
    <div class="panel-footer"></div>
  </div>
</div>
      
      
      
      <!-- ============================================-->
      <!-- <section> begin ============================-->
      

        <div class="pt-sm-5 ps-sm-7" style="background-color: #b9fbc0 !important;">
          <div class="row">
            <div class="col-12 col-sm-12 col-lg-6 mb-1 order-0 order-sm-0"><a class="text-decoration-none" href="#"><img src="${path}/resources/image/logo.png" height="51" alt="" /></a>
              <p class="text-light my-4"> <span class="text-light" style="color:#4d908e !important;"> made by 하하 · jihee · 첸쥬띵  · 딸기가 좋아 </span>
            </div>
           
          </div>
        </div>
        <!-- end of .container-->

      
      <!-- <section> close ============================-->
      <!-- ============================================-->
      
      
      
    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    
    <script src="${path}/resources/js/theme.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
     <script>
      var swiper = new Swiper(".mySwiper", {
        spaceBetween: 0,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        autoplay: {
            delay: 3000,
          },
        
      });
    </script>
    
      
</body>
</html>