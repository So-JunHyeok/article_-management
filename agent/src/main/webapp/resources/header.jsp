<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/index.css">
	  <script src='resources/js/jquery-3.4.1.min.js'></script>
	<script type="text/javascript">
	
	 var onf
	 
	 $(document).ready(function (){
		 $(".phone_manuarea").hide(); 
	 });
	 
	 
	function fullmenu(){
		 onf = $('.phone_manuarea').attr('data-value');
		if(onf == "off"){
		$(".phone_manuarea").show();
		$('.phone_manuarea').attr('data-value', 'on');	
		}
		else{
			$(".phone_manuarea").hide();
			$('.phone_manuarea').attr('data-value', 'off');
		}
		
		
	}
	

	function cookie_sett(){
		document.cookie = "";
		location.href = "list";
				
		
	}

	
	</script>
	
	</head> 
	<body>
		

		
		<!-- 프로그램 상단 구성(메뉴바) -->
				
				<div class="manubar">

					<div class="logoarea">
						<img alt="" src="resources/img/nlogo.JPG">
					</div>
					
					<div class="manuarea">
						<span><a href="schedule">일정관리</a></span>
						<span><a href="list" onclick="cookie sett()">매물관리</a></span>
						<span><a href="building_nhn">건물관리</a></span>
						<span><a href="customer">고객관리</a></span>
						<span><a href="storage">관심목록</a></span>
					</div>
					
					<div class="subarea1">
						
					</div>
					
					<div class="subarea2">
						<a href="logout"><img class="logout_img" src="resources/img/logout.JPG">
						<p>logout</p>
						</a>
					</div>
					
				</div>
				
				
				
				
				
				
				
				

			
	
			
			
			
			
			

		
	</body>
</html>