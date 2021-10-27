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


<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script>
  	function goWrite() {
  		// 글쓰기 화면으로
		location.href="${cpath}/camdy/boardwrite";
	}
  	
  							//              0   1   2  
  	function resultHtml(data){ // data => [{ },{ },{ }]
  		// alert(data);
  		var view = "<table class='table'>";
  		view+="<tr>";
  		view+="<td>번호</td>";
  		view+="<td>제목</td>";
  		view+="<td>조회수</td>";
  		view+="<td>작성자</td>";
  		view+="<td>작성일</td>";
  		view+="</tr>";
  		//						0   {}내용
  		$.each(data, function(index, obj){
  			view+="<tr>";
  	  		view+="<td>"+obj.post_seq+"</td>";
  	  		view+="<td>"+obj.post_title+"</td>";
  	  		view+="<td>1</td>";
  	  		view+="<td>"+user_id+"</td>";
  	  		view+="<td>"+post_date+"</td>";
  	  		view+="</tr>";
  		});
  		view+="</table>";
  		// $() : 제이쿼리 선택자(selector)
  		$("#json").html(view);
  		
  	}
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
    <div class="panel-body">
      <table class="table">
         <tr>
           <td>번호</td>
           <td>제목</td>
           <td>조회수</td>
           <td>작성자</td>
           <td>작성일</td>
         </tr>
         <c:forEach var="vo" items="${list}">
	        <tr>
	          <td>${vo.post_seq}</td>
	          <td><a href="${cpath}/board?post_seq=${vo.post_seq}">${vo.post_title}</a></td>
	          <td>0</td>
	          <td>${vo.user_id}</td>
	          <td>${vo.post_date}</td>
	        </tr>
         </c:forEach>
         <tr>
         	<td colspan="5">
         		<button class="btn btn-primary btn-sm" value = "글쓰기" onclick="goWrite()">글쓰기</button>
         	</td>
         </tr>
      </table>   
    
      
      
      
      
    </div>
    <div class="panel-footer">Camdy</div>
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