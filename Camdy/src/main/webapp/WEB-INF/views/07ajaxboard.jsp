<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>캠디 - 화상채팅으로 공부하세요</title>
  <meta charset="utf-8">
  <title>Insert title here</title>
<link href="${path}/resources/css/theme.css" rel="stylesheet"/>

<!-- Swiper API -->
<link  href="${path}/resources/css/swiper-bundle.css" rel="stylesheet">
<link  href="${path}/resources/css/swiper-bundle.min.css" rel="stylesheet">

  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
 $(document).ready(()=>{ // jquery문법의 시작
  		loadJson();
  		$("#btn").click(writeFn);
  	});
  	
  	function writeFn(){
  		console.log('등록등록');
  		var frmData=$("#frm").serialize(); // serialize() : 폼 요소 집합을 인코딩
  		$.ajax({
  			url : "${path}/camdyboardInsert",
  			method : "post",
  			data : frmData,
  			// dataType은 데이터를 받을때 필요! 지금은 데이터를 보내기만 하니까 안 적어주는 것
  			success : loadJson,
  			error : function(){alert("등록 실패!");}
  		});
  	}
  	
  	function loadJson(){
  		console.log('통신통신');
  		// 서버와 통신하는 방법(/boardListJson.do를 요청하는 것!)
  		$.ajax({
  			url : "${path}/camdyboardListJson",
  			method : "get",
  		//  data : {"test":"12345":"key":111},
  			dataType : "json", // 생략을 하면 보통 text타입일 확률↑
  			success : resultHtml, // 콜백함수
  			error : function(){alert("서버 통신 실패!");}	
  		});
  	}
  	
  	function resultHtml(data){
  		console.log(data);
  		var view = "<table class='table'>";
  		view+="<tr>";
  		view+="<td>번호</td>";
  		view+="<td>제목</td>";
  		view+="<td>카테고리</td>";
  		view+="<td>작성자</td>";
  		view+="<td>작성일</td>";
  		view+="<td>수정</td>";
  		view+="<td>삭제</td>";
  		view+="</tr>";
  		$.each(data, function(index, obj){
  			view+="<tr>";
  	  		view+="<td id='post_seq"+index+"'>"+obj.post_seq+"</td>";
  	  		view+="<td id='t"+index+"'><a href='javascript:goView("+index+")'>"+obj.post_title+"</a></td>";
  	  		view+="<td id='post_type"+index+"'>"+obj.post_type+"</td>";
  	  		view+="<td id='w"+index+"'>"+obj.user_id+"</td>";
  	  		view+="<td>"+obj.post_date+"</td>";
  	  		view+="<td id='u"+index+"'><button class='btn btn-info btn-sm' onclick='goUpdate("+index+")'>수정</button></td>"
  	  		view+="<td id='e"+index+"'><button class='btn btn-danger btn-sm' onclick='goDel("+obj.post_seq+")'>삭제</button></td>"
  	  		view+="</tr>";
  	  		
  	  		view+="<tr>";  
  	  		view+="<td colspan='7'>";
  	  		view+="<div id='div"+index+"' style='display:none'>";
  			view+="<textarea id='c"+index+"' rows='5' class='form-control'>"+obj.post_content+"</textarea>";
  	  		view+="<button class='btn btn-success btn-sm' onclick='goContent("+index+")'>내용수정</button>";
  	  		view+="</div>";
  	  		view+="</td>";
  	  		view+="</tr>";
  	  		
  		});
  		view+="</table>";
  		$("#json").html(view);  
  		$("#view").css("display","none");
  		$("#json").css("display","block"); 
  	}
  	
  	function goContent(index){
  		var post_seq = $("#post_seq"+index).text()
  		var post_content = $("#c"+index).val()
  		$.ajax({
  			url : "${path}/ajaxContents",
  			type : "post", //contents는 한글이 포함되어 있음!
  						// 한글이 있으면 post으로 받을 수 있지만
  						// get으로 넘어오면 인코딩이 힘들어서 post로 하는 것!
  			data : {"post_seq":post_seq, "post_content":post_content},
  			success : loadJson,
  			error : function(){alert("error");}	
  			
  		});
  		
  	}
  	
  	function goView(index){
  		if($("#div"+index).css("display")=="none"){
  			$("#div"+index).slideDown();
  		}else{
  			$("#div"+index).slideUp();
  		}
  		
  	}
  	
  	function goUpdate(index){
  		console.log("수정화면 열기");
  		var title = $("#t"+index).text();
  		var newTitle = "<input id='post_title"+index+"' type='text' class='form-control' value='"+title+"'>";
  		$("#t"+index).html(newTitle);
  		
  		var writer = $("#w"+index).text();
  		var newWriter = "<input id='user_id"+index+"' type='text' class='form-control' value='"+writer+"'>";
  		$("#w"+index).html(newWriter);
  		
  		var newButton = "<button class='btn btn-info btn-sm' onclick='goUpdate1("+index+")'>수정하기</button>";
  		$("#u"+index).html(newButton);
  		
  		var newcancelButton  = "<button class='btn btn-warning btn-sm' onclick='loadJson()'>취소</button>";
  		$("#e"+index).html(newcancelButton);
  	}
  	
  	function goUpdate1(index){
  		console.log("수정기능")
  		var post_seq = $("#post_seq"+index).text();
  		var post_title = $("#post_title"+index).val();
  		var user_id = $("#user_id"+index).val();
  		$.ajax({
  			url : "${path}/ajaxUpdate",
  			type : "post",
  			data : {"post_seq":post_seq, "post_title":post_title, "user_id":user_id},
  			success : loadJson,
  			error : function(){alert("error");}	
  			
  			
  		});
  		
  	}
  	
  	function goDel(post_seq){
  		console.log("삭제삭제");
  		$.ajax({
  			url : "${path}/ajaxDelete",
  			type : "get",
  			data : {"post_seq":post_seq},
  			success : loadJson,
  			error : function(){alert("error");}	
  		});
  		
  		
  	}
  	
  	function goWrite(){
  		if($("#json").css("display")=="none"){
  			$("#json").slideDown();
  		}else{
  			$("#json").slideUp();
  		}
  		//$("#json").css("display","none");
  		//$("#json").hide();
  		//$("#json").slideUp();
  		$("#view").css("display","block");
  		$("#rebtn").trigger("click"); // 최소버튼 강제로 클릭!
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
        <div class="container"><a class="navbar-brand" href="intro"><img src="${path}/resources/image/logo.png" height="52" alt="로고" /></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base">
              <li class="nav-item px-2 font-2"><a class="nav-link active" aria-current="page" href="intro" >홈</a></li>
              <li class="nav-item px-2 font-2"><a class="nav-link" aria-current="page" href="ajaxboard1" >커뮤니티</a></li>
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
      
      
<div class="container mt-7 mb-7">
  <h2>Camdy 커뮤니티</h2>
  <br>
  <div class="panel panel-default">
  
    <div class="panel-heading">
    	
    </div>
    
    <div class="panel-body">
    	<div id="json" style="display : block"></div>
    	<div id="view" style="display : none">
    		<form id="frm" class="form-horizontal" action="${path}/camdyboardInsert" method="post">
		    
			    
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
			        <input type="text" class="form-control" name = "post_title" placeholder="제목을 입력해주세요">
			      </div>
			    </div>
			   <br>
			    <div class="form-group">
			      <label class="control-label col-sm-2">내용:</label>
			      <div class="col-sm-10">          
			      	<textarea class="form-control" rows="5" placeholder="내용을 입력해주세요" name="post_content"></textarea>
			      </div>
			    </div>
			    <br>
			    <div class="form-group">
			      <label class="control-label col-sm-2">작성자:</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" name = "user_id">
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
			        <button type="button" class="btn btn-primary btn-sm" id="btn">등록</button>
			        <button type="reset" class="btn btn-warning btn-sm" id="rebtn">취소</button>
			      </div>
			    </div>
			    <br>
		    
			</form>
    	</div>
    </div>   
     	
    <div class="panel-footer">
    <button class="btn btn-primary btn-sm" onclick="goWrite()">글쓰기</button>
    </div>
    <br>
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
