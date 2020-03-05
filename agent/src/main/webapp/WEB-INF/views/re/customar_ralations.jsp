<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/n_list.css">	
		<link rel="stylesheet" href="resources/css/resigter.css">	
				<link rel="stylesheet" href="resources/css/customar.css">	
	 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	
		
	
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
		<div class="header_area">
				<div class="customar_seach">
				
				</div>
				
				<div class="customar_seet">
					<button>주거</button>
					<button>상가</button>
					<button>매매</button>
				</div>
		</div>
		<div class="register_contents_area">




			<div class="contest_list_area" style="height: 100%; display: flex;">
					
					<div class="left_customar">
						<table>
							<tr>
								<th><button>번호</button></th>
								<th><button>접수일자</button></th>
								<th><button>이름</button></th>
								<th><button>전화번호</button></th>
								<th><button>나이</button></th>
								<th><button>성별</button></th>
								<th><button>요구조건</button></th>
								<th><button>특이사항</button></th>
							</tr>
							
							<tr>
								<td>1</td>
								<td>2019-01-14</td>
								<td>소준혁</td>
								<td>010-6858-8093</td>
								<td>29</td>
								<td>남</td>
								<td>1남향집</td>
								<td>개발자 3개월동안 알바중</td>
								
							</tr>
						
						
						</table>
						
					</div>
					
					<div class="right_customar_object">
						<div class="rco_top">
						<table>
							<tr>
								<th><button>번호</button></th>
								<th><button>건물명</button></th>
								<!-- 상가의 경우 업체명으로 표시 -->
								<th><button>주소</button></th>
								<th><button>호수</button></th>
								<!-- 상가읙 경우 업체명을로  -->
								<th><button>층수</button></th>
								<th><button>종류</button></th>
								<th><button>보증금</button></th>
								<th><button>월세</button></th>
								<th><button>관리비</button></th>
								<th><button>거래상태</button></th>
								<!-- 상가의 경우 권리금, 부가세 추가 -->
								<!-- 매매의 경우 매매가, 부가세 추가 -->
								<th><button>전화번호(주)</button></th>
								<th><button>전화번호(세)</button></th>
								
							</tr>
							
							<tr>
								<td>1</td>
								<td>베라체</td>
								<td>서울시 동대문구 장안동</td>
								<td>2층</td>
								<td>101호</td>
								<td>오피스텔</td>
								<td>가능</td>
								<td>2000</td>
								<td>50</td>
								<td>5</td>
								<td>010-6858-8093</td>
								<td>010-7063-3213</td>
								
								
							</tr></table>
							</div>
							
							<div class="rco_bottom">
								<button>공동중개</button>
							
							</div>
							
							
							
							</div>
					</div>					
				

				
				
		</div>


	</div>



		</div>

	
  </div>
	</div>



		
	</body>
</html>