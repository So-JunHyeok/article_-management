<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/customer_storage.css">
		 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>	
		  <script src='resources/js/cookie.js'></script>
	<script type="text/javascript">
	
	var test = new Array();
	var index = 0;
	var up_num;
	
	function checked_in(){
		$("input[name=d]:checked").each(function() {
			test[index] = $(this).val();
			index ++;
		});
	};
	
	
	$(function(){
		var v_index;
		var back;
		var col;
	
			$('.td_tr').click(function(){

				$('.td_tr').eq(v_index).css("background", back);
				$('.td_tr').eq(v_index).css("color", col);
			  v_index = $(this).index();
			  
	            var checkbox = $(this).find('td:first-child :checkbox');
	            var checkbox_TF = checkbox.is(":checked");
	       
	           	if(checkbox_TF){
	           		checkbox.prop("checked", false);
	           	}else{
	           		checkbox.prop("checked", true);
	           	}
			  
			  
			  back = $(this).css("background");
			  col = $(this).css("color");
				$(this).css("background-color","#3d1261");
				$(this).css("color","white");
				
			});
		});
	
	
	
	
	
	
	
	
	
	 $(document).ready(function() {
		 setCookie("Name", "");
		 
		 
			$('.view_form').click(function(){
		
				
				up_num =   $(this).attr("data-value");
				ob_p_kind = "ob_view";
		        var url = "resources/test.jsp";
		        var name = "매물보기";
		        var option = "width = 700, height = 900, left = 1000, location = no"
		        var openWin = window.open(url, name, option);	
				
			});
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
			$('.update_form').click(function(){
				up_num = $(this).attr("data-value");

		        var url = "resources/object_update.jsp";
		        var name = "매물등록";
		        var option = "width = 550, height = 700, left = 1000, location = no"
		        var openWin = window.open(url, name, option);	

			});
		 
		 
		 
		 
		 
		 
		 $("input[name=bt]").click(function(){
				
				var C_tel = $('.pa_tel').text();
				var OB_State = $(this).val();
				checked_in()
				
				
				$.ajax({
					type : "GET",	
					url : "update_state",
					traditional : true,
					data : {'test' : test, 'State' : OB_State},
				success : function(data) {
					if(data == "ok"){
						location.href = "customer_interest_view?C_tel="+C_tel;
					}
				}
					});
				
				
				
				
			});
		 
		 
		var a_val = $('.Storage_Num1').attr("data-value");
		var a_max = $('.Storage_Num1').attr("data-value1");
		var i_val = $('.Storage_Num2').attr("data-value");
		var i_max = $('.Storage_Num2').attr("data-value1");
		
		if(a_val == a_max){
			$('.left_img').css("display", "none");
		}
		if(i_val == i_max){
			$('.right_img').css("display", "none");
		}
		
		 
	 });
	 
	 
	 
		function delete_object(){
			var C_tel = $('.pa_tel').text();
			var result = confirm("정말삭제하시겠습니까 ?");
	        
	        if(result)
	        {
	    		checked_in()
	    		
	    		$.ajax({
	    			type : "GET",	
	    			url : "delete_cs",
	    			traditional : true,
	    			data : {'test' : test, 'Tel' : C_tel},
	    		success : function(data) {
	    			if(data == "ok"){
	    				location.href = "customer_interest_view?C_tel="+C_tel;
	    			}
	    		}
	    			});
	        }
	        else
	        {
	            
	        }
					
		}
	 
	 
	 
	 
	
	
	
	
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
	
	

	
	
	
	
	
	
	
	</script>
	
	
	
	
	
	</head> 
	<body>
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px;">
				<jsp:include page="/resources/header.jsp"></jsp:include>
	        
	        </div>
			
			
			<div class="content" style="width: 100%; display: flex;">	
				<div class="Storage_Area">
				<div class="Storage_Title">
					<div class="Customar_Name">
				<div style="display: flex;">
						<img alt="" src="resources/img/nlogo.JPG" style="width: 200px; height: 40px; border-right: 1px solid #d3caca;">
						<div class="custmar_name_h4" style="display: flex;">
							<h4 style="margin-left: 20px;">${customer.c_Name}</h4>&nbsp;<h5 style="margin-top: 15px; color: gray;">고객의 매물입니다.</h5>
						</div>
					<div class="Storage_Num1"><h4 class="pa_tel">${customer.c_Tel}</h4></div>

				</div>	
						
				<div style="display: flex;">		
						<div class="custmar_Gender" style="width: 80px;">
							<h6>성별</h6>
							<p>${customer.c_Gender}</p>

							
						</div>
						<div class="custmar_Age" style="width: 100px;">
							<h6>나이</h6>
							<p>${customer.c_Age}</p>

							
						</div>
						<div class="custmar_Content_t" style="width: 50px;">
							<p>특이<p>
							<p>사항</p>
							
						</div>
						<div class="custmar_Content" style="width: 360px; overflow-y: scroll;">
							<p>${customer.c_Content}<p>
							
						</div>
					</div>	
					</div>	
					
					
					
					
					
					
					<div class="Customar_Name_phone">
				<div style="display: flex; height: 55px;">
						<div class="custmar_name_h4" style="display: flex;">
							<h4>${customer.c_Name}</h4>&nbsp;<h5 style="margin-top: 15px; color: gray;">고객의 매물입니다.</h5>
						</div>
					<div class="Storage_Num2"><h4 class="pa_tel_1">${customer.c_Tel}</h4></div>

				</div>	
						
				<div style="display: flex; border-top:1px solid #d3caca; height: 65px;" >		
						<div class="custmar_Gender" style="width: 80px; border-right:1px solid #d3caca; ">
							<h6>성별</h6>
							<p>${customer.c_Gender}</p>

							
						</div>
						<div class="custmar_Age" style="width: 100px; border-right:1px solid #d3caca;">
							<h6>나이</h6>
							<p>${customer.c_Age}</p>

							
						</div>
						<div class="custmar_Content_t" style="width: 168px; border-right:1px solid #d3caca;">
							<p style="margin-top: 12px;">특이사항<p>

							
						</div>
						<div class="custmar_Content" style="width: 610px; overflow-y: scroll;">
							<p>${customer.c_Content}<p>
							
						</div>
					</div>	
					</div>	
					
					
					
					
					
					
					
						<div class="button_area">
							<div>
							<input type="button" value="방문" name="bt" style="height: 100%;">
							<input type="button" value="보류" name="bt" style="height: 100%;">
							</div>
							<div>
							<input type="button" value="계약" name="bt" style="height: 100%;">
							<input type="button" value="삭제" style="height: 100%;" onclick="delete_object()">
							</div>
						</div>
						
							
					
				
				</div>
				
				<br>
					<table class="ci_table">
					<colgroup>
					
					<col width="15px"/><!-- 체크 -->
					<col width="40px"/><!-- 번호 -->
					<col width="140px"/><!-- 건물명 -->
					<col width="90px"/><!-- 동 -->
					<col width="70px"/><!-- 종류 -->
					<col width="70px"/><!-- 형태 -->
					<col width="230px"/><!-- 주소 -->
					<col width="54px"/><!-- 층수 -->
					<col width="54px"/><!-- 호수 -->
					<col width="54px"/><!-- 면적 -->
					<col width="54px"/><!-- 매매가 -->
					<col width="54px"/><!-- 권리금 -->
					<col width="54px"/><!-- 보증금 -->
					<col width="54px"/><!-- 월세 -->
					<col width="54px"/><!-- 관리비 -->
					<col width="*"/><!-- 메모 -->
					<col width="150"/><!-- 메모 -->
					<col width="25px"/><!-- 체크 -->
					<col width="25px"/><!-- 체크 -->
					</colgroup>
					<thead>
						<tr class="t">
							<th></th>
							<th>번호</th>
							<th>건물명</th>
							<th>동</th>
							<th>종류</th>
							<th>형태</th>
							<th>주소</th>
							<th>층수</th>
							<th>호수</th>
							<th>면적</th>
							<th>매매가</th>		
							<th>권리비</th>
							<th>보증금</th>
							<th>월세</th>
							<th>관리비</th>
							<th>메모</th>
							<th>전화번호</th>
							<th style="font-size: 14px;">수정</th>
							<th style="font-size: 14px;">상세</th>
							
							
						</tr>
						</thead>
						
						<tbody>
						<c:forEach var="Storage_Top" items="${Storage_Top}">
						
						<c:if test="${Storage_Top.OB_State eq '계약'}">
						<tr style="background: #ffff00;" class="td_tr">
						</c:if>
						
						<c:if test="${Storage_Top.OB_State eq '방문'}">
						<tr style="background: #dbeef4;" class="td_tr">
						</c:if>
						
						<c:if test="${Storage_Top.OB_State eq '보류'}">
						<tr style="background: #f3dbdb;" class="td_tr">
						</c:if>
						
						<c:if test="${Storage_Top.OB_State eq '0'}">
						<tr style="background: white;" class="td_tr">
						</c:if>
							
							<td class="con">
							<input type="checkbox" name="d" value="${Storage_Top.OB_Num}"></td>
							<td class="OB_Num">${Storage_Top.OB_Num}</td>
							<td class="OB_Name">${Storage_Top.OB_Name}</td>
							<td class="OB_Dong">${Storage_Top.OB_Dong}</td>
							<td class="kind">
							<p class="OB_Kind">${Storage_Top.OB_Kind}</p>
							<p class="OB_D_Kind">${Storage_Top.OB_D_Kind}</p>
							</td>
							<td class="OB_Form">${Storage_Top.OB_Form}</td>
							<td class="OB_B_Address">${Storage_Top.OB_S_Address}</td>
							<td class="OB_Floor">${Storage_Top.OB_Floor}</td>
							<td class="OB_Ho">${Storage_Top.OB_Ho}</td>
							<td class="OB_Pyeong">${Storage_Top.OB_Pyeong}</td>
							<td class="OB_Month_Cost">${Storage_Top.OB_Month_Cost}</td>
							<td class="OB_Deposit">${Storage_Top.OB_Deposit}</td>
							<td class="OB_Premium">${Storage_Top.OB_Premium_Cost}</td>
							<td class="OB_Maintenance_Cost">${Storage_Top.OB_Maintenance_Cost}</td>
							<td class="OB_Dealing_Cost">${Storage_Top.OB_Dealing_Cost}</td>
							<td class="OB_Content">${Storage_Top.OB_Content }</td>
							<td class="tel">
							<p class="OB_Lessor_Tel">${Storage_Top.OB_Lessor_Tel}</p>
							<p class="OB_Tenant_Tel">${Storage_Top.OB_Tenant_Tel}</p>
							</td>
							<td class="update_form" data-value="${Storage_Top.OB_Num}"><img src="resources/img/p.JPG" style="width: 25px; height: 30px;"></td>
							<td class="view_form" data-value="${Storage_Top.OB_Num}"><img src="resources/img/list.JPG" style="width: 25px; height: 30px;"></td>
							
						
						</tr>
						</c:forEach>
						<tbody>
					</table>	
					
					
					
					
					
				<table class="ci_table_phone">
									<colgroup>
					
					<col width="15px"/><!-- 체크 -->
					<col width="40px"/><!-- 번호 -->
					<col width="140px"/><!-- 건물명 -->
					<col width="90px"/><!-- 동 -->
					<col width="70px"/><!-- 종류 -->
					<col width="70px"/><!-- 형태 -->
					<col width="230px"/><!-- 주소 -->
					<col width="54px"/><!-- 층수 -->
					<col width="54px"/><!-- 호수 -->
					<col width="54px"/><!-- 면적 -->
					<col width="54px"/><!-- 매매가 -->
					<col width="54px"/><!-- 권리금 -->
					<col width="54px"/><!-- 보증금 -->
					<col width="54px"/><!-- 월세 -->
					<col width="54px"/><!-- 관리비 -->
			<%-- 		<col width="*"/><!-- 메모 --> --%>
