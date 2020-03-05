<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/object_list1.css">
	<link rel="stylesheet" href="resources/css/form.css">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src='resources/js/address.js'></script>
		
		
		
	<script type="text/javascript">
	var clo = 0;
	var state = "${state}";
	  $(document).ready(function(){
		  
		  
			$('.bt').click(function(){
				
				  var BL_Num = $(this).attr("data-value");
				  opener.location.href = " building_search?BL_Num="+BL_Num+"&state="+state;
				  clo = 1;
				  if(clo == 1){
					  window.close();
				  }
				  
				});
		  
		  
		  

		  
	  });


	  
	</script>	
		
		
	</head> 
	
	
	

	
	<body>
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px; border-bottom: 1px solid gray; display: flex;">
				<div style="width: 50%">
				<img alt="" src="resources/img/nlogo.JPG" style="width: 230px; height: 70px;">
				</div>
				
	        </div>
			
			
			
			
			
			
			<div class="content" style="width: 100%; height: 92%; background: #f3f3f3" >
				<div style="width: 100%; height: 40px; background: white; display: flex; font-size: 14px;" >
				<p style="padding-top: 10px; padding-left: 10px; font-weight: bold;">검색조건 : </p><p style="padding-top: 10px; padding-left: 5px;">${search_select}</p>
				<p style="padding-top: 10px; padding-left: 150px; font-weight: bold;">검색어 : </p><p style="padding-top: 10px; padding-left: 5px;">${search}</p>
				</div>
				<div style="margin-left: 10px; margin-right: 10px; margin-top: 10px; height: 100%; background: white;">
				<div class="list_area" style=" background:white; height:40px; border-bottom:1px solid #d3caca;">
				<p style="padding-top: 10px; padding-left: 10px;">검색결과</p>
				</div>
				<c:forEach var="bl_list" items="${bl_list}" varStatus="status">
				
				
					
						<div class="list_box" style="width: 100%; border-bottom:1px solid #d3caca; margin-top: 15px;" >
							<div style="display: flex;">
								<div style="width: 70%;">
									<p style="margin-bottom: 5px;"><span style="font-size: 14px; color: #fa4256; letter-spacing: 0; border: 1px solid #d3caca; margin-left: 15px; margin-bottom: 10px;">건물명</span>&nbsp;&nbsp;<span style="font-size: 14px;">${bl_list.BL_Name}</span></p>
									<p style="margin-bottom: 5px;"><span style="font-size: 14px; color: black; letter-spacing: 0; border: 1px solid #d3caca; margin-left: 15px; margin-bottom: 10px;">번지병</span>&nbsp;&nbsp;<span style="font-size: 14px;">${bl_list.BL_B_Address}</span></p>
									<p style="margin-bottom: 5px;"><span style="font-size: 14px; color: #008bd3; letter-spacing: 0; border: 1px solid #d3caca; margin-left: 15px; margin-bottom: 10px;">도로명</span>&nbsp;&nbsp;<span style="font-size: 14px;">${bl_list.BL_S_Address}</span></p>
								</div>
								
								<div style="width: 30%; margin-top: 10px; margin-left: 80px">
									<button class="bt" style="margin-top: 3px; background: white; color: #0c2a3a; padding: 1px; font-weight: bold; height: 30px; width: 70px;" data-value="${bl_list.BL_Num}">선택</button>
								</div>
							</div>
						</div>
					
					

				
				
				</c:forEach>
				
				</div>
				
			</div>
			
			

		</div>
		
	</body>
</html>

