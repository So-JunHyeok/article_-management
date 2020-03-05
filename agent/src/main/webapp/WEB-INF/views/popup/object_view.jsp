<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/object_view.css">
<script src='resources/js/jquery-3.4.1.min.js'></script>
<script type="text/javascript">
var file_path = new Array();
var ob_path = new Array();
var bl_path = new Array();
var st = 0;
var ed = 9;
var count = 0;
var te = 0;
var len = 0;
var main_index = 1;
var max_in = 10;
var i_OB_Num = 0;
var img_add ="img";
var img_add_num;
















function for_img(){
	var sub = 1;
	var v;
	for(var k = st; k <= len; k++){
		
		v = "sub_"+sub;
		console.log(file_path[k])
		$('#'+v).attr("src", "resources/room_photo/"+file_path[k]);
		sub++;
	};
}


function main_img(){
	
var main_img = $('#sub_'+main_index).attr("src");
	$('.sub').css("border", "1px solid black");
	$('#sub_'+main_index).css("border", "1px solid blue");
	$('.main_img').attr("src", main_img);


	
}

function img_add_form(){
    var url = "../add_img?ob_num="+img_add_num;
    var name = "이미지 추가";
    var option = "width = 400, height = 400, left = 100, location = no"
    var openWin = window.open(url, name, option);		
}

$(document).ready(function(){
	
	var OB_Kind;
	var OB_S_Address;
	var OB_B_Address;
	var OB_Type;
	var OB_Num;
	
	OB_Kind = $('.OB_Kind').text();
	OB_S_Address = $('.OB_S_Address').text();
	OB_B_Address = $('.OB_B_Address').text();
	OB_Type = $('.OB_Type').text();
	OB_Num = $('.OB_Num').val();
	
	$('.move_r').click(function(){
		if(count >= len-1){alert("다음이미지가 없습니다.")}
		else{
			count++;
			if(main_index == max_in){
				$('.sub').attr("src", "");
				main_index = 1;
				st += 10;
				for_img()
				main_img()
			}else{
				main_index++;
				main_img()
			}
		}
	});
	
	$('.move_l').click(function(){
		if(count == 0){
			alert("이전이미지가 없습니다.")
		}else{
			count--;
			if(main_index == 1){
				$('.sub').attr("src", "");
				main_index = 10;
				st -=10;
				for_img()
				main_img()

			}else{
				main_index--;
				main_img()
			}
		}


	});
		
	var cont = 1;
	var path = "resources/room_photo/"

	
	$.ajax({
		type : "GET",	
		dataType : "json",
		url : "object_view_data",
		data : {ob_Num: OB_Num, ob_kind: OB_Kind, ob_type: OB_Type,
			ob_b_addr: OB_B_Address, ob_s_addr: OB_S_Address},
		success : function(data) {
				$.each(data, function(key, value){
					$.each(value, function(object, Object){
						ob_path
						file_path[te] = Object.file_path;
						te++;	
					});
				});
				len = file_path.length
				for_img()
				main_img()
		}	
	});	
});




</script>

