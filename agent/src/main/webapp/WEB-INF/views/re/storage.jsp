<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/n_list.css">	
	<link rel="stylesheet" href="resources/css/resigter.css">	
	<link rel="stylesheet" href="resources/css/storage.css">	
	 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	
	
	<script type="text/javascript">
	
		var sid ="";
		var tid ="";
	
		function nwindow(){
			var url ="register";
			window,open(url,"","width=800, height=900, left=50");
		};
	
	
		$(document).on("click","button[name=Gestalt]",function(){
			$(".addinput").remove();
			$('[name="Gestalt"]').css("background", "white");
			$('[name="Gestalt"]').css("color", "#0c2a3a");


			
			sid = $(this).attr("id");

			$("#"+ sid).css("background", "#0c2a3a");
			$("#"+ sid).css("color", "white");


				var addinput = '<span class="addinput"><button id="OK0" name="kind" value="주택">주택</button>&nbsp;&nbsp;'+
					'<button id="OK8" name="kind" value="상가+주택">상가+주택</button>&nbsp;&nbsp;'+					
					'<button id="OK9" name="kind" value="토지">토지</button></span>';
						
			
			if(sid=="G3"){
			$(".object_kind_area").append(addinput);
			};
		});
		
	
	

	

		$(document).on("click","button[name=kind]",function (){
			$('[name="kind"]').css("background", "white");
			$('[name="kind"]').css("color", "#0c2a3a");
			
			tid = $(this).attr("id");

			$("#"+ tid).css("background", "#0c2a3a");
			$("#"+ tid).css("color", "white");
		
		});

	

	
	$(document).on("click","button[name=shop]", function(){
	
	var gid = sid;
	var okid = tid;
	var gvalue = $("#"+ gid).attr("value");
	var okvalue = $("#"+ okid).attr("value");
		
	if(gvalue == null){
		alert("거래형태를 선택하지 않았습니다.");	
	}
	if(okvalue == null){
		alert("물건종류를 선택하지 않았습니다.");	
	}
	
	
		
	
	var shop = 
		'<th>권리금</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>'+
		'<th>부가세</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>';

	var opt = "";	
	if(okvalue == "상가")	{
		opt = shop;	
	}
	
	
	var select_opt ="";
	
	var st_shop = 
		'<option>상가</option>'+
		'<option>사무실</option>'+
		'<option>창고</option>';
		
	var st_oneroom =
		'<option>원룸</option>'+
		'<option>1.5룸</option>'+
		'<option>복층</option>';
		
	var st_tworoom =
		'<option>투룸</option>';

	var st_threeroom = 
		'<option>쓰리룸</option>';

	var st_oft = 
		'<option>원룸</option>'+
		'<option>투룸</option>'+
		'<option>오픈형</option>';
		
	var st_apt = 
		'<option>원룸</option>'+
		'<option>투룸</option>'+
		'<option>쓰리룸</option>';
	
	
	var st_vil = 
		'<option>원룸</option>'+
		'<option>투룸</option>'+
		'<option>쓰리룸</option>';
		
		
		
		
	if(okvalue == "원룸")	{
		select_opt = st_oneroom;
	}
	if(okvalue == "투룸")	{
		select_opt = st_tworoom;
	}
	if(okvalue == "쓰리룸")	{
		select_opt = st_threeroom;
	}
	if(okvalue == "오피스텔")	{
		select_opt = st_oft;
	}
	if(okvalue == "아파트")	{
		select_opt = st_apt;
	}
	if(okvalue == "빌라")	{
		select_opt = st_vil;
	}
	if(okvalue == "상가")	{
		select_opt = st_shop;
	}
		
		
	
		
		
		
		
	
	var adddiv = '<hr>'+ 
	'<div class="object_informatin" style="width: 100%;">'+
	'<table class="o_info2" style="width: 100%;">'+
		'<h5>-'+okvalue+'-</h5>'+
		'<tr>'+
		'<th>형태</th>'+
		'<td>'+
			'<select>'+
			select_opt+
			'</select>'+											
		'</td>'+	
		'<th>층수</th>'+
		'<td><input type="number" name="m_floor" min="1" max="50"></td>'+	
		'<th>호수</th>'+
		'<td><input type="number" name="m_ho"  min="1" max="9999"></td>'+
		'<th>평수</th>'+
		'<td><input type="number" name="m_space"  min="1" max="1000"></td>'+
		'<th>m2</th>'+
		'<td><input type="number" name="m_space"  min="1" max="1000"></td>'+

	'</tr>'+
	
	'<tr>'+
		'<th>관리비</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>'+
		'<th>보증금</th>'+
		'<td><input type="number" name="deposit" min="1" max="999999999"></td>'+
		'<th>월세</th>'+
		'<td><input type="number" name="monthly_rent" min="1" max="99999999"></td>'+
		opt+
				
	'</tr>'+	
'</table>'+	
	'<br>'+
	'<div>'+
	'<b><p style="margin-left: 1.8%;">상세내용</p></b>'+
	'<textarea rows="5" cols="180" style="margin-left: 1.8%;" name="detail_content"></textarea>'+
	'</div>'+
'</div>';
	
	if(gvalue != null && okvalue != null){
		$(".oneroom").prepend(adddiv);	
		
	}

});
	
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
				<div class="search_area">
				  <span>번지명 입력</span>
				  <span style="margin-left: 35%;">도로명 입력</span>
				  <br>
				<input class="address_search" type="search" name="s_address" >
				<input class="address_search" type="search" name="s_address" >
					<input type="submit" style="width: 8%; height: 30px;">
		
				</div>
		</div>
		<div class="register_contents_area">




			<div class="contest_list_area" style="height: 100%;">
					
				<div class="basic_information">

				 <h3>담은 매물 보기</h3>
				 <span>
				 <button>주거</button>
				 <button>상가</button>
				 <button>매매</button>
				 </span>
				 <hr class="hr1">
				 <div class="test" style="display: flex;">
					<div class="heard_area1" style="width: 100%;">
						<div class="title_area">
							<p>Storage[1]</p>
						</div>
						<table style="width: 100%;">
						
						<tr>
							<th><button>번호</button></th>
							<th><button>중개</button></th>
							<th><button>건물명</button></th>
							<th><button>접수일자</button></th>
							<th><button>종류</button></th>
							<th><button>전월세</button></th>
							<th><button>동</button></th>
							<th><button>도로명주소</button></th>
							<th><button>번지주소</button></th>
							<th><button>층수</button></th>
							<th><button>호수</button></th>
							<th><button>면적</button></th>
							<th><button>보증금</button></th>
							<th><button>월세</button></th>
							<th><button>관리비</button></th>
							<th><button>상세보기</button></th>
							<th><button>전화번호</button></th>
							
						</tr>
						
						
						<tr>
							<td>1</td>
							<td>가능</td>
							<td>베라체</td>
							<td>2017.01.14</td>
							<td>원룸</td>
							<td>월세</td>
							<td>휘경동</td>
							<td>서울시 섬밭로 139</td>
							<td>서울시 중랑구 면목5동</td>
							<td>2층</td>
							<td>101호</td>
							<td>30</td>
							<td>500</td>
							<td>10</td>
							<td>5</td>
							<td>테스트를위한...</td>
							<td>010-6858-8093</td>
							
						
						</tr>
						
												<tr>
							<td>1</td>
							<td>가능</td>
							<td>베라체</td>
							<td>2017.01.14</td>
							<td>원룸</td>
							<td>월세</td>
							<td>휘경동</td>
							<td>서울시 섬밭로 139</td>
							<td>서울시 중랑구 면목5동</td>
							<td>2층</td>
							<td>101호</td>
							<td>30</td>
							<td>500</td>
							<td>10</td>
							<td>5</td>
							<td>테스트를위한...</td>
							<td>010-6858-8093</td>
							
						
						</tr>
						
												<tr>
							<td>1</td>
							<td>가능</td>
							<td>베라체</td>
							<td>2017.01.14</td>
							<td>원룸</td>
							<td>월세</td>
							<td>휘경동</td>
							<td>서울시 섬밭로 139</td>
							<td>서울시 중랑구 면목5동</td>
							<td>2층</td>
							<td>101호</td>
							<td>30</td>
							<td>500</td>
							<td>10</td>
							<td>5</td>
							<td>테스트를위한...</td>
							<td>010-6858-8093</td>
							
						
						</tr>
						</table>
						<div class="footer_area">
							<span style="float: right;">
							<button>추가</button>
							<button>수정</button>
							<button>삭제</button>
							</span>
							
						</div>
						<br>
						<hr>
						<br>
					
					
						<!-- 복붙부분 -->
					
					<div class="title_area">
							<p>Storage[2]</p>
						</div>
						<table style="width: 100%;">
						
						<tr>
							<th><button>번호</button></th>
							<th><button>중개</button></th>
							<th><button>건물명</button></th>
							<th><button>접수일자</button></th>
							<th><button>종류</button></th>
							<th><button>전월세</button></th>
							<th><button>동</button></th>
							<th><button>도로명주소</button></th>
							<th><button>번지주소</button></th>
							<th><button>층수</button></th>
							<th><button>호수</button></th>
							<th><button>면적</button></th>
							<th><button>보증금</button></th>
							<th><button>월세</button></th>
							<th><button>관리비</button></th>
							<th><button>상세보기</button></th>
							<th><button>전화번호</button></th>
							
						</tr>
						
						
						<tr>
							<td>1</td>
							<td>가능</td>
							<td>베라체</td>
							<td>2017.01.14</td>
							<td>원룸</td>
							<td>월세</td>
							<td>휘경동</td>
							<td>서울시 섬밭로 139</td>
							<td>서울시 중랑구 면목5동</td>
							<td>2층</td>
							<td>101호</td>
							<td>30</td>
							<td>500</td>
							<td>10</td>
							<td>5</td>
							<td>테스트를위한...</td>
							<td>010-6858-8093</td>
							
						
						</tr>
						
												<tr>
							<td>1</td>
							<td>가능</td>
							<td>베라체</td>
							<td>2017.01.14</td>
							<td>원룸</td>
							<td>월세</td>
							<td>휘경동</td>
							<td>서울시 섬밭로 139</td>
							<td>서울시 중랑구 면목5동</td>
							<td>2층</td>
							<td>101호</td>
							<td>30</td>
							<td>500</td>
							<td>10</td>
							<td>5</td>
							<td>테스트를위한...</td>
							<td>010-6858-8093</td>
							
						
						</tr>
						
												<tr>
							<td>1</td>
							<td>가능</td>
							<td>베라체</td>
							<td>2017.01.14</td>
							<td>원룸</td>
							<td>월세</td>
							<td>휘경동</td>
							<td>서울시 섬밭로 139</td>
							<td>서울시 중랑구 면목5동</td>
							<td>2층</td>
							<td>101호</td>
							<td>30</td>
							<td>500</td>
							<td>10</td>
							<td>5</td>
							<td>테스트를위한...</td>
							<td>010-6858-8093</td>
							
						
						</tr>
						</table>
						<div class="footer_area">
							<span style="float: right;">
							<button>추가</button>
							<button>수정</button>
							<button>삭제</button>
							</span>
						</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					</div>
	          </div>
	          	
	          <div class="oneroom">
	          
	          
	          </div>
	          
	          
	              
			</div>	

				
				
		</div>


	</div>



		</div>

	
  </div>
	</div>



		
	</body>
</html>