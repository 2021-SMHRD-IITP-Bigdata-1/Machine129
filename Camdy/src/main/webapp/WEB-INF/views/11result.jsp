<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>rank</title>
<link href="${path}/resources/css/result.css" rel="stylesheet"/ >
</head>
<body>
    
    
        <div class="box1">
            <p class="box1-p1">
            <c:choose>
            	<c:when test="${hour != 0}">
            	${hour}시간
            	</c:when>
            </c:choose>
            <c:choose>
            	<c:when test="${minute != 0}">
            	${minute}분
            	</c:when>
            </c:choose>
            <c:choose>
            	<c:when test="${seconds != 0}">
            	${seconds}초 
            	</c:when>
			</c:choose>
			</p>
			<p class="box1-p1-1">기록</p>
            
            <c:set var="today" value="<%=new java.util.Date()%>" />
            <c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set> 
            <p style="font-family: 'Pretendard-Regular'; margin-bottom:8px;"><c:out value="${date}"/></p>
            <p class="box1-p2">${study_now}-${study_end}</p>   
        </div>
        
        <div class="box2">
        <p class="box1-p2"> 📚 어제는 총 ${bhour}시간 ${bminute}분 공부했습니다.</p>
        </div>
        
        <div class="box3">
        <p class="box3-p1" style="margin-left:10px;"> 순 공부시간 </p>
        <div class="box-box1" style="margin-left:10px;">
        <c:choose>
            <c:when test="${puhour != 0}">
            ${puhour}시간
            </c:when>
        </c:choose>
            <c:choose>
            <c:when test="${puminute != 0}">
            ${puminute}분
        	</c:when>
        </c:choose>
        <c:choose>
            <c:when test="${puseconds != 0}">
            ${puseconds}초 
            </c:when>
		</c:choose>           
        
        </div>
        <div class="box3-box2">🔥</div>
        </div>
        
        
        
        
        <div class="box3" style="margin-left:6px;">
        <p class="box3-p1" style="margin-left:10px;"> 휴대폰 사용 </p>
        <div class="box-box1" style="margin-left:10px;">
        <c:choose>
            <c:when test="${phour != 0}">
            ${phour}시간
            </c:when>
        </c:choose>
            <c:choose>
            <c:when test="${pminute != 0}">
            ${pminute}분
        	</c:when>
        </c:choose>
        <c:choose>
            <c:when test="${pseconds != 0}">
            ${pseconds}초 
            </c:when>
		</c:choose>
        </div>
        <div class="box3-box2">📱</div>
        </div>
        
        <div class="box3">
        <p class="box3-p1" style="margin-left:10px;"> 자리 비움 </p>
        <div class="box-box1" style="margin-left:10px;">
        <c:choose>
            <c:when test="${ohour != 0}">
            ${ohour}시간
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${ominute != 0}">
            ${ominute}분
        	</c:when>
        </c:choose>
        <c:choose>
            <c:when test="${oseconds != 0}">
            ${oseconds}초 
            </c:when>
		</c:choose>        
        </div>
        <div class="box3-box2">🏃‍♂️</div>
        </div>
        
        <div class="box3" style="margin-left:6px;">
        <p class="box3-p1" style="margin-left:10px;"> 오늘 공부 시간 </p>
        <div class="box-box1" style="margin-left:10px;">${thour}시간  ${tminute}분</div>
        <div class="box3-box2">💦</div>
        </div>
        
        <div class="box2">
        <p class="box1-p2"> ${user_nickname}님! 순 공부시간 비율은 약 ${pupercent}% 입니다.</p>
        </div>
        <div class="box2">
        <p class="box1-p2"> ${user_nickname}님! 목표시간 까지 시간 분 남았습니다</p>
        </div>
        
        
        
            
            <div class="outbtn">
                <button type="button" onclick="location.href='/camdy'" style="font-family: 'Pretendard-Regular';">나가기</button>
            </div>
        
        
    
</body>