<title>Insert title here</title>
</head>
<body>
	
	<div class="wrap">
			<div class="hearder" style="display: flex;">
				<div class="logoarea" style="width: 200px; height: 100%;">
					<img alt="" src="resources/img/nlogo.JPG">
				</div>
				
				<div class="img_add">
				 <input type="button" value="이미지 추가" onclick="img_add_form()">
				</div>
			</div>
			
		<div class="photo_area">
		
			<div class="main_photo">
				<img class="main_img" alt="" src="">
			</div>
			
			<div class="sub_photo">
				
				<div style="border: none;">
				<img class="move_l" alt="" src="resources/img/move1.png">
				</div>
			
				<div>
					<img class="sub" id=sub_1 alt="" src="">				
				</div>
				
				<div >
					<img class="sub" id=sub_2 alt="" src="">
				</div>
				
				<div>
					<img class="sub" id=sub_3 alt="" src="">
				</div>
				
				<div>
					<img class="sub" id=sub_4 alt="" src="">
				</div>
					
				<div>
					<img class="sub" id=sub_5 alt="" src="">
				</div>
				<div>
					<img class="sub"  id=sub_6 alt="" src="">				
				</div>
				
				<div>
					<img class="sub" id=sub_7 alt="" src="">
				</div>
				
				<div>
					<img class="sub" id=sub_8 alt="" src="">
				</div>
				
				<div>
					<img class="sub"  id=sub_9 alt="" src="">
				</div>
					
				<div>
					<img class="sub"  id=sub_10 alt="" src="">
				</div>
				
				<div class="move_r" style="border: none;">
				<img alt="" src="resources/img/move.png">
				</div>
				
			</div>
		
		</div>
		
		<div class="content_area">
			<div class="left_info">
				<div class="basic_info">
					<h4>- 기본정보 -</h4>
					<input class="OB_Num" type="hidden" value="${object.OB_Num}">
					<div style="display: flex;"><p>접수일자 :&nbsp;</p><p class="OB_Date">${object.OB_Date}</p></div>
					<div style="display: flex;"><p>건물명 :&nbsp; </p><p class="OB_Name">${object.OB_Name}</p></div>
					<div style="display: flex;"><p>종류 :&nbsp; </p><p class="OB_Kind">${object.OB_Kind}</p></div>
					<div style="display: flex;"><p>거래형태 :&nbsp; </p><p class="OB_Form">${object.OB_Form}</p></div>
					<div style="display: flex;"><p>동 :&nbsp; </p><p class="OB_Dong">${object.OB_Dong}</p></div>
					<div style="display: flex;"><p>층수 :&nbsp; </p><p class="OB_Floor">${object.OB_Floor}</p></div>
					<div style="display: flex;"><p>호수 :&nbsp; </p><p class="OB_Ho">${object.OB_Ho}</p></div>
					<div style="display: flex;"><p>평수 :&nbsp; </p><p class="OB_Pyeong">${object.OB_Pyeong}</p></div>
					<div style="display: flex;"><p>M2 :&nbsp; </p><p class="OB_M2">${object.OB_M2}</p></div>
					<div style="display: flex;"><p>거래여부 :&nbsp; </p><p class="OB_State">${object.OB_State}</p></div>
					<div style="display: flex;"><p>타입 :&nbsp; </p><p class="OB_Type">${object.OB_Type}</p></div>
				</div>
				

				
				
			</div>
			
			<div class="right_info">
			
				<div class="location_info">
					<h4>- 주소 -</h4>
					<p class="OB_B_Address">${object.OB_B_Address}</p>
					<p class="OB_S_Address">${object.OB_S_Address}</p>
				</div>
				
				<div class="cost_info">
				<h4>- 가치정보 -</h4>
					<table>
						<tr>
							<th>보증금</th>
							<th>월세</th>
							<th>관리비</th>
							<th>권리금</th>
							<th>매매가</th>
						</tr>
						<tr>
							<td class="OB_Deposit">${object.OB_Deposit}</td>
							<td class="OB_Month_Cost">${object.OB_Month_Cost}</td>
							<td class="OB_Maintenance_Cost">${object.OB_Maintenance_Cost}</td>
							<td class="OB_Premium_Cost">${object.OB_Premium_Cost}</td>
							<td class="OB_Dealing_Cost">${object.OB_Dealing_Cost}</td>
						</tr>
					</table>
				</div>
				
				<div class="con_info">
				<h4>- 기타-특이사항 -</h4>
				<div class="con_box">
				${object.OB_Content}
				
				</div>
				</div>
				
				
					<div class="tel_info">
					<h4>- 연락처 -</h4>
					<p class="OB_Lessor_Tel">${object.OB_Lessor_Tel}</p>
					<p class="OB_Tenant_Tel">${object.OB_Tenant_Tel}</p>
				</div>
			
			</div>
		
		
		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>
	
	
</body>
</html>