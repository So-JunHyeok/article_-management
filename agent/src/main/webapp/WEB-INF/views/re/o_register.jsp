<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/resigter.css">	
<script src="resources\js\jquery-3.3.1.min.js" charset="utf-8"></script>
<script src="resources\js\addresigterdiv.js" charset="utf-8"></script>
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>








</head>
<body>
	
	<div class="wrap">
	<div class="title">

	
	</div>

	<div class="object_informatin">

		<h5>- 공통정보 -</h5>
			<div class="address_input"style="width: 100%;">
				<table style="height: 100%;">
					<tr>
						<th >접수일자</th>
						<td><input type="date" name="register_date"></td>						
						<th>건물명/업체명</th>
			            <td><input type="text" name="zone"></td>
						<th>등록자</th>
			            <td><input type="text" name="name"></td>			            			            
						
					</tr>
				</table>
				
				<table style="height: 100%;">
					<tr>
						<th>동</th>
			            <td><input type="text" name="zone"></td>
						<th>지번주소</th>
						<td><input type="text" name="h_addressname"></td>
						<th>도로명주소</th>
						<td><input type="text" name="s_addressname"></td>						
					</tr>
				</table>
								
			</div>		
	
	</div>
	
	
	


	<div class="building_information">
	<h5>- 건물정보 -</h5>
	<table style="width: 100%;">
			<tr>
				<th>준공연도</th>
				<td><input type="date"></td>			
				<th>건페율</th>
				<td><input type="number" min="1" max="50"></td>
				<th>용적률</th>
				<td><input type="number" min="1" max="50"></td>	
				<th>지하철역</th>
				<td><input type="text" min="1" max="50"></td>	
			</tr>
			<tr>
				<th>리모델링</th>
				<td>
				<select>
					<option>없음</option>
					<option>있음</option>
				</select>
				</td>
				<th>연면적</th>
				<td><input type="number" min="1" max="50"></td>
				<th>지상면적</th>
				<td><input type="number" min="1" max="50"></td>
				<th>건축면적</th>
				<td><input type="number" min="1" max="50"></td>					
			</tr>
			<tr>
				<th>구조</th>
				<td><input type="text" min="1" max="50"></td>
				<th>층수</th>
				<td><input type="text" min="1" max="50"></td>
				<th>주차</th>
				<td><input type="text" min="1" max="50"></td>
				<th>엘리베이터</th>
				<td><input type="text" min="1" max="50"></td>			
			</tr>
		
		</table>
	
	</div>
	<h5>- 토지정보 -</h5>
	<div class="land_information">
			<table>
			<tr>
				<th>지목</th>
				<td>
			    <select>
					<option>대</option>
					<option>중</option>
					<option>소</option>
				</select>
				</td>
				<th>용도지역</th>
				<td><input type="text" min="1" max="50"></td>				
				<th>면적(m2)</th>
				<td><input type="text" min="1" max="50"></td>
				<th>면적(평)</th>
				<td><input type="text" min="1" max="50"></td>		
			</tr>
			
			<tr>
			    <th>도로현황</th>
				<td><input type="text" min="1" max="50"></td>		
				<th>공시지가합</th>
				<td><input type="number" min="1" max="50"></td>
				<th>공시지가(m2)</th>
				<td><input type="number" min="1" max="50"></td>
				<th>공시지가(평)</th>
				<td><input type="number" min="1" max="50"></td>
			</tr>
		
		</table>
	</div>
	
	<h5>- 건물주정보 -</h5>
	<div class="master_information">
		<table>
			<tr>
				<th>임대인</th>
				<td>소준혁</td>
				<th>연락처</th>
				<td>010-6858-8093</td>
				<th>관리/경비실</th>
				<td>010-435-8093</td>

			</tr>
		
		</table>
	
	</div>
			<div class="kind_button">
			<br>
			<button name="shop" value="shop">상가추가</button>		
			<button name="123vao" value="1room">원룸추가</button>
			<button name="123vao" value="2room">2룸추가</button>
			<button name="123vao" value="3room">3룸추가</button>
			<button name="123vao" value="officetel">오피스텔추가</button>
			<button name="123vao" value="apartment">아파트추가</button>
			<button name="123vao" value="villa">빌라추가</button>
			<button name="mama" value="mama">매매추가</button>			
			<button name="">건물매매</button>
		</div>		
		
		<div class="object_informatin1" id="test1">

		</div>	
			
		<div class="object_informatin1" id="test2">	

		</div>		
			
					
		<div class="object_informatin1" id="test3">	

		</div>	
		
		<div class="object_informatin1" id="test3">	

		</div>	
		
		<div class="object_informatin1" id="test3">	
		
		</div>	
	
	
	</div>


		
	</body>
</html>