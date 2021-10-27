<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
        
        <link href="${path}/resources/css/theme.css" rel="stylesheet"/>
        <link href="${path}/resources/css/join.css" rel="stylesheet"/>
        <script src=""></script>
    </head>
    
   
 
 
    <body>
    
        <div class="join-form">
        	<a class="text-decoration-none" href="intro"><img src="${path}/resources/image/logo.png" height="51"/></a>
            <h1> 회원가입</h1>
            <form action="${path}/boardInsert.do" method="post">
                <div class="content">
                    <label for="e-mail">이메일 (필수)</label>
                    <input type="text" name="user_id" id="user_id" autocapitalize="off" required>
                </div>           
                <div class="content">
                    <label for="pw">비밀번호 (필수)</label>
                    <input type="password" name="user_pw" id="user_pw"
                    autocapitalize="off" required>
                    <span class="error_next_box"></span>
                </div>
                <div class="content">
                    <label for="pw">비밀번호 재확인</label>
                    <input type="password" 
                    autocapitalize="off" required>
                    <span class="error_next_box"></span>
                </div>
                <div class="content">
                    <label for="nickname">성함</label>
                    <input type="text" name="user_name" id="user_name"
                    autocapitalize="off" required>
                    <span class="error_next_box"></span>
                </div>
                <div class="content">
                    <label for="nickname">닉네임 (필수)</label>
                    <input type="text" name="user_nickname" id="user_nickname"
                    autocapitalize="off" required>
                    <span class="error_next_box"></span>
                </div>
                <!--  <div class="content">
                    <label for="avartar">프로필 사진 (선택)</label>
                    <input type="file" name="avartar" id="avartar"
                    autocapitalize="off" required accept="image/png, image/jpeg">
                </div>
                 <div class="gender">
                    <label class="contentg">성별 (선택) :
                        <input type="radio" class="checkbox" value="true" name="study">
                        <span class="formlabel input open">남</span>
                    </label>
                    <label class="contentg">
                        <input type="radio" class="checkbox" value="true" name="study">
                        <span class="formlabel input open">여</span>
                    </label>
                </div>
                -->
                <!--BIRTH-->
                <div id="bir_wrap">
                    <label for="yy">생년월일 (선택)</label>
                </div>       
                <div id="bir_yy">
                    <span class="box">
                        <input type="date" id="user_birthdate" name="user_birthdate" class="int" >
                    </span>
                </div>
               <!--  <div id="bir_mm">
                    <span class="box">
                        <select id="mm" style="width:100%; height: 100%; font-size: 20px;">
                            <option>월</option>
                            <option value="01">1</option>
                            <option value="02">2</option>
                            <option value="03">3</option>
                            <option value="04">4</option>
                            <option value="05">5</option>
                            <option value="06">6</option>
                            <option value="07">7</option>
                            <option value="08">8</option>
                            <option value="09">9</option>                                    
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </span>
                </div>
                <div id="bir_dd">
                    <span class="box">
                        <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                    </span>
                </div>--> 
                <div  class="content1">
                    		나의 목표 (선택)<br> 
                    <textarea rows = "5" cols ="60"></textarea>
                </div>        
                <div class="btn-area1">
                    <button type="submit">회원가입 완료</button>
                </div>
            </form>
        </div>
    </body>
</html>