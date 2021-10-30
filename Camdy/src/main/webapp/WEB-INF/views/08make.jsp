<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>newstudy</title>
    
    <link rel="stylesheet" href="newstudyst.css">
    <link href="${path}/resources/css/theme.css" rel="stylesheet"/>
    <link href="${path}/resources/css/make.css" rel="stylesheet"/>


    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 
</head>
<body style="background-color:#f5f6f7">
	
    <section class="study make">
        <form action="">
            <div class="studyrm">
                <label class="font-1" for="title">스터디 이름</label>
                <input type="text" name="study_title" id="study_title" autocapitalize="off" required placeholder="스터디 이름을 입력하세요.">
            </div>
           <!--  <div class="studyrm">
                <label for="tag">해시태그</label>
                <input type="text" name="tag" id="tag" autocapitalize="off" required
                    placeholder="스터디를 대표하는 키워드를 입력하세요.">
            </div>--> 
            <div class="studyrm">
                        <label class="font-1">스터디 에티켓</label>
                        <textarea id="study_content" name="study_content" placeholder="스터디 규칙, 공지사항 등을 입력해주세요."></textarea>
                    </div>
            <!--  <div id="test_cnt">(0 / 100 )</div>-->
            <div class="studyrm">
                <label class="font-1" for="avartar">대표 이미지</label>
                <input type="file" name="study_pic" id="study_pic" autocapitalize="off" required
                    accept="image/png, image/jpeg">
            </div>
            <!--  <div class="studyrm">
                <label for="open" class="formlabel input">스터디종류</label>
                <span class="formlabel badge">
                    <button class="badge"></button>
                </span>
            </div>-->
            <div class="studyrm">
                <label class="formlabel">
                    <input type="radio" class="checkbox" value="true" name="study">
                    <span class="formlabel input open">오픈 스터디</span>
                </label>
                <label class="formlabel">
                    <input type="radio" class="checkbox" value="true" name="study">
                    <span class="formlabel input open">초대 스터디</span>
                </label><br>
             </div>
             
             <div class="studyrm">
	             <label class="font-1 me-2" for="pw">비밀번호</label>
	             <input type="text" name="study_pw" id="study_pw" autocapitalize="off" placeholder="비밀번호를 입력하세요"><br>
             </div>  
                    
              <div class="studyrm"> 
                <label class="font-1 " for="date">기간</label>
                <p style="font-size:14px;">클래스 룸이 종료되는 날짜를 설정해주세요</p>
                  <input type="date" name="study_end_date" id="study_end_date" data-input class="form-control" value="date" style="width:296px !important">      
             </div>
            
            <div class="studyrm"> 
	            <label class="font-1 me-2" for="goal">목표시간</label>
	            <input name="study_mhour" id="study_mhour" type="number" style="text-align: center;" aria-required="true" aria-invalid="false" min="1" max="24">
            </div>
            
            <div>
                <details class="detail">
                    <summary class="detailinfo">세부 정보</summary>
                   
                                       
                
                  <!--    <div class="toggle">초기 장치 설정
                        <input type="checkbox" id="demo01"/>
                        <label for="demo01" data-on-label="" data-off-label="">카메라</label>
                        <input type="checkbox" id="demo02"/>
                        <label for="demo02" data-on-label="" data-off-label="">마이크</label>
                        <input type="checkbox" id="demo03"/>
                        <label for="demo03" data-on-label="" data-off-label="">스피커</label>
                    </div>
                  -->  
                </details>
            </div>
            
            <div class="btn-study">
                <button type="submit">스터디 만들기</button>
            </div>
        </form>
    </section>
    
    <script>
        
        $(newstudy).ready(function() {
            $('#test').on('keyup', function() {
                $('#test_cnt').html("("+$(this).val().length+" / 100)");
        
                if($(this).val().length > 100) {
                    $(this).val($(this).val().substring(0, 100));
                    $('#test_cnt').html("(100 / 100)");
                }
            });
        });
    </script>
</body>

</html>