<%-- 					<col width="150"/><!-- 전화번호 --> --%>
					<col width="25px"/><!-- 체크 -->
					<col width="25px"/><!-- 체크 -->
					</colgroup>
					<thead>
						<tr class="t">
							<th></th>
							<th>번호</th>
							<th>건물명</th>
							<th>동</th>
							<th>종류</th>
							<th>형태</th>
							<th>주소</th>
							<th>층수</th>
							<th>호수</th>
							<th>면적</th>
							<th>매매가</th>		
							<th>권리비</th>
							<th>보증금</th>
							<th>월세</th>
							<th>관리비</th>
							<!-- <th>메모</th> -->
					<!-- 		<th>전화번호</th> -->
							<th style="font-size: 14px;">수정</th>
							<th style="font-size: 14px;">상세</th>
							
							
						</tr>
						</thead>
						
						
						<c:forEach var="Storage_Top" items="${Storage_Top}">
						
						<c:if test="${Storage_Top.OB_State eq '계약'}">
						<tbody style="background: #ffff00;" class="td_tr">
						</c:if>
						
						<c:if test="${Storage_Top.OB_State eq '방문'}">
						<tbody style="background: #dbeef4;" class="td_tr">
						</c:if>
						
						<c:if test="${Storage_Top.OB_State eq '보류'}">
						<tbody style="background: #f3dbdb;" class="td_tr">
						</c:if>
						
						<c:if test="${Storage_Top.OB_State eq '0'}">
						<tbody style="background: white;" class="td_tr">
						</c:if>
						<tr style="height: 5px;"></tr>
						 <tr>
							<td class="con">
							<input type="checkbox" name="d" value="${Storage_Top.OB_Num}"></td>
							<td class="OB_Num">${Storage_Top.OB_Num}</td>
							<td class="OB_Name">${Storage_Top.OB_Name}</td>
							<td class="OB_Dong">${Storage_Top.OB_Dong}</td>
							<td class="kind">
							<p class="OB_Kind">${Storage_Top.OB_Kind}</p>
							<p class="OB_D_Kind">${Storage_Top.OB_D_Kind}</p>
							</td>
							<td class="OB_Form">${Storage_Top.OB_Form}</td>
							<td class="OB_B_Address">${Storage_Top.OB_S_Address}</td>
							<td class="OB_Floor">${Storage_Top.OB_Floor}</td>
							<td class="OB_Ho">${Storage_Top.OB_Ho}</td>
							<td class="OB_Pyeong">${Storage_Top.OB_Pyeong}</td>
							<td class="OB_Month_Cost">${Storage_Top.OB_Month_Cost}</td>
							<td class="OB_Deposit">${Storage_Top.OB_Deposit}</td>
							<td class="OB_Premium">${Storage_Top.OB_Premium_Cost}</td>
							<td class="OB_Maintenance_Cost">${Storage_Top.OB_Maintenance_Cost}</td>
							<td class="OB_Dealing_Cost">${Storage_Top.OB_Dealing_Cost}</td>
							<%-- <td class="OB_Content">${Storage_Top.CS_Content }</td> --%>
