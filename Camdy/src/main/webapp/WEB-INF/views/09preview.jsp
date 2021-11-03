<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>캠디</title>
<link href="${path}/resources/css/theme.css" rel="stylesheet"/>
<link href="${path}/resources/css/preview.css" rel="stylesheet"/>
</head>

<body>
	<header>
    <div class="w-md-100 pt-sm-4 ps-sm-7" style="background-color:#f5f6f7;" >
          <div class="row">
            <div class="col-12 col-sm-12 col-lg-6 mb-1 order-0 order-sm-0"><a class="text-decoration-none" href="intro"><img src="${path}/resources/image/logo.png" height="51"/></a></div>
          </div>
        </div>
 	</header>
	<form>
			<div id="basic">
	            <div class="study-be mt-4 mb-3">
	                    <h5 class="mb-6"><b style="background-color:#b9fbc0;">"
	                    	<c:choose>
	                    		<c:when test="${!empty camdylist}">
									<c:forEach var="vo" items="${camdylist}">
									  ${vo.study_title}
									</c:forEach>
								</c:when>
								<c:otherwise>
									${stvo.study_title}
								</c:otherwise>
						    </c:choose>
							"</b> 스터디 방 입니다.</h5>
	                    
	                    
	                    
	                    
	                    <h6 style="font-size:15px;"><b>🚨이것만은 지켜주세요🚨</b></h6>
	                    <div width="100%" style="padding:10px; background-color:#ced4da; border-radius: 10px; font-size:15px;" >
		                    <c:choose>
						    	<c:when test="${!empty camdylist}">
								    <c:forEach var="vo" items="${camdylist}">
									    ${vo.study_content}
								    </c:forEach>
								</c:when>
								<c:otherwise>
									   ${stvo.study_content}
								</c:otherwise>
							</c:choose>
	                    </div>              
	            </div>
	            <div id="camera">
	                <video autoplay="true" id="videoElement" width="1000px">
	    
	                </video>
	            </div>
	            <h5 class="mb-4 mt-2">📹카메라가 작동하는지 확인해 주세요!</h5>
                    
                <!--  <div class="prectr">
                    <button type="button"><img src="${path}/resources/image/preview/info.png"><br>정보</button>                                      
                    <label class="switch" style="margin-bottom: 50px;">
                    <input type="checkbox">
                    <span class="slider round"></span><br><br><p style="width: 70px;">행동감지</p>
                    </label>
                    <button type="button"><img src="${path}/resources/image/preview/setting.png"><br>설정</button>
                </div>          
	            -->
	          	<div class="mb-8">
	          		<div class="pcard1">
	          			<c:choose>
					    	<c:when test="${!empty camdylist}">
							    <c:forEach var="vo" items="${camdylist}">
							    	<span class="m-3">종료 날짜</span>
								    <b><p class="mt-2" style="font-size:20px; text-align: center;">${vo.study_end_date}</p></b>  
							    </c:forEach>
							</c:when>
							<c:otherwise>
								<span class="m-3">종료 날짜</span>
								<b><p class="mt-2" style="font-size:20px; text-align: center;">${stvo.study_end_date}</p></b>
							</c:otherwise>
						</c:choose>
	          		
	          		</div>
	          		
	          		<div class="pcard2 ms-3">
	          			<c:choose>
					    	<c:when test="${!empty camdylist}">
							    <c:forEach var="vo" items="${camdylist}">
								    <p>참가 인원 : ${vo.study_now}/${vo.study_num}</p>  
							    </c:forEach>
							</c:when>
							<c:otherwise>
									<p>참가 인원 : ${stvo.study_now}/${stvo.study_num}</p>
							</c:otherwise>
						</c:choose>
	          		
	          		</div>
	          		<div class="pcard3 ms-3">
	          			<c:choose>
					    	<c:when test="${!empty camdylist}">
							    <c:forEach var="vo" items="${camdylist}">
								    <p>${vo.study_mhour}시간</p>  
							    </c:forEach>
							</c:when>
							<c:otherwise>
									<p>${stvo.study_mhour}시간</p>
							</c:otherwise>
						</c:choose>
	          		
	          		</div>
	          		<div class="in-btn">
	                	<button type="submit">👋입장</button>
	          		</div>
	          	

		        </div>
		        
		        
	          	</div>
	          	<!-- 끝 -->
        </form> 
        

    
    
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="${path}/resources/js/preview.js"></script>
    
</body>

</html>