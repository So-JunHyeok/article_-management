<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/building_insert.css">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>	
  <script src='js/jquery-3.4.1.min.js'></script>
<script type="text/javascript">

$(document).ready(function() {
	
	var OB_Num;
	var OB_Kind;
	var OB_Form;
	var OB_Name;
	var OB_S_Address;
	var OB_B_Address;
	var OB_Floor;
	var OB_Ho;
	var OB_Month_Cost;
	var OB_Deposit;
	var OB_Premium_Cost;
	var OB_Maintenance_Cost;
	var OB_Dealing_Cost;
	var OB_Pyeong;
	var OB_M2;
	var OB_Content;
	var OB_Lessor_Tel;
	var OB_Tenant_Tel;
	var OB_Deal_State;
	var OB_Dong;
	var OB_D_Kind;
	var OB_Surtax;
	var OB_State;
	var OB_Type;
	
	
	var up_num = window.opener.up_num;
	$.ajax({
		type : "GET",	
		url : "../update_form",
		data : {'Ob_num' : up_num},
		success : function(data) {
			$.each(data, function(key, value){
				console.log(key, value)
				 OB_Num = value.ob_Num;
				 OB_Kind = value.ob_Kind;
				 OB_Form = value.ob_Form;
				 OB_Name = value.ob_Name;
				 OB_S_Address = value.ob_S_Address;
				 OB_B_Address = value.ob_B_Address;
				 OB_Floor = value.ob_Floor;
				 OB_Ho = value.ob_Ho;
				 OB_Month_Cost = value.ob_Month_Cost;
				 OB_Deposit = value.ob_Deposit;
				 OB_Premium_Cost = value.ob_Premium_Cost;
				 OB_Maintenance_Cost = value.ob_Maintenance_Cost;
				 OB_Dealing_Cost = value.ob_Dealing_Cost;
				 OB_Pyeong = value.ob_Pyeong;
				 OB_M2 = value.ob_M2;
				 OB_Content = value.ob_Content;
				 OB_Lessor_Tel = value.ob_Lessor_Tel;
				 OB_Tenant_Tel = value.ob_Tenant_Tel;
				 OB_Deal_State = value.ob_Deal_State;
				 OB_Dong = value.ob_Dong;
				 OB_D_Kind = value.ob_D_Kind;
				 OB_Surtax = value.ob_Surtax;
				 OB_State = value.ob_State;
				 OB_Type = value.ob_Type;
				$("select[name=OB_Kind]").val(OB_Kind).attr("selected", "true");
				$("select[name=OB_D_Kind]").val(OB_D_Kind).attr("selected", "true");
				$("select[name=OB_Form]").val(OB_Form).attr("selected", "true");
				$("select[name=OB_State]").val(OB_State).attr("selected", "true");
				$("input[name=OB_Dong]").val(OB_Dong);
				$("input[name=OB_S_Address]").val(OB_S_Address);
				$("input[name=OB_B_Address]").val(OB_B_Address);
				$("input[name=OB_Name]").val(OB_Name);
				$("input[name=OB_Floor]").val(OB_Floor);
				$("input[name=OB_Ho]").val(OB_Ho);
				$("input[name=OB_Month_Cost]").val(OB_Month_Cost);
				$("input[name=OB_Deposit]").val(OB_Deposit);
				$("input[name=OB_Premium_Cost]").val(OB_Premium_Cost);
				$("input[name=OB_Maintenance_Cost]").val(OB_Maintenance_Cost);
				$("input[name=OB_Dealing_Cost]").val(OB_Dealing_Cost);
				$("input[name=OB_Pyeong]").val(OB_Pyeong);
				$("input[name=OB_M2]").val(OB_M2);				
				$("input[name=OB_Lessor_Tel]").val(OB_Lessor_Tel);
				$("input[name=OB_Tenant_Tel]").val(OB_Tenant_Tel);
				$("input[name=OB_Deal_State]").val(OB_Deal_State);
				$("input[name=OB_Num]").val(OB_Num);
				$("input[name=OB_Type]").val(OB_Type);
				$("#text_a").text(OB_Content);
			

				 
				 
				 
				 
			});
		}
		});




});

function popup_la(){
    var url = "succes.jsp";
    var name = "상세보기";
    var option = "width = 300, height = 100, left = 1000, location = no"
    var openWin = window.open(url, name, option).close();

}



function object_update(){
	var queryString = $("form[name=formt]").serialize();
	var ss = "no";
	if(ss == "no"){
	$.ajax({
		type : "GET",	
		url : "../object_update",
		data : queryString,
		
		});
		ss = "ok";
	}
	
	if(ss == "ok"){
		popup_la();
		opener.location.reload(true);
		window.close();
		
	}
	
		

	 
};
</script>



</head>
<body>

