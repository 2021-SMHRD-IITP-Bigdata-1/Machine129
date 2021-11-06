<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>rank</title>
<link href="${path}/resources/css/result.css" rel="stylesheet"/ >
<script src="js/jquery-3.6.0.min.js" crossorigin="anonymous"></script> 
</head>
<body>
    <form>
        <div class="time">
            <p>총 ${hour}시간 ${minute}분 ${seconds}초 기록되었습니다.</p>
            <p>${study_now} 부터 ${study_end}까지 공부하였습니다.</p>
        </div>
        <div class="rankbody">
            <div class="rank-item">
                <p style="font-size: 40px;">스터디 랭킹<img src="img/crown.png" style="width: 20%; vertical-align: middle; margin-bottom: 10%;"></p>
                <div class="rank-itemim">
                    <img src="img/first.png"><p>jihee</p>
                </div>
                <div class="rank-itemim">
                    <img src="img/second (1).png"><p>jihee</p>
                </div>
                <div class="rank-itemim">
                    <img src="img/third (1).png"><p>jihee</p>
                </div>
                <div class="rank-itemim">
                    <img src="img/four.png"><p>jihee</p>
                </div>
            </div>
            <div class="score">
                <p>jihee 님의 집중도 점수는</p>
                <p>88점 입니다.</p>
            </div>
            <div class="outbtn">
                <button type="button" onclick="location.href='/camdy'">나가기</button>
            </div>
        </div>
        
    </form>
</body>
