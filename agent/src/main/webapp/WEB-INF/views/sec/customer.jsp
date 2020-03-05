<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/customar.css">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	 <script src='resources/js/cookie.js'></script>	
			
			<script type="text/javascript">
			var	C_Tel = "";
			var	C_Tel_w = "";
			var	C_Tel_p = "";
			
			
				function customer_page(){
					C_Tel_w = $('.C_Tel').val();
					C_Tel_p = $('.C_Tel_p').val();
					C_Tel = C_Tel_w + C_Tel_p;
			
					var regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
						if(C_Tel == ""){
							alert("전화번호는 필수입력입니다.");
							return false;
						}
						else{
							 if(!regPhone.test(C_Tel)){
							  alert('잘못된 휴대폰 번호입니다.');
							  return false;
							 }
							 else{
								 alert("올바른 휴대폰 번호");
								 return true;
							 }
						}
												
					}
				
				$(document).ready(function(){
					setCookie("Name", "");
					var value;
				$('.update_customer').click(function(){
					var index = $(this).parents(".con").index();
		
					var num = $('.con').eq(index).children('td').eq(0).text();
					var name = $('.con').eq(index).children('td').eq(1).text();
					var gen = $('.con').eq(index).children('td').eq(2).text();
					var age = $('.con').eq(index).children('td').eq(3).text();
					var tel = $('.con').eq(index).children('td').eq(4).text();
					var con = $('.con').eq(index).children('td').eq(5).text();
			
					$('input[name=C_Name]').val(name);
					$('input[name=C_Gender]').val(gen);
					$('input[name=C_Age]').val(age);
					$('input[name=C_Tel]').val(tel);
					$('textarea[name=C_Content]').text(con);
					$('#bt').val("수정");
			
						

						
					
					
					
					
					
						
					});
				
				});
				
				function form_data(){
					customer_page()
					value = $('#bt').val();
				
					var queryString = $("form[name=customer]").serialize();
			
					
					
					
					if(value == "등록"){
			    		$.ajax({
			    			type : "GET",	
			    			url : "Insert_customer",
			    			data : queryString,
			    		success : function(data) {
			    			if(data == "ok"){
			    				location.href = "customer";
			    			}
			    		}
			    			});	
					}
					else{
			    		$.ajax({
			    			type : "GET",	
			    			url : "update_customer",
			    			data : queryString,
			    		success : function(data) {
			    			if(data == "ok"){
			    				location.href = "customer";
			    			}
			    		}
			    			});	
					}

				}
				function form_data_p(){
					customer_page()
					value = $('#bt').val();
				
					var queryString = $("form[name=customer_p]").serialize();
			
					
					
					
					if(value == "등록"){
			    		$.ajax({
			    			type : "GET",	
			    			url : "Insert_customer",
			    			data : queryString,
			    		success : function(data) {
			    			if(data == "ok"){
			    				location.href = "customer";
			    			}
			    		}
			    			});	
					}
					else{
			    		$.ajax({
			    			type : "GET",	
			    			url : "update_customer",
			    			data : queryString,
			    		success : function(data) {
			    			if(data == "ok"){
			    				location.href = "customer";
			    			}
			    		}
			    			});	
					}

				}
				
				
				function select_form(){
				var form = $(".select_Form option:selected").val();
				
					location.href ="select_form?Form="+form;
				}
				
			</script>
	
	</head> 
	<body>
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px;">
				<jsp:include page="/resources/header.jsp"></jsp:include>
	        
	        </div>
			
			
			
			
			
			
			<div class="content" style="width: 100%; height: 92%; display: flex;">
				

				
				<div class="object_list_content">
					<div class="customar_search_area" style="display: flex;">
						<div class="search_input">
						<div class="search_area">
						<form action="search_customer" style="display: flex;">
							<div class="select1">
							<select name="search_option">
								<option value="tel">전화번호</option>
								<option value="name">이름</option>
							</select>
							</div>
							<div class="input1">
							<div class="s" style="display: flex;">
							<input type="search" name="search">
							<button type="submit"><img alt="" src="resources/img/nnnn.png"></button>
							</div>
							</div>
							</form>
							</div>
							<div class="select_area">
							<p style="margin-top: 10px;">추후연락</p>&nbsp;&nbsp;
									<select class="select_Form">
										<option value="전체">전체</option>
										<option value="없음">없음</option>
										<option value="전세">전세</option>
										<option value="월세">월세</option>
										<option value="매매">매매</option>
										<option value="기타">기타</option>
									</select>&nbsp;
							<button onclick="select_form()">찾기</button>		
							</div>
							
						</div>
						
						<div class="insert_form_phone">
						<form action="#" name="customer_p">	
					<div style="display: flex;">	
						<div>
						<p>이름</p>
						<input type="text" name="C_Name" style="width: 100px;" value="">
						</div>&nbsp;&nbsp;
						
						<div>
						<p>성별</p><select name="C_Gender">
						<option>남자</option><option>여자</option></select>
						</div>&nbsp;&nbsp;
				
				
						<div>
						<p>전화번호</p>
						<input class="C_Tel_p" type="tel" name="C_Tel" style="width: 150px;" value="">
						</div>&nbsp;&nbsp;
						
						
						<div>
						<p>형태</p>
									<select name="C_Form">
										<option value="없음">없음</option>
										<option value="전세">전세</option>
										<option value="월세">월세</option>
										<option value="매매">매매</option>
										<option value="기타">기타</option>
									</select>
						</div>
					</div>	
					<div style="display: flex;">	
						<div>
						<p>특이사항</p>
						<textarea rows="2" cols="50" name="C_Content"></textarea>
						</div>&nbsp;&nbsp;
						
						<div class="in_but">
						<input type="submit" value="등록" id="bt" onclick="form_data_p();" style="background: white;color: #0c2a3a;font-weight: bold;width: 65px;height: 35px;font-size: 17px;margin-top: 15px;">
						</div>
						
					</div>	
					</form>
				</div>
						
						
						
					</div>
					
					<div class="customar_content">
						
							
							<div class="insert_form" >
							<form action="#" name="customer">
								<h3 style="text-align: center; margin-right: 15px;">고객 등록</h3><br>
							
								<p>이름(닉네임)</p><input type="text" name="C_Name" style="width: 150px;" value=""><br><br>
								<div style="display: flex;">
								<div>
								<p>성별</p><select name="C_Gender"><option>남자</option><option>여자</option></select><br><br>
								</div>
								<div style="margin-left: 10px;">
								<p>나이</p><input type="number" name="C_Age" style="width: 70px;" value=""><br><br>
								</div>
								</div>
								<div style="display: flex;">
									<div>
									<p>전화번호</p><input class="C_Tel" type="tel" name="C_Tel" style="width: 100px;" value="">
									</div>
									<div>
									<p>형태</p>
									<select name="C_Form">
										<option value="없음">없음</option>
										<option value="전세">전세</option>
										<option value="월세">월세</option>
										<option value="매매">매매</option>
										<option value="기타">기타</option>
									</select>
									</div>
								</div>
								<p>특이사항</p><textarea rows="13" cols="19" name="C_Content"></textarea>
								
								<div class="in_but">
									<input type="submit" value="등록" id="bt" onclick="form_data();">
								</div>
							</form>
							</div>
							
						
						<div class="cc_left">
							<table>
								<colgroup>
								<col width="50px"/><!-- 체크 -->
								<col width="100px"/><!-- 체크 -->
								<col width="50px"/><!-- 체크 -->
								<col width="50px"/><!-- 체크 -->
								<col width="150px"/><!-- 체크 -->
								<col width="725px"/><!-- 체크 -->
								<col width="50px"/><!-- 체크 -->
								<col width="50px"/><!-- 체크 -->
								<col width="50px"/><!-- 체크 -->
								<col width="50px"/><!-- 체크 -->
								<col width="50px"/><!-- 체크 -->
								</colgroup>
										
							
								<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>나이</th>
									<th>전화번호</th>
									<th>특이사항</th>
									<th>콜백</th>
									<th>추가</th>
									<th>매물</th>
									<th>수정</th>
									<th>삭제</th>
									
								
								</tr>
								</thead>
								
								<tbody>
								<c:forEach var="object_list" items="${object_list}" varStatus="status">
								<tr class="con">
									<td>${object_list.c_Num}</td>
									<td>${object_list.c_Name}</td>
									<td>${object_list.c_Gender}</td>
									<td>${object_list.c_Age}</td>
									<td>${object_list.c_Tel}</td>
									<td>${object_list.c_Content}</td>
									<td>${object_list.c_Form}</td>
									<td><a href="list?C_tel=${object_list.c_Tel}"><img src="resources/img/c.JPG" style="width: 30px; height: 33px; margin-top: 2px;"></a></td>
									<td><a href="customer_interest_view?C_tel=${object_list.c_Tel}"><img src="resources/img/list.JPG" style="width: 30px; height: 33px; margin-top: 2px;"></a></td>
									<td class="update_customer"><a href="#"><img src="resources/img/p.JPG" style="width: 30px; height: 35px;"></a></td>
									<td><a href="delete_customer?C_Num=${object_list.c_Num}"><img src="resources/img/r.JPG" style="width: 30px; height: 35px;"></a></td>
								
								
								
								</tr>
								</c:forEach>
								</tbody>
							
							
							</table>
						</div>
						
						
						
						
						
						
						<!-- phone -->
						
						<div class="cc_left_phone">
							<table>
								<colgroup>
								<col width="50px"/><!-- 체크 -->
								<col width="115px"/><!-- 체크 -->
								<col width="65px"/><!-- 체크 -->
								<col width="65px"/><!-- 체크 -->
								<col width="165px"/><!-- 체크 -->
								<col width="35px"/><!-- 체크 -->
								<col width="35px"/><!-- 체크 -->
								<col width="35px"/><!-- 체크 -->
								<col width="35px"/><!-- 체크 -->
								<col width="35px"/><!-- 체크 -->
							
								</colgroup>
										
							
								<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>나이</th>
									<th>전화번호</th>
									<th>콜백</th>
									<th>추가</th>
									<th>매물</th>
									<th>수정</th>
									<th>삭제</th>
									
								
								</tr>
								</thead>
								
								<tbody>
								<c:forEach var="object_list" items="${object_list}" varStatus="status">
								<tr class="con_phone">
									<td>${object_list.c_Num}</td>
									<td>${object_list.c_Name}</td>
									<td>${object_list.c_Gender}</td>
									<td>${object_list.c_Age}</td>
									<td>${object_list.c_Tel}</td>
									<td>${object_list.c_Form}</td>
									
									<td><a href="list?C_tel=${object_list.c_Tel}"><img src="resources/img/c.JPG" style="width: 30px; height: 33px; margin-top: 2px;"></a></td>
									<td><a href="customer_interest_view?C_tel=${object_list.c_Tel}"><img src="resources/img/list.JPG" style="width: 30px; height: 33px; margin-top: 2px;"></a></td>
									<td class="update_customer_phone"><a href="#"><img src="resources/img/p.JPG" style="width: 30px; height: 35px;"></a></td>
									<td><a href="delete_customer?C_Num=${object_list.c_Num}"><img src="resources/img/r.JPG" style="width: 30px; height: 35px;"></a></td>
								
								
								
								</tr>
								
								<tr co>
								<td style="background:#f3f3f3; ">특이<br>사항</td>
								<td colspan="9">${object_list.c_Content}</td>
								</tr>
								
								
								</c:forEach>
								</tbody>
							
							
							</table>
					
							
							
							
						</div>
						
						
						<!-- phone -->
					
					
					</div>

					
					
				
				</div>
				
			</div>
			
			

		</div>
		
	</body>
</html>