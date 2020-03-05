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

		
	
	</script>	
	
	
	</head> 
	<body>
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px;">
				<img alt="" src="resources/img/nlogo.JPG" style="width: 230px; height: 70px;">
	        
	        </div>
			
			
			
			
			
			
			<div class="content" style="width: 100%; height: 92%; display: flex;">
				
				
				<form action="ob_img_add"  method="post" enctype="multipart/form-data">
				<div class="object_list_content">
				<input type="hidden" name="ob_num" value="${ob_num}">
				<p>이미지 업로드</p>
				<input multiple="multiple" name="files" type="file" value="파일 찾기" style="width:200px;"> 
				<input type="submit" value="업로드">
				</div>
				</form>
				
			</div>
			
			

		</div>
		
	</body>
</html>

