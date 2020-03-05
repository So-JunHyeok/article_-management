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
		
	
	

	
// 매물의 종류 선택 스크립트

		$(document).on("click","button[name=kind]",function (){
			$('[name="kind"]').css("background", "white");
			$('[name="kind"]').css("color", "#0c2a3a");
			
			tid = $(this).attr("id");

			$("#"+ tid).css("background", "#0c2a3a");
			$("#"+ tid).css("color", "white");
		
		});

	

	//매물 추가하는 스크립트 
	$(document).on("click","button[name=add]", function(){
		var one_v = $(".oneroom").attr("data-value");
		var arr = "";
		arr = Number(one_v);
		arr +-1;
		one_v = Number(one_v);
		one_v +=1;
		$(".oneroom").attr("data-value", one_v);
		
		
		
		
		
		var k = 0;
		var j = k +1;
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		today = yyyy+'-'+mm+'-'+dd;
		
	    if(dd < 10){
	    	dd = "0"+dd;
	    };
	    if(mm < 10){
	    	mm = "0"+mm;
	    };	
		
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
		'<option>2룸</option>'+
		'<option>3룸</option>'+
		'<option>4룸</option>';
	
	
	var st_vil = 
		'<option>원룸</option>'+
		'<option>2룸</option>'+
		'<option>3룸</option>'+
		'<option>4룸</option>';
		
		
		var st_ofi =
			'<option>원룸</option>'+
			'<option>1.5룸</option>'+
			'<option>2룸</option>'+
			'<option>복층</option>';	
		
		var select_d = "selected";
		
		
		var oneroom = "";
		var tworoom = "";
		var threeroom = "";
		var vil = "";
		var ofi = "";
		var art = "";
		var shop = "";
		var mo = "";
		var de = "";
		var mn = "";
		var oj = "";
		
		
		
	if(okvalue == "원룸")	{
		oneroom = select_d;
		select_opt = st_oneroom;
	}
	if(okvalue == "투룸")	{
		tworoom = select_d;
		select_opt = st_tworoom;
	}
	if(okvalue == "쓰리룸")	{
		threeroom = select_d;
		select_opt = st_threeroom;
	}
	if(okvalue == "오피스텔")	{
		ofi = select_d;
		select_opt = st_ofi;
	}
	if(okvalue == "아파트")	{
		art = select_d;
		select_opt = st_apt;
	}
	if(okvalue == "빌라")	{
		vil = select_d;
		select_opt = st_vil;
	}
	if(okvalue == "상가")	{
		shop = select_d;
		select_opt = st_shop;
	}
	
	
	
	if(gvalue == "o")	{
		mo = select_d;
	}
	if(gvalue == "j")	{
		de = select_d;
	}
	if(gvalue == "m")	{
		mn = select_d;
	}
	if(gvalue == "oj")	{
		oj = select_d;
	}
				
	var adddiv = 
		'<div class="object_information">'+
		'<div class="ob_address" style="display: flex;">'+
		'<input type="hidden" class="sample4_postcode" placeholder="우편번호 ">'+
		'<div class="1" style="margin-left: 5px;">'+
		'<p>동</p>'+
		'<input type="text" class="sample4_extraAddress" name="object_List_file['+arr+'].OB_Dong" placeholder="동" style="width: 100px;"value="0">'+
		'</div>'+
		'<div class="2" style="margin-left: 5px;">'+
		'<p>도로명주소</p>'+
		'<input type="text" class="sample4_roadAddress" name="object_List_file['+arr+'].OB_S_Address" placeholder="도로명주소">'+
		'</div>'+
		'<div class="3" style="margin-left: 5px;">'+
		'<p>지번주소</p>'+
		'<input type="text" class="sample4_jibunAddress" name="object_List_file['+arr+'].OB_B_Address" placeholder="지번주소">'+
		'<input class="tt" data-value='+one_v+' type="button" value="주소찾기">'+
		'</div>'+
		'<div class="4" style="margin-left: 5px;">'+
		'<p>층수</p>'+
		'<input type="text" id="floor" name="object_List_file['+arr+'].OB_Floor" placeholder="층수" style="width: 50px;" value="0">	'+
		'</div>'+
		'<div class="5" style="margin-left: 5px;">'+
		'<p>호수</p>'+
		'<input type="text" id="ho" name="object_List_file['+arr+'].OB_Ho" placeholder="호수" style="width: 50px;" value="0">'+
		'</div>'+
		'<span id="guide" style="color:#999;display:none"></span>'+
		'</div>'+
		'<br>'+
		'<div class="ob_address1" style="display: flex;">'+
		'<div class="1" style="margin-left: 5px;">'+
		'<p>보증금</p>'+
		'<input type="text" id="s4" name="object_List_file['+arr+'].OB_Deposit" placeholder="보증금" style="width: 80px;" value="0">'+
		'</div>'+
		'<div class="2" style="margin-left: 5px;">'+
		'<p>월세</p>'+
		'<input type="text" id="sam" name="object_List_file['+arr+'].OB_Month_Cost" placeholder="월세" style="width: 80px;" value="0">'+
		'</div>'+
		'<div class="3" style="margin-left: 5px;">'+
		'<p>권리금</p>'+
		'<input type="text" id="sampl" name="object_List_file['+arr+'].OB_Premium_Cost" placeholder="권리금" style="width: 80px;" value="0">'+
		'</div>'+
		'<div class="4" style="margin-left: 5px;">'+
		'<p>관리비</p>'+
		'<input type="text" id="floor" name="object_List_file['+arr+'].OB_Maintenance_Cost" placeholder="관리비" style="width: 80px;" value="0">'+
		'</div>'+
		'<div class="5" style="margin-left: 5px;">'+
		'<p>매매가</p>'+
		'<input type="text" id="ho" name="object_List_file['+arr+'].OB_Dealing_Cost" placeholder="부가세" style="width: 80px;" value="0">'+
		'</div>'+
		'<div class="1" style="margin-left: 5px;">'+
		'<p>연락처</p>'+
		'<input type="text" id="saAddress" name="object_List_file['+arr+'].OB_Lessor_Tel" placeholder="임대인" style="width: 100px;">'+
		'<input type="text" id="saAddress" name="object_List_file['+arr+'].OB_Tenant_Tel" placeholder="임차인" style="width: 100px; margin-left:5px;">'+
		'</div>'+
		'</div>'+
		'<br>'+
		'<div class="ob_address2" style="display: flex;">'+
		'<div class="1" style="margin-left: 5px;">'+
		'<p>특이사항</p>'+
		'<textarea id="sample4_ddress" name="object_List_file['+arr+'].OB_Content" placeholder="특이사항" style="width: 150px; height: 75px;"></textarea>'+
		'</div>'+
		'<div class="2" style="margin-left: 5px;">'+
		'<div class="2_1">'+
		'<p>이미지 업로드</p>'+
		'<input multiple="multiple" name="file_LIst['+arr+'].files" type="file" value="파일 찾기" style="width:200px;">'+
		'</div>'+
		'<div class=2_2 style="display: flex; margin-top:9px;">'+
		'<div class="5" style="margin-left: 5px;">'+
		'<p>평수</p>'+
		'<input type="text" id="ho" name="object_List_file['+arr+'].OB_Pyeong" placeholder="평수" style="width: 80px;" value="0">'+
		'</div>'+
		'<div class="5" style="margin-left: 5px;">'+
		'<p>M2</p>'+
		'<input type="text" id="ho" name="object_List_file['+arr+'].OB_M2" placeholder="M2" style="width: 80px;" value="0">'+
		'</div>'+
		'</div>'+
		'</div>'+
		'<div class="ts5">'+
		'<div class="tr" style="display: flex;">'+
		'<div class="1" style="margin-left: 5px;">'+
			'<p>종류</p>'+
			'<select name="object_List_file['+arr+'].OB_Kind">'+
			'<option '+oneroom+'>원룸</option>'+
			'<option '+tworoom +'>2룸</option>'+
			'<option '+threeroom +'>3룸</option>'+
			'<option '+vil +'>빌라</option>'+
			'<option '+art +'>아파트</option>'+
			'<option '+ofi +'>오피스텔</option>'+
			'<option '+shop +'>상가</option>'+
			'</select>'+
			'</div>'+
			
			'<div class="2" style="margin-left: 5px;">'+
			'<p>형태</p>'+
			'<select name="object_List_file['+arr+'].OB_Form" style="width: 80px;">'+
			'<option '+mo+' value="월세">월세</option>'+
			'<option '+de+' value="전세">전세</option>'+
			'<option '+mn+' value="매매">매매</option>'+
			'<option '+oj+' value="매매">전월</option>'+
			'</select>'+
			'</div>'+
			
			'<div class="3" style="margin-left: 5px;">'+
			'<p>구조</p>'+
			'<select name="object_List_file['+arr+'].OB_D_Kind" style="width: 80px;">'+
			'<option value="" selected disabled hidden>선택</option>'+
			select_opt+
			'</select>'+
			'</div>'+
			
			'<div class="4" style="margin-left: 5px;">'+
			'<p>구조</p>'+
			'<select name="object_List_file['+arr+'].OB_Type" style="width: 80px;">'+
			'<option value="" selected disabled hidden>선택</option>'+
			'<option>A타입</option>'+
			'<option>B타입</option>'+
			'<option>C타입</option>'+
			'<option>D타입</option>'+
			'</select>'+
			'</div>'+
			
			'</div>'+
			'<div class="ts" style="margin-left: 5px; margin-top:5px; display: flex;">'+
			'<div class="1" style="margin-left: 5px; margin-top:5px;">'+
			'<p>일자</p>'+
			'<input type="date" id="sampl" name="object_List_file['+arr+'].OB_Date" placeholder="일자" style="width: 120px;" value='+yyyy+'-'+mm+'-'+dd+'>'+
			'</div>'+
			'<div class="2" style="margin-left: 5px; margin-top:5px;">'+
			'<p>건물명</p>'+
			'<input type="text" id="sampl1" name="object_List_file['+arr+'].OB_Name" placeholder="건물명" style="width: 110px;">'+
			'</div>'+
			'<div>'+
			'</div>'+
		'</div>'+
		'</div>'+
		'</div>'+
	'</div>'+
	'<hr>'
	if(gvalue != null && okvalue != null){
		$(".oneroom").append(adddiv);	
		
	}
	k = +1;
	
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
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px;">
				<img alt="" src="resources/img/nlogo.JPG" style="width: 230px; height: 70px;">
	        
	        </div>
			
			
			
			
			
			
			<div class="content" style="width: 100%; height: 92%; display: flex;">
				
				
				
				<div class="object_list_content">
						  <form id = "form_submit" name="fileForm" action="object_insert" method="post" enctype="multipart/form-data">
						<div class="register_content">
						
							 <h3>물건정보</h3>
							 <hr>
							 <div class="test" style="display: flex;">
							 <div class="object_kind_select">
							 <span>거래 형태</span>&nbsp;&nbsp;
							 <span>
							 <button id="G1" type="button" name="Gestalt" value="o">월세</button>&nbsp;&nbsp;
							 <button id="G2" type="button" name="Gestalt" value="j">전세</button>&nbsp;&nbsp;
							 <button id="G3" type="button" name="Gestalt" value="m">매매</button>&nbsp;&nbsp;
							 <button name="add" type="button" style="margin-left: 300px;">물건추가</button>
							 <button name="ads" type="submit">물건등록</button>
							 </span>
							 <br>
							 <br>
							 <span class="object_kind_area">물건 종류&nbsp;&nbsp;
								<button id="OK1" type="button" name="kind" value="원룸">원룸</button>&nbsp;&nbsp;
								<button id="OK2" type="button" name="kind" value="투룸">투룸</button>&nbsp;&nbsp;
								<button id="OK3" type="button" name="kind" value="쓰리룸">쓰리룸</button>&nbsp;&nbsp;
								<button id="OK4" type="button" name="kind" value="빌라">빌라</button>&nbsp;&nbsp;
								<button id="OK5" type="button" name="kind" value="오피스텔">오피스텔</button>&nbsp;&nbsp;
								<button id="OK6" type="button" name="kind" value="아파트">아파트</button>&nbsp;&nbsp;
								<button id="OK7" type="button" name="kind" value="상가">상가</button>&nbsp;&nbsp;
							 </span>
								
							 	<hr>
							 </div>
					
						
					



				          </div>
				        
				          <div class="oneroom" data-value="0">
				          	
				          
				          </div>
					
						</div>
							</form>
			
				</div>
				
			</div>
			
			

		</div>
		
	</body>
</html>
