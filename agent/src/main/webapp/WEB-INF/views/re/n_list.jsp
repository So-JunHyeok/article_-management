<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/n_list.css">	
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>	

	
	
	
	
	
	<script type="text/javascript">
		function nwindow(){
			var url ="o_register";
			window,open(url,"","width=800, height=900, left=50");
		}
	</script>
	
	<script type="text/javascript">
	$(document).on("click","button[name=kind_drop_manu]", function(){
			var div = $(".kind_drop").css("display");
			if(div=='none'){
				$(".kind_drop").css("display","block");	
			}
			else{
				$(".kind_drop").css("display","none");	
			}

		});
	
	

	$(document).on("click","button[name=customar_drop_manu]", function(){
			var div = $(".customar_drop").css("display");
			if(div=='none'){
				$(".customar_drop").css("display","block");	
			}
			else{
				$(".customar_drop").css("display","none");	
			}

		});
	</script>
	

<script type="text/javascript">
$(document).on("click","#ajax_test", function(){
	var s_address = $(this).attr("data-value");
	var b_address = $(this).attr("data-value1");
	console.log("s변수=" + s_address)
	console.log("b변수=" + b_address)
	alert("스크립트까지는성공");
		$.ajax({
			type : "GET",	
			dataType : "json",
			url : "sublist",
			data : {tst: tst},
			success : function(data) {
 				$.each(data, function(key, value){
 					$.each(value, function(list_key, list_value){
 						console.log(list_key, list_value)
 						console.log(list_value.name);
 						var td = "<tr>";
 						var etd = "</tr>";
 						var wnd = "<td>중개</td>";
 						var num = "<td>"+list_value.num +"</td>";
 						var register_date = "<td>"+list_value.register_date +"</td>";
 						var kind = "<td>"+list_value.kind +"</td>";
 						var m_transaction = "<td>"+list_value.m_transaction +"</td>";
 						var h_addressname = "<td>"+list_value.h_addressname +"</td>";
 						var m_ho = "<td>"+list_value.m_ho +"</td>";
 						var m_floor = "<td>"+list_value.m_floor +"</td>";
 						var m_space = "<td>"+list_value.m_space +"</td>";
 						var deposit = "<td>"+list_value.deposit +"</td>";
 						var monthly_rent = "<td>"+list_value.monthly_rent +"</td>";
 						var m_cost = "<td>"+list_value.m_cost +"</td>";
 						var premium = "<td>"+list_value.premium +"</td>";
 						var aoao = "<td>2억</td>";
 						var master_tel = "<td>"+list_value.master_tel +"</td>";
 						var view = "<td ><a onclick='nwindow()'>보기</a></td>";
 						
 						$('.footer_table1').append("<tr>" + wnd + num + register_date + kind + m_transaction
 								+ h_addressname + m_ho + m_floor + m_space + deposit + monthly_rent + m_cost + premium
 								+ aoao + master_tel + view + "</tr>");
 						
 						
 					});
 				});


			
		},				
			error : function(e) {
                    console.log(e.responseText);
                }
	
});
		
});
	
