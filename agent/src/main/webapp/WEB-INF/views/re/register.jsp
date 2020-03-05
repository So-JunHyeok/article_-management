<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/n_list.css">	
	<link rel="stylesheet" href="resources/css/resigter.css">	
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
				 <h3>건물/토지정보</h3>
				 <hr>
				 <br>

				 <h3>물건정보</h3>
				 <hr>
				 <div class="test" style="display: flex;">
				 <div class="object_kind_select">
				 <span>거래 형태</span>&nbsp;&nbsp;
				 <span>
				 <button id="G1" type="button" name="Gestalt" value="o">월세</button>&nbsp;&nbsp;
				 <button id="G2" type="button" name="Gestalt" value="j">전세</button>&nbsp;&nbsp;
				 <button id="G3" type="button" name="Gestalt" value="m">매매</button>&nbsp;&nbsp;
				 </span>
				 <br>
				 <br>
				 <span class="object_kind_area">물건 종류&nbsp;&nbsp;
					<button id="OK1" name="kind" value="원룸">원룸</button>&nbsp;&nbsp;
					<button id="OK2" name="kind" value="투룸">투룸</button>&nbsp;&nbsp;
					<button id="OK3" name="kind" value="쓰리룸">쓰리룸</button>&nbsp;&nbsp;
					<button id="OK4" name="kind" value="빌라">빌라</button>&nbsp;&nbsp;
					<button id="OK5" name="kind" value="오피스텔">오피스텔</button>&nbsp;&nbsp;
					<button id="OK6" name="kind" value="아파트">아파트</button>&nbsp;&nbsp;
					<button id="OK7" name="kind" value="상가">상가</button>&nbsp;&nbsp;
				 </span>
				 </div>
		
			
				
				<div class="object_kind_button">
					<button name="shop">물건추가</button>
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