<div class="wrap">
	<div class="header" style="display: flex;">
		<div class="header_left">
		<img alt="" src="img/nlogo.JPG" style="width: 200px; height: 70px;">
		</div>
		

	</div>
	
	<div class="content">
		<form action="../object_update" name="formt">
		<input type="hidden" name="OB_Num">
		<div class="use_info" style="display: flex;">
			<div class="use_info_1">
			<p>종류</p>
			<select name="OB_Kind">
				<option>원룸</option>
				<option>2룸</option>
				<option>3룸</option>
				<option>빌라</option>
				<option>아파트</option>
				<option>오피스텔</option>
				<option>상가</option>
				<option>상가+주택</option>
			</select>
			</div>
			&nbsp;
			<div class="use_info_2">
			
			<p>세부종류</p>
			<select style="width: 100px;" name="OB_D_Kind">
			
			<option>원룸</option>
			<option>1.5룸</option>
			<option>2룸</option>
			<option>3룸</option>
			<option>4룸</option>
			<option>복층형</option>
			<option>오픈형</option>
			<option >분리형</option>
			
			</select>
			</div>
			&nbsp;
			<div class="use_info_3">
			<p>형태</p>
			<select style="width: 80px;" name="OB_Form">
			
			<option>월세</option>
			<option>전세</option>
			<option>매매</option>
			<option>전월</option>
			
			</select>
			</div>
			&nbsp;
			<div class="use_info_4">
			<p>건물명</p>
			<input type="text" name="OB_Name" placeholder="용도지역" style="width: 130px">
			</div>
		</div>
		
		
		
		
		<div class="basic_info" style="display: flex;">
			<div class="basic_info_1">
			<p>동</p>
			<input type="text" name="OB_Dong" placeholder="동" style="width: 100px;">
			</div>
			
			<div class="basic_info_2">
			<p>도로명 주소</p>
			<input type="text" name="OB_S_Address" placeholder="도로명" style="width: 150px;">
			</div>
		
			<div class="basic_info_3">
			<p>번지명 주소</p>
			<input type="text" name="OB_B_Address" placeholder="번지명" style="width: 150px;">
			</div>
			&nbsp;
			<input class="tt" type="button" value="주소찾기">
		</div>	
					
		<div class="attr1_info" style="display: flex;">
			<div class="attr1_info_1" style="margin-left: 5px;">
			<p>월세</p>
			<input type="text" name="OB_Month_Cost" placeholder="월세">
			</div>			
			<div class="attr1_info_2">
			<p>보증금</p>
			<input type="text" name="OB_Deposit" placeholder="보증금">
			</div>			
			<div class="attr1_info_3">
			<p>권리금</p>
			<input type="text" name="OB_Premium_Cost" placeholder="권리금">
			</div>			
			<div class="attr1_info_4">
			<p>매매가</p>
			<input type="text" name="OB_Dealing_Cost" placeholder="매매가">
			</div>			
			<div class="attr1_info_5">
			<p>관리비</p>
			<input type="text" name="OB_Maintenance_Cost" placeholder="관리비">
			</div>			
		
		</div>
		
		<div class="attr2_info" style="display: flex;">
			<div class="attr2_info_1">
			<p>층수</p>
			<input type="text" name="OB_Floor" placeholder="층수" style="width: 50px;">
			</div>
			<div class="attr2_info_2">
			<p>호수</p>
			<input type="text" name="OB_Ho" placeholder="호수" style="width: 50px;">
			</div>
			<div class="attr2_info_3">
			<p>평수</p>
			<input type="text" name="OB_Pyeong" placeholder="평수" style="width: 100px;">
			</div>
			<div class="attr2_info_4">
			<p>m2</p>
			<input type="text" name="OB_M2" placeholder="m2" style="width: 100px;"">
			</div>
			<div class="attr2_info_5">
			<p>이미지 업로드</p>
			<input multiple="multiple" name="bl_filelist" type="file" value="파일 찾기" style="width:200px;">
			</div>	
		</div>
		
		<div class="attr3_info" style="display: flex;">
			<div class="attr3_info_1">
			<p>임대인</p>
			<input type="text" name="OB_Lessor_Tel" placeholder="전화번호" style="width: 100px;">
			</div>
			<div class="attr3_info_2">
			<p>임차인</p>
			<input type="text" name="OB_Tenant_Tel" placeholder="전화번호" style="width: 100px;">
			</div>
			<div class="attr3_info_2">
			<p>계약형태</p>
			<select style="width: 100px;" name="OB_State">
			
			<option>0</option>
			<option>방문</option>
			<option>보류</option>
			<option>계약</option>
			<option></option>
			
			</select>
			</div>
			
			<div class="attr3_info_3">
			<p>타입</p>
		    <input type="text" name="OB_Type" placeholder="타입" style="width: 120px;">
			</div>
			
		</div>
		<div class="attr_content">
		<p style="margin-left: 5px;">특이사항</p>
		<textarea id="text_a" rows="10" cols="70" name="OB_Content" style="margin-left: 5px;"></textarea>
		<input type="submit" style="margin-left: 5px;" value="수정">
		</div>
		</form>
		</div>
		

		
	
		
	</div>












</div>


</body>
</html>