</script>





	
	
	</head> 
	<body>
	<div class="wrap">
  <div class="content"style="display: flex;">


	<div class="wrap_left_area">

			<div class="sidemanu_area">
          <div class="logo_area">
            <img src="resources/img/logo.JPG">
          </div>
          <br>
          
          <div class="side_manu">
          	<button>일정관리</button>
          	<button name="kind_drop_manu">매물보기</button>
          		<div id="kind_drop" class="kind_drop">
          			<p><a href="list?ListOption=OneRoom">- 원룸</a></p>
          			<hr>
          			<p><a href="list?ListOption=TwoRoom">- 2룸</a></p>
          			<hr>
          			<p><a href="list?ListOption=ThreeRoom">- 3룸</a></p>
          			<hr>
          			<p><a href="list?ListOption=Villa">- 빌라</a></p>
          			<hr>
          			<p><a href="list?ListOption=Apartment">- 아파트</a></p>
          			<hr>
          			<p><a href="list?ListOption=Officetel">- 오피스텔</a></p>
          			<hr>
          			<p><a href="list?ListOption=Shop">- 상가</a></p>
          			<hr>
          			<p><a href="list?ListOption=Land">- 토지</a></p>
          			<hr>
          			<p><a href="list?ListOption=Shop">- 상가주택</a></p>
          			<hr>
          			<p><a href="list?ListOption=Land">- 주택</a></p>
          			
          		</div>
          	<button><a href="register_nhn">매물등록</a></button>
          	<button name="customar_drop_manu">고객관리</button>
          	<div id="customar_drop" class="customar_drop">
          			<p><a href="customar_nhn">- 고객정보</a></p>
          			<hr>
          			<p><a href="#">- 고객등록</a></p>
          			
          			</div>
          			<button><a href="storage_nhn">장바구니</a></button>
          
          
          </div>
			</div>
	</div>


		<div class="wrap_right_area">
		<div class="header_area" style="display: flex;">


			<div class="header_1_area">
        <div class="village_search">
				<br>        
          <h4>통합검색</h4>
          <select style="margin-top: 1%;">
          	<option>통합검색</option>          	
          	<option>주소</option>
          	<option>건물명</option>
          	<option>전화번호</option>
          </select>
          <input type="search" name="village" value="통합검색">
          <input type="submit" value="검색">
      </div>
			</div>

			<div class="header_2_area">
				<div class="division_checkbox">
				<br>
          <h4>종류</h4>				
					<input type="checkbox" name="shop" value="shop">&nbsp;<span>원룸</span>
					<input type="checkbox" name="shop" value="shop">&nbsp;<span>1.5룸</span>
					<input type="checkbox" name="shop" value="shop">&nbsp;<span>분리형</span>		
				</div>
				<div class="transaction">
				<br>
        		  <h4>전월세/매매</h4>	
		  			<input type="checkbox" name="shop" value="shop">&nbsp;<span>월세</span><br>
					<input type="checkbox" name="shop" value="shop">&nbsp;<span>전세</span><br>
					<input type="checkbox" name="shop" value="shop">&nbsp;<span>매매</span>		
				</div>
				
				<div class="zone">
				<br>				
          <h4>동 선택</h4>					
					<select>
					<option>휘경동</option>
						<option>장안동</option>
						<option>면목동</option>
					</select>
					<select>
						<option>선택없음</option>						
						<option>휘경동</option>
						<option>장안동</option>
						<option>면목동</option>
					</select>					
				</div>
				
			</div>

			<div class="header_3_area">
			<div class="deposit">
			<h4>보증금</h4>
			<p>최소</p>
			<input type="number" name="deposit_min" min="1" max="999999999">
			<p>최대</p>
			<input type="number" name="deposit_max" min="1" max="999999999">
			</div>
			<div class="monthly_rent">
			<h4>월세</h4>
			<p>최소</p>
			<input type="number" name="deposit_min" min="1" max="999999999">
			<p>최대</p>
			<input type="number" name="deposit_max" min="1" max="999999999">
			</div>
			<div class=" disposal ">
			<h4>매매</h4>
			<p>최소</p>
			<input type="number" name="deposit_min" min="1" max="999999999">
			<p>최대</p>
			<input type="number" name="deposit_max" min="1" max="999999999">
			</div>
			<div class="detail_submit">
			<input type="submit" name="detail_submit" value="검색" width="50%" height="50%;">
			</div>
			</div>

			<div class="header_4_area">
			<div class="option_button">
			<button>매물담기</button><br>
			<button>고객카드</button><br>
			<button>선택삭제</button>
			</div>

			</div>

		</div>

		<div class="contents_area">



			<div class="contest_list_area">
        	<table class="content_table">
        		<colgroup>
        		<!-- 공통 -->
        			<col width="1%"/><!-- 체크 -->
        			<col width="3%"/><!-- 중개가능여부 -->
        			<col width="2%"/><!-- 번호 -->
        			<col width="6%"/><!-- 접수일자 -->
        			<col width="3%"/><!-- 종류 -->
        			<col width="4%"/><!-- 전월세 -->
        			
        			<col width="4%"/><!-- 동 -->
        			
        			<col width="9%"/><!-- 건물업체명 -->
        			<col width="9%"/><!-- 주소 -->
        			<col width="5%"/><!-- 호수 -->
        			<col width="3%"/><!-- 층수 -->
        			
        			<col width="5%"/><!-- 면적 -->
        			<col width="4%"/><!-- 보증금 -->
        			<col width="4%"/><!-- 월세 -->
        			<c:if test="${ListOption ne 'Land'}">
         			<col width="4%"/><!-- 관리비 -->   
         			</c:if>
         			<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' }">    			
        			<col width="4%"/><!-- 권리금 -->
        			</c:if>
        			<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' || ListOption eq 'Officetel' || ListOption eq 'Apartment' || ListOption eq 'Villa' || ListOption eq 'House'}">
        			<col width="4%"/><!-- 매매가 -->
        			</c:if>
        			
        			<col width="*"/><!-- 상세내용 -->
        			<col width="7%"/><!-- 전화번호 -->
        			<col width="3%"/><!-- 보기 -->
        			<col width="3%"/><!-- 수정 -->
        			<col width="3%"/><!-- 삭제 -->

        		
        		</colgroup>
			 	<tr>
			 		<th scope="col"><button style="width: 100%; height: 100%;"><input type="checkbox" name="d"></button></th>
			 		<th scope="col"><button>중개</button></th>	 
			 		<th scope="col"><button>번호</button></th>
			 		<th scope="col"><button>접수일자</button></th>
		
			 		<th scope="col"><button>종류</button></th>
			 		<th scope="col"><button>전월세</button></th>
			 		<c:if test="${ListOption ne 'Land'}">
			 		<th scope="col"><button>동</button></th>
			 		</c:if>
			 		<c:if test="${ListOption ne 'Land'}">
			 		<th scope="col"><button>건물/업체명</button></th>
			 		</c:if>
			 		
			 		<c:if test="${ListOption eq 'Land'}">
			 		<th scope="col"><button>지역</button></th>
			 		</c:if>
			 		<c:if test="${ListOption eq 'Land'}">
			 		<th scope="col"><button>토지명</button></th>
			 		</c:if>
			 		
			 		
			 		<!-- <th>번지주소</th> -->
			 		<th scope="col"><button>도로명주소</button></th>
			 		<th scope="col"><button>호수</button></th>
			 		<th scope="col"><button>층수</button></th>
			 		<th scope="col"><button>면적</button></th>
			 		<th scope="col"><button>보증금</button></th>
			 		<th scope="col"><button>월세</button></th>
			 		<c:if test="${ListOption ne 'Land'}">
			 		<th scope="col"><button>관리비</button></th>
			 		</c:if>
			 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' }">
			 		<th scope="col"><button>권리금</button></th>
			 		</c:if>
			 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' || ListOption eq 'Officetel' || ListOption eq 'Apartment' || ListOption eq 'Villa' || ListOption eq 'House'}">
			 		<th scope="col"><button>매매가</button></th>
			 		</c:if>
			 		<th scope="col"><button>상세내용</button></th>
			 		<th scope="col"><button>전화번호</button></th>
			 		<th scope="col"><button>보기</button></th>
			 		<th scope="col"><button>수정</button></th>
			 		<th scope="col"><button>삭제</button></th>
			 	</tr>
				</table>
				<table class="content_table1">
				<colgroup>
       			<col width="1%"/><!-- 체크 -->
        			<col width="3%"/><!-- 중개가능여부 -->
        			<col width="2%"/><!-- 번호 -->
        			<col width="6%"/><!-- 접수일자 -->
        			<col width="3%"/><!-- 종류 -->
        			<col width="4%"/><!-- 전월세 -->
        			
        			<col width="4%"/><!-- 동 -->
        			
        			<col width="9%"/><!-- 건물업체명 -->
        			<col width="9%"/><!-- 주소 -->
        			<col width="5%"/><!-- 호수 -->
        			<col width="3%"/><!-- 층수 -->
        			
        			<col width="5%"/><!-- 면적 -->
        			<col width="4%"/><!-- 보증금 -->
        			<col width="4%"/><!-- 월세 -->
        			<c:if test="${ListOption ne 'Land'}">
         			<col width="4%"/><!-- 관리비 -->   
         			</c:if>
         			<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' }">    			
        			<col width="4%"/><!-- 권리금 -->
        			</c:if>
        			<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' || ListOption eq 'Officetel' || ListOption eq 'Apartment' || ListOption eq 'Villa' || ListOption eq 'House'}">
        			<col width="4%"/><!-- 매매가 -->
        			</c:if>
        			
        			<col width="*"/><!-- 상세내용 -->
        			<col width="7%"/><!-- 전화번호 -->
        			<col width="3%"/><!-- 보기 -->
        			<col width="3%"/><!-- 수정 -->
        			<col width="3%"/><!-- 삭제 -->
        		

        		
        		
        		</colgroup>
				
				
				
			 	<c:forEach var="BoardList" items="${BoardList}" varStatus="status">
				<c:set var="test" value="${BoardList.name}"></c:set>
			 	<tr id="ajax_test" data-value="${test}">
			 		
			 		<td><input type="checkbox" name="d"></td>

			 		<td>가능</td>	
			 		<td>${BoardList.num}</td>
			 		<td>${BoardList.register_date}</td>	
			 		<td>${BoardList.kind}</td>	
			 		<td>${BoardList.m_transaction}</td>		
			 		<td>${BoardList.zone}</td>	
			 		<td>${BoardList.name}</td>
			 		<%-- <td>${BoardList.h_addressname}</td> --%>		
			 		<td>${BoardList.s_addressname}</td>			
			 		<td>${BoardList.m_ho}</td>	
			 		<td>${BoardList.m_floor}</td>	
			 		<td>${BoardList.m_space}</td>	
			 		<td>${BoardList.deposit}</td>	
			 		<td>${BoardList.monthly_rent}</td>		
			 		<c:if test="${ListOption ne 'Land'}">
			 		<td>${BoardList.m_cost}</td>		
			 		</c:if>
			 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' }">
			 		<td>${BoardList.premium}</td>		
			 		</c:if>
			 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' || ListOption eq 'Officetel' || ListOption eq 'Apartment' || ListOption eq 'Villa' || ListOption eq 'House'}">
			 		<td>2억</td>
			 		</c:if>
			 		<td class="detail_content">${BoardList.detail_content}</td>	
			 		<td class="">${BoardList.master_tel}</td>									
			 		<td ><a onclick="nwindow()">보기</a></td>
			 		<td>수정</td>
			 		<td>삭제</td>
			 		
			 	</tr>
		 			
			 	</c:forEach>	
			 	
	 		</table>



			</div>



		</div>

		<div class="footer_area">
			<div class="forter_top_area"style="display: flex;">
				<div class="footer_top_left">

				</div>

				<div class="footer_top_right">

				</div>


			</div>

			<div class="footer_content_area" style="display: flex;">
				<div class="footer_left_area">
				<table class="footer_table">
				<colgroup>
        			<col width="5%"/>
        			<col width="3%"/>
        			<col width="10%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="*"/>
        			<col width="5%"/>
        			

        		
        		</colgroup>
				
				
					<tr>
			 		<th scope="col"><button>중개</button></th>	 
			 		<th scope="col"><button>번호</button></th>
			 		<th scope="col"><button>접수일자</button></th>
		
			 		<th scope="col"><button>종류</button></th>
			 		<th scope="col"><button>전월세</button></th>


			 		
			 		<c:if test="${ListOption eq 'Land'}">
			 		<th scope="col"><button>지역</button></th>
			 		</c:if>
			 		<c:if test="${ListOption eq 'Land'}">
			 		<th scope="col"><button>토지명</button></th>
			 		</c:if>
			 		
			 		

			 		<th scope="col"><button>호수</button></th>
			 		<th scope="col"><button>층수</button></th>
			 		<th scope="col"><button>면적</button></th>
			 		<th scope="col"><button>보증금</button></th>
			 		<th scope="col"><button>월세</button></th>
			 		<c:if test="${ListOption eq 'OneRoom'}">
			 		<th scope="col"><button>관리비</button></th>
			 		</c:if>
			 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' }">
			 		<th scope="col"><button>권리금</button></th>
			 		</c:if>
			 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' || ListOption eq 'Officetel' || ListOption eq 'Apartment' || ListOption eq 'Villa' || ListOption eq 'House'}">
			 		<th scope="col"><button>매매가</button></th>
			 		</c:if>
			 		<th scope="col"><button>전화번호</button></th>
					<th scope="col"><button>보기</button></th>
					
					</tr>	
				
				</table>
				
				<table class="footer_table1">
				
			 	<colgroup>
        			<col width="5%"/>
        			<col width="3%"/>
        			<col width="10%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="5%"/>
        			<col width="*"/>
        			<col width="5%"/>
        		</colgroup>
   

		
				
				</table>

				</div>

				<div class="footer_right_area">
					<table class="d_content_area">
					<tr>
						<th><button>상세내용</button></th>
					</tr>
					<tr>	
						<td>
						<p>고양이가 좋아하는 풀!</p>
						<p>캣그라스는 고앵이가 좋아아하는 풀을 일컫는 용어입니다.</p>
						</td>
					</tr>
					</table>
				</div>
			</div>
		</div>




	</div>
  </div>
	</div>


	</body>
</html>