<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/list.css">	
	
	
	<script type="text/javascript">
		function nwindow(){
			var url ="o_register";
			window,open(url,"","width=800, height=900, left=50");
		}
	
	
	</script>
	</head> 
	<body>
	
	<div class="header">
		<div class="login_info">
			<div class="logoimg"><img alt="k" src="#"></div>
		</div>	
		<div class="manu_bar">
		<div class="manu_bar_box">
			<div class="manu_bar_top">
				<span>Project_Name</span>
				<span>일정관리</span>
				<span>매물관리</span>
				<span onclick="nwindow()">매물등록</span>
				<span>고객관리</span>
			</div>
			<form action="#" style="width:70%">
			<div class="search_con" style="display: flex";>
			
				<div class="village_search">
					동 검색<br>
					<input type="search" name="village">
				</div>
			
			
			
				<div class="kind_box">
					<div class="kind1">
					종류<br>
					<input type="checkbox" name="OneRoom" value="원룸">원룸<br>
					<input type="checkbox" name="tworoom" value="2룸">2룸<br>
					<input type="checkbox" name="threeroom" value="3룸">3룸<br>
					</div>
					
					<div class="kind2">
					<br>
					<input type="checkbox" name="officetel" value="원룸">오피스텔<br>
					<input type="checkbox" name="apartment" value="2룸">아파트<br>
					<input type="checkbox" name="vila" value="3룸">빌라<br>
					</div>
				</div>
				
				<div class="price_box">
					<div class="deal_form">
					    거래형태
						<select class="deal_form_select" name="deal_form">
							<option value="monthly_rent">월세</option>
							<option value="charter">전세</option>
							<option value="dealing">매매</option>
						</select><br>
						최소
						<input type="text" name="price_min"><br>
						최대
						<input type="text" name="price_max">
					</div>
					<div class="deposit_box">
					보증금<br>
					최소
					<input type="text" name="deposit_min"><br>
					최대
					<input type="text" name="deposit_max">					
					</div>
	
					<div class="maintenance cost_box">
					관리비<br>
					최소
					<input type="text" name="maintenance cost_min"><br>
					최대
					<input type="text" name="maintenance cost_max">					
					</div>
	
				</div>
			</div>
			</form>
			
		</div>
		<div class="manu_bar_middle" style="display: flex;">
			<button>전체보기</button>
			<button>거래완료</button>
			<button>거래가능</button>
		</div>
		<div class="manu_bar_bottom" style="display: flex;">
			<a href="list?ListOption=Shop"><button >상가</button></a>
			<a href="list?ListOption=OneRoom"><button >원룸</button></a>
			<a href="list?ListOption=TowRoom"><button>2룸</button></a>
			<a href="list?ListOption=ThreeRoom"><button>3룸</button></a>
			<a href="list?ListOption=Officetel"><button>오피스텔</button></a>
			<a href="list?ListOption=Apartment"><button>아파트</button></a>
			<a href="list?ListOption=Villa"><button>빌라</button></a>
			<a href="list?ListOption=House"><button>건물</button></a>
			<a href="list?ListOption=Land"><button>토지</button></a>
		</div>
		</div>
	</div>
	
	<div class="content">
	 <table class="content_table">
	 	<tr>
	 		<th></th>
	 		<th>중개</th>	 		
	 		<th>번호</th>
	 		<th>접수일자</th>

	 		<th>종류</th>
	 		<th>전월세</th>
	 		<c:if test="${ListOption ne 'Land'}">
	 		<th>동</th>
	 		</c:if>
	 		<c:if test="${ListOption ne 'Land'}">
	 		<th>건물/업체명</th>
	 		</c:if>
	 		
	 		<c:if test="${ListOption eq 'Land'}">
	 		<th>지역</th>
	 		</c:if>
	 		<c:if test="${ListOption eq 'Land'}">
	 		<th>토지명</th>
	 		</c:if>
	 		
	 		
	 		<!-- <th>번지주소</th> -->
	 		<th>도로명주소</th>
	 		<th>호수</th>
	 		<th>층수</th>
	 		<th>면적</th>
	 		<th>보증금</th>
	 		<th>월세</th>
	 		<c:if test="${ListOption eq 'OneRoom'}">
	 		<th>관리비</th>
	 		</c:if>
	 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' }">
	 		<th>권리금</th>
	 		</c:if>
	 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' || ListOption eq 'Officetel' || ListOption eq 'Apartment' || ListOption eq 'Villa' || ListOption eq 'House'}">
	 		<th>매매가</th>
	 		</c:if>
	 		<th>상세내용</th>
	 		<th>전화번호</th>
	 		<th>보기</th>
	 		<th>수정</th>
	 		<th>삭제</th>
	 	</tr>
	 	<c:forEach var="BoardList" items="${BoardList}">
	 	<tr>
	 		<td>v</td>
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
	 		<c:if test="${ListOption eq 'OneRoom'}">
	 		<td>${BoardList.m_cost}</td>		
	 		</c:if>
	 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop' }">
	 		<td>${BoardList.premium}</td>		
	 		</c:if>
	 		<c:if test="${ListOption eq 'Shop_House' || ListOption eq 'Shop'}">
	 		<td>2억</td>
	 		</c:if>
	 		<td class="detail_content">${BoardList.detail_content}</td>	
	 		<td class="">${BoardList.master_tel}</td>									
	 		<td><input type="button" value="보기" onclick="nwindow()"></td>
	 		<td>수정</td>
	 		<td>삭제</td>
	 	</tr>
	 	</c:forEach>	
	 	
	 	
	 	
	 
	 
	 </table>
	</div>
	
	<div class ="footer">

	</div>


		
	</body>
</html>