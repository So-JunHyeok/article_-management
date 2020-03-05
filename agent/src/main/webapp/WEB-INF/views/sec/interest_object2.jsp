<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/interest.css">
		 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>	
	<script type="text/javascript">
	
		var Title ="";
	
	
	 $(document).ready(function() {
		 setCookie("Name", "");
		var a_val = $('.Storage_Num1').attr("data-value");
		var a_max = $('.Storage_Num1').attr("data-value1");
		
		var i_val = $('.Storage_Num2').attr("data-value");
		var i_min = $('.Storage_Num2').attr("data-value1");
		
		if(a_val == a_max){
			$('.left_img').css("display", "none");
		}
		if(i_val <= i_min){
			$('.right_img').css("display", "none");
		}
		
		if(a_val == 0){
		$('.customar_bt1').css("display", "none");	
		}
		if(i_val == 0){
		$('.customar_bt2').css("display", "none");	
		}
		 
	 });
	
	
	
	
	
	function right_move(){
		var j = 0;
		j = $('.Storage_Num2').attr("data-value");
		if(j != 0){
		location.href = "storage?Move=Next&Last_Title_Num="+j;	
		}
		else {
			alret("스토리지가 없습니다.");
		}
		
	}
	function left_move(){
		var j = 0;
		j = $('.Storage_Num1').attr("data-value");
		if(j != 0){
		location.href = "storage?Move=Prev&Last_Title_Num="+j;	
		}
		else {
			alret("스토리지가 없습니다.");
		}
		
	}
	
	
	
	
	function cu_matc(){
		var Title = $('.cu').val();
        var tel = prompt("전화번호를력하세요 ?", "010-0000-0000");
        
        document.location.href ="customer_interest?tel="+tel+"&title="+Title;
        
        
		
		
		
	}
	
	function new_matc(){
		Title = $('.cu').val();
		var url = "resources/new_customer.jsp";
        var name = "new_customer";
        var option = "width = 300, height = 330, top = 100, left = 200, location = no"
        window.open(url, name, option);
	}
	
	
	</script>
	
	
	
	
	
	</head> 
	<body>
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px;">
				<jsp:include page="/resources/header.jsp"></jsp:include>
	        
	        </div>
			
			
			<div class="content" style="width: 100%; height: 83%; display: flex;">
				
			<div class="left">
				<div class="left_img" style="width: 100%; height: 100px;" onclick="left_move()">
				<img alt="" src="resources/img/left.png" style="width: 100%; height: 100px; margin-top: 288px;">
				</div>
			</div>	
			
			<div class="mid">
			
				<div class="Storage_Area">
				<div class="Storage_Title">
					<div class="Storage_Num1" data-value = "${title_Num1}" data-value1 ="${STL_Max}"><h4>- 스토리지${title_Num1} -</h4></div>
					<div class="Customar_Name" style="display: flex;">
						<div class="custmar_name_h4">
							<h4>관심매물입니다.</h4>
						</div>
						
						<div class="customar_bt1">
							<button onclick="new_matc()">신규매칭</button>
							<button class="cu" onclick="cu_matc()" value="${title_Num1}">고객매칭</button>
							<a href="add_storage?S_Title=${title_Num1}"><button>매물추가</button></a>
							<a href="delete_storage?S_Title=${title_Num1}"><button>전체삭제</button></a>
						</div>
							
					</div>
				
				</div>
				<br>
					<table style="width: 100%; border-spacing: 0 0 0 5px;">
					<colgroup>
					
					<col width="42px"/><!-- 체크 -->
					<col width="146px"/><!-- 체크 -->
					<col width="255px"/><!-- 체크 -->
					<col width="42px"/><!-- 체크 -->
					<col width="42px"/><!-- 체크 -->
					<col width="42px"/><!-- 체크 -->
					<col width="42px"/><!-- 체크 -->
					<col width="54px"/><!-- 체크 -->
					<col width="54px"/><!-- 체크 -->
					<col width="54px"/><!-- 체크 -->
					<col width="54px"/><!-- 체크 -->
					<col width="25px"/><!-- 체크 -->
					</colgroup>
						<tr>
							<th>번호</th>
							<th>건물명/형태</th>
							<th>기본정보</th>
							<th>층수</th>
							<th>호수</th>
							<th>면적</th>
							<th>월세</th>
							<th>보증</th>
							<th>권리</th>
							<th>관리</th>
							<th>매매</th>
							<th></th>
							
							
						</tr>
						<c:forEach var="Storage_Top" items="${ST_List_Top}">
						<c:if test="${Storage_Top.s_State eq '계약'}">
						<tr style="background: #ffff00;">
						</c:if>
						<c:if test="${Storage_Top.s_State eq '방문'}">
						<tr style="background: #dbeef4;">
						</c:if>
						<c:if test="${Storage_Top.s_State eq '보류'}">
						<tr style="background: #f3dbdb;">
						</c:if>
						<c:if test="${Storage_Top.s_State eq '0'}">
						<tr style="background: white;">
						</c:if>
						<td>${Storage_Top.OB_Num}</td>
							<td>
							<p style="border-bottom: 1px solid #d3caca;">${Storage_Top.s_Name}</p>
							
							<span>${Storage_Top.s_Kind}</span>/<span>${Storage_Top.s_Form}</span>
							</td>
							
							<td>
							<p>주소 : ${Storage_Top.s_S_Address}</p>
						
							</td>
							<td>${Storage_Top.s_Floor}</td>
							<td>${Storage_Top.s_Ho}</td>
							<td>${Storage_Top.s_Pyeong}</td>
							<td>${Storage_Top.s_Month_Cost}</td>
							<td>${Storage_Top.s_Deposit}</td>
							<td>${Storage_Top.s_Premium_Cost}</td>
							<td>${Storage_Top.s_Maintenance_Cost}</td>
							<td>${Storage_Top.s_Dealing_Cost}</td>
							<td><a href="delete_storage?del_num=${Storage_Top.OB_Num}&S_Title=${title_Num1}"><img src="resources/img/r.JPG" style="width: 25px; height: 30px;"></a></td>
						
						
						</tr>
						</c:forEach>
					
					</table>	
				</div>
				
				
				<div class="Storage_Area">
				<div class="Storage_Title">
					<div class="Storage_Num2" data-value = "${title_Num2}" data-value1 ="${STL_Min}"><h4>- 스토리지${title_Num2} -</h4></div>
					<div class="Customar_Name" style="display: flex;">
						<div class="custmar_name_h4">
							<h4>관심매물입니다.</h4>
						</div>
						
						<div class="customar_bt2">
							<button onclick="new_matc()">신규매칭</button>
							<button onclick="cu_matc()" data-value="${title_Num1}">고객매칭</button>
							<a href="add_storage?S_Title=${title_Num2}"><button>매물추가</button></a>
							<a href="delete_storage?S_Title=${title_Num2}"><button>전체삭제</button></a>
						</div>
							
					</div>
				
				</div>
				<br>
					<table style="width: 100%; border-spacing: 0 0 0 5px;">
					<colgroup>
					
					<col width="42px"/><!-- 체크 -->
					<col width="146px"/><!-- 체크 -->
					<col width="255px"/><!-- 체크 -->
					<col width="42px"/><!-- 체크 -->
					<col width="42px"/><!-- 체크 -->
					<col width="42px"/><!-- 체크 -->
					<col width="42px"/><!-- 체크 -->
					<col width="54px"/><!-- 체크 -->
					<col width="54px"/><!-- 체크 -->
					<col width="54px"/><!-- 체크 -->
					<col width="54px"/><!-- 체크 -->
					<col width="25px"/><!-- 체크 -->
					</colgroup>
						<tr>
							<th>번호</th>
							<th>건물명/형태</th>
							<th>기본정보</th>
							<th>층수</th>
							<th>호수</th>
							<th>면적</th>
							<th>월세</th>
							<th>보증</th>
							<th>권리</th>
							<th>관리</th>
							<th>매매</th>
							<th></th>
							
							
						</tr>
						<c:forEach var="Storage_Mid" items="${ST_List_Mid}">
						<c:if test="${Storage_Mid.s_State eq '계약'}">
						<tr style="background: #ffff00;">
						</c:if>
						<c:if test="${Storage_Mid.s_State eq '방문'}">
						<tr style="background: #dbeef4;">
						</c:if>
						<c:if test="${Storage_Mid.s_State eq '보류'}">
						<tr style="background: #f3dbdb;">
						</c:if>
						<c:if test="${Storage_Mid.s_State eq '0'}">
						<tr style="background: white;">
						</c:if>
							<td>${Storage_Mid.OB_Num}</td>
							<td>
							<p style="border-bottom: 1px solid gray;">${Storage_Mid.s_Name}</p>
							
							<span>${Storage_Mid.s_Kind}</span>/<span>${Storage_Mid.s_Form}</span>
							</td>
							
							<td>
							<p>주소 : ${Storage_Mid.s_S_Address}</p>
						
							</td>
							<td>${Storage_Mid.s_Floor}</td>
							<td>${Storage_Mid.s_Ho}</td>
							<td>${Storage_Mid.s_Pyeong}</td>
							<td>${Storage_Mid.s_Month_Cost}</td>
							<td>${Storage_Mid.s_Deposit}</td>
							<td>${Storage_Mid.s_Premium_Cost}</td>
							<td>${Storage_Mid.s_Maintenance_Cost}</td>
							<td>${Storage_Mid.s_Dealing_Cost}</td>
							<td><a href="delete_storage?del_num=${Storage_Top.OB_Num}&S_Title=${title_Num2}"><img src="resources/img/r.JPG" style="width: 25px; height: 30px;"></a></td>
						
						
						</tr>
						</c:forEach>
					
					</table>	
				</div>
				
				


			</div>
			
			<div class="right">
			<div class="right_img" style="width: 100%; height: 100px;" onclick="right_move()">
			<img alt="" src="resources/img/Right.png" style="width: 100%; height: 100px; margin-top: 288px;">
			</div>
			</div>
				

				
			</div>
			
			

		</div>
		
	</body>
</html>