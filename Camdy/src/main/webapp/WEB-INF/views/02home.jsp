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
<link href="${path}/resources/css/theme.css" rel="stylesheet"/>
<link href="${path}/resources/css/home.css" rel="stylesheet"/>

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
        <div class="container"><a class="navbar-brand" href="intro"><img src="${path}/resources/image/logo.png" height="52" alt="로고" /></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base">
              <li class="nav-item px-2 font-2"><a class="nav-link active" aria-current="page" href="${path}">홈</a></li>
              <li class="nav-item px-2-1 font-2"><a class="nav-link" aria-current="page" href="ajaxboard1" >커뮤니티</a></li>
              
            </ul>
            <c:choose>
            <c:when test="${user_id == null}">
            	<a class="btn-g btn-primary order-1 order-lg-0 font-1 me-2" href="login" style="">&nbsp로그인&nbsp</a>
            	<a class="btn-g btn-primary order-1 order-lg-0 font-1" href="login" style="">&nbsp스터디 참여하기&nbsp</a>
            </c:when> 
            <c:when test="${user_id != null}">
            	<div class="me-2 ms-4"><a href="#!"><img src="${path}/resources/image/user.png" height="40" alt="마이페이지" /></a></div>
            	<div class="me-4"><b>${user_nickname}</b>님 환영합니다.</div>
            	<a class="btn-g btn-primary order-1 order-lg-0 font-1 me-2" href="logout" style="">&nbsp로그아웃&nbsp</a>
            </c:when> 
            </c:choose>


            
           
          </div>
        </div>
      </nav>
      
     
      <!-- ============================================-->
      <!-- <HOME> begin ============================-->
      
      
       <div class="home">
            <div class="mine-study">
                <h2 class="font-title">내 스터디</h2>               
            </div> 
            
            <c:choose>
            <c:when test="${empty mlist}">
            
	             <div class="study-item mb-8">
	                <p class="study-item-tx"><h4>내 스터디는 내가 만든 스터디 또는<br>초대 받은 스터디가 등록됩니다</h4></p>
	                <p class="study-item-tn">스터디 만들기에서 내 스터디를 만들어 보세요✋</p>
	             </div>
             
             </c:when>
             <c:otherwise>
             
             <div>
             
             <table class="table">
             	<tr>
             		<td width=296px></td>
             		<td width=296px></td>
             		<td width=296px></td>
             		<td width=296px></td>
             		<td width=296px></td>
             		    		

             	</tr>

            	<c:forEach var="i" begin="0" end="${fn:length(mlist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${mlist}" begin="${i}" end="${i+4}">
                    <td><a href="#!"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b><br>
		                    </c:when>
		                    <c:otherwise>
						        <b><c:out value="${vo.study_title}"></c:out></b><br>
						    </c:otherwise>
		                 </c:choose>
		                 <c:choose>   
                            <c:when test="${fn:length(vo.study_content) gt 15}">
		                        <c:out value="${fn:substring(vo.study_content, 0, 15)}"></c:out>...
                            </c:when>
                            <c:otherwise>
						        <c:out value="${vo.study_content}"></c:out>
						    </c:otherwise>
                         </c:choose>
                        </p>
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
                 
           </table>     
             
             </div>
             </c:otherwise>
         
         </c:choose>    
             
             
             <!--  오픈 스터디 구역 -->
             
             
             
             
             
            <div class="open-study">
                <h2 class="font-title mb-4">오픈 스터디</h2>
                <h4 class="study-search" style="display: none;">""검색결과</h4>
            </div>
            <div class="study-tab">
                <ul class="study-tab-list" id="container">
                    <li class="study-tab-btn flex-item">
                        <button data-study-tab="all" class="study-btn">전체</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button data-study-tab="new" class="study-btn">신규 스터디</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button data-study-tab="participate" class="study-btn">참여한 스터디</button>
                    </li>
                </ul>
            </div>
            
            
            <table class="table">
            	<c:forEach var="i" begin="0" end="${fn:length(slist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${slist}" begin="${i}" end="${i+4}">
                    <td><a href="#!"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b><br>
		                    </c:when>
		                    <c:otherwise>
						        <b><c:out value="${vo.study_title}"></c:out></b><br>
						    </c:otherwise>
		                 </c:choose>
		                 <c:choose>   
                            <c:when test="${fn:length(vo.study_content) gt 15}">
		                        <c:out value="${fn:substring(vo.study_content, 0, 15)}"></c:out>...
                            </c:when>
                            <c:otherwise>
						        <c:out value="${vo.study_content}"></c:out>
						    </c:otherwise>
                         </c:choose>
                        </p>
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
               
                
            
                
           </table>                
    </div>
    <div class="sticky">
    <a href="make"><img src="${path}/resources/image/add.png" height="45" alt="로고" /></a>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
      
       
      
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