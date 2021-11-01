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
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 
                        </p>
                        <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
                        
                        <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->  
		                
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
            <div class="mb-3 ms-3">총 <b>${fn:length(slist)}개</b> 스터디 </div>
            <div class="study-tab">
                <ul class="study-tab-list" id="container">
                    <li class="study-tab-btn flex-item">
                        <button class="study-btn allclick">전체</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button type="button" class="study-btn newclick">신규 스터디</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button data-study-tab="participate" class="study-btn trigger">카테고리 ▼</button>
                        <button data-study-tab="participate" class="study-btn trigger2 hidden2">카테고리 ▲</button>
                    </li>
                </ul>
            </div>
            
            
            <div class="study-tab hidden">
                <ul class="study-tab-list" id="container">
                    <li class="study-tab-btn flex-item">
                        <button type="button" class="cate-btn langclick" style="background-color:#98F5E1 !important;">🅰️어학</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button type="button" class="cate-btn jobclick" style="background-color:#90DBF4 !important;">🔥취업</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button type="button" class="cate-btn cerclick" style="background-color:#A3C4F3 !important;">📇자격증</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button type="button" class="cate-btn offclick" style="background-color:#CFBAF0 !important;">🏢공무원</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button type="button" class="cate-btn uniclick" style="background-color:#F1C0E8 !important;">✍️대입수능</button>
                    </li>
                    <li class="study-tab-btn flex-item">
                        <button type="button" class="cate-btn teacherclick" style="background-color:#FDE4CF !important;">👩‍🏫임용</button>
                    </li>
                    
                </ul>
            </div>
            
            
            <!-- /////////////////////// 전체보기 /////////////////////// -->
            
            <table class="table all">
            	<c:forEach var="i" begin="0" end="${fn:length(slist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${slist}" begin="${i}" end="${i+4}">
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 </p>
		                 <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
		                 
		                <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->   
		                                    
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
           </table>
           
           <!-- /////////////////////// 신규 스터디 /////////////////////// -->
           
           <table class="table new hide">
           		<tr>
           		<c:forEach var="i" begin="0" end="5" >
             		<td width=296px></td>
             	</c:forEach>

             	</tr>
            	<c:forEach var="i" begin="0" end="${fn:length(nlist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${nlist}" begin="${i}" end="${i+4}">
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 </p>
		                 <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
		                 
		                <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->   
		                                    
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
           </table>
           
           
           <!-- /////////////////////// 1.어학 /////////////////////// -->
           
           <table class="table lang hide">
           		<tr>
           		<c:forEach var="i" begin="0" end="5" >
             		<td width=296px></td>
             	</c:forEach>

             	</tr>
            	<c:forEach var="i" begin="0" end="${fn:length(lalist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${lalist}" begin="${i}" end="${i+4}">
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 </p>
		                 <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
		                 
		                <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->   
		                                    
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
           </table>
           
           
           <!-- /////////////////////// 2.취업 /////////////////////// -->
           
           <table class="table job hide">
           		<tr>
           		<c:forEach var="i" begin="0" end="5" >
             		<td width=296px></td>
             	</c:forEach>

             	</tr>
            	<c:forEach var="i" begin="0" end="${fn:length(jlist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${jlist}" begin="${i}" end="${i+4}">
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 </p>
		                 <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
		                 
		                <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->   
		                                    
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
           </table>
           
           
           <!-- /////////////////////// 3.자격증 /////////////////////// -->
           
           <table class="table cer hide">
           		<tr>
           		<c:forEach var="i" begin="0" end="5" >
             		<td width=296px></td>
             	</c:forEach>

             	</tr>
            	<c:forEach var="i" begin="0" end="${fn:length(clist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${clist}" begin="${i}" end="${i+4}">
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 </p>
		                 <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
		                 
		                <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->   
		                                    
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
           </table>
           
           
           
            <!-- /////////////////////// 4.공무원 /////////////////////// -->
           
           <table class="table off hide">
           		<tr>
           		<c:forEach var="i" begin="0" end="5" >
             		<td width=296px></td>
             	</c:forEach>

             	</tr>
            	<c:forEach var="i" begin="0" end="${fn:length(olist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${olist}" begin="${i}" end="${i+4}">
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 </p>
		                 <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
		                 
		                <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->   
		                                    
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
           </table>
           
           
           
           
           <!-- /////////////////////// 5.공무원 /////////////////////// -->
           
           <table class="table uni hide">
           		<tr>
           		<c:forEach var="i" begin="0" end="5" >
             		<td width=296px></td>
             	</c:forEach>

             	</tr>
            	<c:forEach var="i" begin="0" end="${fn:length(ulist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${ulist}" begin="${i}" end="${i+4}">
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 </p>
		                 <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
		                 
		                <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->   
		                                    
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
           </table>
           
           
           
           
           <!-- /////////////////////// 6.임용 /////////////////////// -->
           
           <table class="table teacher hide">
           		<tr>
           		<c:forEach var="i" begin="0" end="5" >
             		<td width=296px></td>
             	</c:forEach>

             	</tr>
            	<c:forEach var="i" begin="0" end="${fn:length(tlist)+1/5}" step="5">
                <tr>
                    <c:forEach var="vo" items="${tlist}" begin="${i}" end="${i+4}">
                    <td><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><img class="imgset" src="${vo.study_pic}" alt="study-img"></a>
                    	
                        <p>
                        <c:choose>
	                        <c:when test="${fn:length(vo.study_title) gt 15}">
		                        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${fn:substring(vo.study_title, 0, 12)}"></c:out>...</b></a></p>
		                    </c:when>
		                    <c:otherwise>
						        <p class="pvalue"><a href="${path}/studygo.do?study_seq=${vo.study_seq}"><b><c:out value="${vo.study_title}"></c:out></b></a></p>
						    </c:otherwise>
		                 </c:choose>
		                 </p>
		                 <p class="number pvalue">👥&nbsp${vo.study_now}/4</p>
		                 
		                <!-- 카테고리  begin -->
		                <c:choose>
		                	<c:when test="${vo.study_cate != null}">
		                		<c:choose>
		                			<c:when test="${vo.study_cate == '어학'}">
				                         <p class="number" style="background-color:#98F5E1 !important;">🅰️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '취업'}">
				                         <p class="number" style="background-color:#90DBF4 !important;">🔥&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '자격증'}">
				                         <p class="number" style="background-color:#A3C4F3 !important;">📇&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '공무원'}">
				                         <p class="number" style="background-color:#CFBAF0 !important;">🏢&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:when test="${vo.study_cate == '대입 수능'}">
				                         <p class="number" style="background-color:#F1C0E8 !important;">✍️&nbsp${vo.study_cate}</p>
				                    </c:when>
				                    <c:otherwise>
				                         <p class="number" style="background-color:#FDE4CF !important;">👩‍🏫&nbsp${vo.study_cate}</p>
				                    </c:otherwise>
		                        </c:choose>
                         	</c:when>
		                </c:choose>     
		                <!-- 카테고리 end -->   
		                                    
                    </td>
                    </c:forEach>
                </tr>
               </c:forEach>
           </table>
           
           
           
           
           
                           
    </div>
	    <div class="sticky">
	    <a href="make"><img src="${path}/resources/image/add.png" height="45" alt="로고" /></a>
    </div>
    </div>
	    <div class="search">
	    <a href="make"><img src="${path}/resources/image/search.png" height="45" alt="로고" /></a>
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
    <script src="${path}/resources/js/home.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
	function nshow(){
		
		$('.hideall').css("display","none");
		$('.hidenew').css("display","inline-block");
	}

	</script>
  
      
</body>
</html>