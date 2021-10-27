<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page session="true" %>
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
              <li class="nav-item px-2 font-2"><a class="nav-link active" aria-current="page" href="#!" >홈</a></li>
              <li class="nav-item px-2 font-2"><a class="nav-link" aria-current="page" href="ajaxboard1" >커뮤니티</a></li>
              <li class="nav-item px-2-1 font-2"><a class="nav-link" aria-current="page" href="#!" >마이페이지</a></li>
            </ul>
            <c:choose>
            <c:when test="${user_id == null}">
            	<a class="btn-g btn-primary order-1 order-lg-0 font-1 me-2" href="login" style="">&nbsp로그인&nbsp</a>
            </c:when> 
            <c:when test="${user_id != null}">
            	<a class="btn-g btn-primary order-1 order-lg-0 font-1 me-2" href="logout" style="">&nbsp로그아웃&nbsp</a>
            </c:when> 
            </c:choose>


            <a class="btn-g btn-primary order-1 order-lg-0 font-1" href="#!" style="">&nbsp스터디 참여하기&nbsp</a>
           
          </div>
        </div>
      </nav>
      
     
      
       <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
  		<image class="image-thumbnail" src="${path}/resources/image/intro/01.jpg">
        
        
        </div>
        <div class="swiper-slide" style="background-color:#a3c4f3">
        <image class="image-thumbnail" src="${path}/resources/image/intro/02.jpg">
        
        </div>
        <div class="swiper-slide" style="background-color:#cfbaf0">
        <image class="image-thumbnail" src="${path}/resources/image/intro/03.jpg">
        </div>
         
       </div>
      <div class="swiper-pagination"></div>
    </div>
      
      
    
    <section class="pt-6 bg-600 bg-light" id="home">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-5 col-lg-6 order-0 order-md-1 text-end container">
            	<div class="col-lg-6 float-l">
            		<div class="p-3 m-sm-3 text-center fs-8 " >⏱️</div>
            		<div class="p-3 m-sm-3 text-center" style="background-color:#b9fbc0; border-radius:10px">공부시간을 자동으로 측정합니다.</div>
            	</div>
	            <div class="col-lg-6 float-l">
	            	<div class="p-3 m-sm-3 text-center fs-8" >🏃‍♂️</div>
	            	<div class="p-3 m-sm-3 text-center" style="background-color:#b9fbc0; border-radius:10px">자리를 이탈하면 자동으로 시간이 멈춰요!</div>
	            </div>
	            <div class="col-lg-6 float-l">
	            	<div class="p-3 m-sm-3 text-center fs-8" >💤</div>
	            	<div class="p-3 m-sm-3 text-center" style="background-color:#b9fbc0; border-radius:10px">깜빡 잠에 들어도, TIME STOP!</div>
	            </div>
	            <div class="col-lg-6 float-l">
	            	<div class="p-3 m-sm-3 text-center fs-8" >📱</div>
	            	<div class="p-3 m-sm-3 text-center" style="background-color:#b9fbc0; border-radius:10px">당신의 휴대폰 사용을 탐지합니다.</div>
	            </div>
	            

            </div>
            <div class="col-md-7 col-lg-6 text-md-start text-center py-6">
              <h4 class="fs-6 fs-xl-7 mb-5 font-1">캠디는 당신의 공부시간을 자동으로 측정합니다.</h4>
              <h1 class="fs-2 mb-5 font-2-1">당신의 행동을 자동으로 인식해 자리를 이탈할 때,<br> 깜빡 잠이들 때, 휴대폰 몰래 할때 시간이 멈춰요⏰</h1>
              <a class="btn-g btn-primary p-3 order-1 order-lg-0 font-1 me-2" href="#!" role="button">스터디 참여하기</a>
            </div>
          </div>
        </div>
      </section>
      
      
      <!-- ============================================-->
      <!-- <section> begin ============================-->
      

        <div class="pt-sm-3 ps-sm-7" style="background-color: #b9fbc0 !important;">
          
            <div class="row col-12 col-sm-12 col-lg-6 order-0 order-sm-0 ">
            <a class="text-decoration-none float-l" href="#"><img src="${path}/resources/image/logo.png" height="51" alt="" /></a>
            <p class="text-light my-2 float-l"> <span class="text-light" style="color:#4d908e !important;"> made by 하하 · jihee · 첸쥬띵  · 딸기가 좋아 </span></p>
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