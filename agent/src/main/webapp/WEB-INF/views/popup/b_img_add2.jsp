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
		
		
	</head> 
	
	
	
	<script type="text/javascript">
	var type_num = 1;
	function add_img(){

		  type_num++;
		  var arr = type_num -1;
			
			var Type = '<span>Type'+type_num+'</span>'
				+'&nbsp;<input name="BL_Type" placeholder="No_Type" width="80px;">&nbsp;'
				+'<span>이미지 업로드</span>&nbsp;'
				+'<input multiple="multiple" name="file_LIst['+arr+'].files" type="file" value="파일 찾기" style="width:200px;">'
				+'<br>'
				+'<hr>';
			
			$(".Type").prepend(Type);	
		}
	
	</script>
	
	<body>
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px; border-bottom: 1px solid gray; display: flex;">
				<div style="width: 50%">
				<img alt="" src="resources/img/nlogo.JPG" style="width: 230px; height: 70px;">
				</div>
				<div style="width: 50%">
				<button type="button" onclick="add_img()" style="margin-bottom: 5px; margin-top: 25px; margin-left: 180px;">이미지 추가</button>
				</div>
			
				
	        </div>
			
			
			
			
			
			
			<div class="content" style="width: 100%; height: 92%; display: flex;">
				
				
				<form action="building_add_img"  method="post" enctype="multipart/form-data">
				<div class="object_list_content">
					<input type="hidden" name="BL_Num" value="${BL_Num}">
	 				<div class="Type" style="margin-top: 5px;">
						<span>Type0</span>&nbsp;<input name="BL_Type" placeholder="No_Type" width="100px;">
				        <span>이미지 업로드</span>
				        <input multiple="multiple" name="file_LIst[0].files" type="file" value="파일 찾기" style="width:200px;">	
				        <br>
				        <hr>
	 				</div>
	 				
					<input type="submit" value="업로드">
				</div>
				</form>
				
			</div>
			
			

		</div>
		
	</body>
</html>

