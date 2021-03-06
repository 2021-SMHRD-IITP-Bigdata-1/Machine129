<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>my page</title> 
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="${path}/resources/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="${path}/resources/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${path}/resources/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="${path}/resources/css/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${path}/resources/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="${path}/resources/css/cssCharts.css"> 
</head>

<body>
    <div id="wrapper">
       <!--   <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">                  
                </button>
                
				
		<div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
         </div>

            <ul class="nav navbar-top-links navbar-right"> 
            </ul>
        </nav>-->  
		<!-- Dropdown Structure -->

<ul id="dropdown2" class="dropdown-content w250"> 
</ul>
<ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
</ul>   
<ul id="dropdown4" class="dropdown-content dropdown-tasks w250 taskList">
  <li>
  </li>                                        
</ul>    
        <!-- /. NAV SIDE  -->    
		
		  <div class="header"> 
			<h1 class="page-header"> ${user_nickname}?????? ???????????????
			<button class="exitbtn" type="button" onclick="location.href='/camdy'">?????????</button>
			
			</h1>
			
             
                        					  									
		  </div>
		  
            <div id="page-inner">

			<div class="dashboard-cards"> 
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
						<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image red">
						<i class="material-icons dp48">timelapse</i>
						</div>
						<div class="card-stacked red">
						<div class="card-content">
						<h4>????????? ?????? ?????? ??????</h4> 
						</div>
						<div class="card-action">
						<strong>${wavghour}?????? ${wavgminute}???</strong>
						</div>
						</div>
						</div>
	 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
						<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image orange">
						<i class="material-icons dp48">timer</i>
						</div>
						<div class="card-stacked orange">
						<div class="card-content">
						<h4>????????? ?????? ??????</h4> 
						</div>
						<div class="card-action">
						<strong>${wthour}?????? ${wtminute}??? ${wtseconds}???</strong>
						</div>
						</div>
						</div> 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
							<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image blue">
						<i class="material-icons dp48">import_contacts</i>
						</div>
						<div class="card-stacked blue">
						<div class="card-content">
						<h4>????????? ??? ?????? ??????</h4> 
						</div>
						<div class="card-action">
						<strong>${wpuhour}?????? ${wpuminute}??? ${wpuseconds}???</strong>
						</div>
						</div>
						</div> 
						 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">					
					<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image green">
						<i class="material-icons dp48">sentiment_very_satisfied</i>
						</div>
						<div class="card-stacked green">
						<div class="card-content">
						<h4>????????? ?????? ????????? ??????</h4> 
						</div>
						<div class="card-action">
						<strong>${allhour}??????</strong>
						</div>
						</div>
						</div> 						 
                    </div>
                </div>
			   </div>
				<!-- /. ROW  --> 
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-7"> 
					<div class="cirStats">
						  	<div class="row">
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>?????? ??? ????????? ?????? ??????</h4>
											<div class="easypiechart" id="easypiechart-blue" data-percent="${weekppercent}" ><span class="percent">${weekppercent}%</span>
											</div> 
										</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>?????? ??? ?????? ?????? ??????</h4>
											<div class="easypiechart" id="easypiechart-red" data-percent="${weekoutpercent}" ><span class="percent">${weekoutpercent}%</span>
											</div>
										</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>??? ????????? ?????? ??????</h4>
											<div class="easypiechart" id="easypiechart-teal" data-percent="${allpercent}" ><span class="percent">${allpercent}%</span>
											</div> 
										</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>?????? ??? ????????? ?????? ??????</h4>
											<div class="easypiechart" id="easypiechart-orange" data-percent="${weekphpercent}" ><span class="percent">${weekphpercent}%</span>
											</div>
										</div>
								</div>  
							</div>
						</div>							
						</div><!--/.row-->
						<div class="col-xs-12 col-sm-12 col-md-5" style="font-family: 'S-CoreDream-6Bold';"> 
						     <div class="row">
									<div class="col-xs-12"> 
									<div class="card">
										<div class="card-image donutpad">
										  <div id="morris-donut-chart"></div>
										</div> 
										<div  align="center" class="card-action">
										  <b></b>
										</div>
									</div>	
								</div>
							 </div>
						</div><!--/.row-->
				</div>						 
				<div class="row">
				<div class="col-md-5"> 
						<div class="card">
						<div class="card-image">	
							<div class = "chart-container">
								<canvas id = "line-chart1"></canvas>
							</div>	
						<div align="center" class="card-action">
								<b> ?????? ??? ??? ?????? ?????? </b>
						</div>						 
						</div> 						
						</div>		  
					</div>							
					<div class="col-md-7"> 
					<div class="card">
					<div class="card-image">
					  <div id="morris-bar-chart"></div>
					</div> 
					<div align="center" class="card-action">
					  <b> ?????? ??? ?????? ?????? </b>
					</div>
					</div>					
					</div>					
				</div> 			 								
                <div class="row" style="font-family: 'S-CoreDream-6Bold';">
                    <div class="col-xs-12">
						<div class="card">
					<div class="card-image"> 
					</div> 					
					</div>	 
                    </div> 
                </div>
				<div class="row">
				<div class="col-md-12">				
					</div>		
				</div> 	
                <!-- /. ROW  -->				
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12">						
					</div>				
				</div>	  				                
            </div>
                <!-- /. ROW  -->
			   <div class="fixed-action-btn horizontal click-to-toggle">
  			 </div>		
   
				
            </div>
            <!-- /. PAGE INNER  -->
        
        <!-- /. PAGE WRAPPER  -->
        
    <input type="hidden" id="allpercent" name="allpercent" value="${allpercent}">
    <input type="hidden" id="allphpercent" name="allphpercent" value="${allphpercent}">
    <input type="hidden" id="alloutpercent" name="alloutpercent" value="${alloutpercent}">
    
    <input type="hidden" id="mon" name="mon" value="${mon}">
    <input type="hidden" id="tue" name="tue" value="${tue}">
    
    
    </div>
    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.min.js"></script>
    <!-- jQuery Js -->
    <script src="${path}/resources/js/mypagejs/jquery-1.10.2.js"></script>
	
	<!-- Bootstrap Js -->
    <script src="${path}/resources/js/mypagejs/bootstrap.min.js"></script>
	
	<script src="${path}/resources/js/mypagejs/materialize.min.js"></script>
	
    <!-- Metis Menu Js -->
    <script src="${path}/resources/js/mypagejs/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="${path}/resources/js/mypagejs/raphael-2.1.0.min.js"></script>
    <script src="${path}/resources/js/mypagejs/morris.js"></script>
	
	
	<script src="${path}/resources/js/mypagejs/easypiechart.js"></script>
	<script src="${path}/resources/js/mypagejs/easypiechart-data.js"></script>
	
	 <script src="${path}/resources/js/mypagejs/Lightweight-Chart/jquery.chart.js"></script>
	
    <!-- Custom Js -->
    <script src="${path}/resources/js/mypagejs/custom-scripts.js"></script> 
	
	<!-- chartsJs.js-->

	
</body>

</html>