<%-- 							<td class="tel">
							<p class="OB_Lessor_Tel">${Storage_Top.CS_Lessor_Tel}</p>
							<p class="OB_Tenant_Tel">${Storage_Top.CS_Tenant_Tel}</p>
							</td> --%>
							<td class="update_form" data-value="${Storage_Top.OB_Num}"><img src="resources/img/p.JPG" style="width: 25px; height: 30px;"></td>
							<td class="view_form" data-value="${Storage_Top.OB_Num}"><img src="resources/img/list.JPG" style="width: 25px; height: 30px;"></td>
						</tr>
						<tr>
							<td colspan="3">특이사항</td>
							<td colspan="8">${Storage_Top.OB_Content}</td>
							<td colspan ="2">전화번호</td>
							<td colspan ="5">
							<p class="OB_Lessor_Tel">주)${Storage_Top.OB_Lessor_Tel}</p>
							<p class="OB_Tenant_Tel">세)${Storage_Top.OB_Tenant_Tel}</p>
							</td>
						</tr>
						<tr style="width: 100%; height: 2px;"><td colspan="17" style="background:#f3f3f3; height: 2px;"></td></tr>
						<tbody>
						</c:forEach>
						
					</table>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				</div>
				
				
			
				
				


			</div>
			

				

				
			</div>
			
			

		</div>
		
	</body>
</html>