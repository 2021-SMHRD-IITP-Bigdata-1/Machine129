<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>캠디 - 화상채팅으로 공부하세요</title>
    <link href="${path}/resources/css/login.css" rel="stylesheet"/ >
    <link href="${path}/resources/css/theme.css" rel="stylesheet"/>
    
</head>

<body>
   <header>
    <div class="w-md-100 pt-sm-4 ps-sm-7" >
          <div class="row">
            <div class="col-12 col-sm-12 col-lg-6 mb-1 order-0 order-sm-0"><a class="text-decoration-none" href="intro"><img src="${path}/resources/image/logo.png" height="51"/></a></div>
          </div>
        </div>
 </header>
        
    <div class="login-form">    
    <section class="logincard">
    
       <h2 class="static">자동으로 공부시간을 측정해주는</h1>
        <h1 class="static">캠디와 함께 공부해요✍️</h1>
        <form action="${path}/login.do" class="static" method="post">
            <div class="int-area">
                <input type="text" name="user_id" id="user_id"
                autocapitalize="off" placeholder="이메일을 입력해주세요." required >
                
            </div>
            <div class="int-area">
                <input type="password" name="user_pw" id="user_pw"
                autocapitalize="off" placeholder="비밀번호을 입력해주세요." required>
            </div>
            <div class="btn-area" style="margin-top:50px;">
                <button class="button1" type="submit">로그인</button>
            </div>
        </form>
        <div class="btn-area">
                <button class="button2" onclick="location.href='${path}/join'">회원가입</button>
            </div>
        <div class="caption static">
            <a href="">비밀번호 찾기</a>
        </div>
    
    </section>
   </div>
    <!--   <script>
        let id = $('#id');
        let pw = $('#pw');
        let btn = $('#btn');

        $(btn).on('click', function(){
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
            }
            else if($(pw).val() == ""){
                $(pw).next('label').addClass('warning')
            }
        });
    </script>-->

</body>
</html>