<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/building_insert.css">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>	
  <script src='resources/js/jquery-3.4.1.min.js'></script>
<script type="text/javascript">

function popup_la(){
    var url = "succes.jsp";
    var name = "상세보기";
    var option = "width = 300, height = 100, left = 1000, location = no"
    var openWin = window.open(url, name, option).close();

}


function insert_check(){
	
	
	var b_address = $('input[name=BL_B_Address]').val();
	var s_address = $('input[name=BL_S_Address]').val();
	var name = $('input[name=BL_Name]').val();
	var total_area = $('input[name=BL_Total_area]').val();
	var surface = $('input[name=BL_Surface]').val();
	var fa_ratio = $('input[name=BL_Floor_Area_Ratio]').val();
	var b_ratio = $('input[name=BL_Building_Ratio]').val();
	var c_year = $('input[name=BL_Completion_Year]').val();
	var total_floor = $('input[name=BL_Total_Floor]').val();
	var n_of_h = $('input[name=BL_N_of_H]').val();
	var plottage = $('input[name=BL_Plottage]').val();
	
	
	var check_bt = "";
	var r_num;
	var result = 0;
	var arry = new Array(total_area, surface, fa_ratio, b_ratio, c_year, total_floor, n_of_h, plottage);

	
	for(var i = 0; i < 8; i++){
	var	N_or_S = isNaN(arry[i]);
		if(N_or_S == true){
			result = 1;
			break;
		}
		if(N_or_S == ""){
			result = 2;
		}
	}
	
	if(result == 1){
		alert("준공연도, 연면적, 건축면적, 용적율 건페율 총층, 세대수, 대지면적은 숫자만 입력하세요");
		return false;
	}
	
		
		$.ajax({
			type : "GET",	
			url : "/agent/insert_check",
			data : {"b_address" : b_address, "s_address" : s_address, "name" : name},
			success : function(data){
				alert(data);
				if(data == "n"){
					return false;
					alert("건물명이 중복됩니다.");
					
				}
				else if(data == "b"){
					return false;
					alert("번지명이중복됩니다.");

					
				}
				else if(data == "s"){
					return false;
					alert("도로명이중복됩니다.");
					
				}
				else if(data == "ok"){
					return true;

					
					
					
				}
			
			}
	
		

		});		
		
		
		
	
		return false;

	


}

</script>



</head>
<body>

<div class="wrap">
	<div class="header" style="display: flex;">
		<div class="header_left">
		<img alt="" src="resources/img/nlogo.JPG" style="width: 200px; height: 70px;">
		</div>

		

	</div>
	
	<div class="content">
		<form action="bl_update" name="formt" enctype="multipart/form-data" method="post">
		<div class="basic_info" style="display: flex;">
			
			<input type="hidden" name="num" value="${list.BL_Num}">
			
			<div class="basic_info_1" style="width: 20%;">
			<p>건물명</p>
			<input type="text" name="BL_Name" placeholder="건물명" style="width: 90%; height: 30px;" value="${list.BL_Name}">
			</div>
			<div class="basic_info_2" style="width: 35%;">
			<p>도로명 주소</p>
			<input type="text" name="BL_S_Address" placeholder="도로명" style="width: 90%; height: 30px;" value="${list.BL_S_Address}">
			</div>
			<div class="basic_info_3" style="width: 35%;">
			<p>번지명 주소</p>
			<input type="text" name="BL_B_Address" placeholder="번지명" style="width: 90%; height: 30px;" value="${list.BL_B_Address}">
			</div>
			<div class="basic_info_4" style="width: 10%; display: flex;">
			<input class="tt" type="button" value="주소찾기">
			</div>
		</div>	
		
		<div class="use_info" style="display: flex;">
			<div class="use_info_0" style="width: 17%;">
			<p>동</p>
			<input type="text" name="BL_dong" placeholder="동" style="width: 90%; height: 30px;" value="${list.BL_dong}">
			</div>
			<div class="use_info_1" style="width: 17%;">
			<p>준공연도</p>
			<input type="text" name="BL_Completion_Year" placeholder="준공연도" style="width: 90%; height: 30px;" value="${list.BL_Completion_Year}">
			</div>
			<div class="use_info_2" style="width: 17%;">
			<p>건물용도</p>
			<input type="text" name="BL_Use" placeholder="건물용도" style="width: 90%; height: 30px;" value="${list.BL_Use}">
			</div>
			<div class="use_info_3" style="width: 32%;">
			<p>리모델링</p>
			<input type="text" name="BL_Remodeling" placeholder="리모델링" style="width: 90%; height: 30px;" value="${list.BL_Remodeling}">
			</div>
			<div class="use_info_4" style="width: 17%;">
			<p>구조</p>
			<input type="text" name="BL_Structure" placeholder="구조" style="width: 90%; height: 30px;" value="${list.BL_Structure}">
			</div>
	
		</div>
			
		<div class="attr1_info" style="display: flex;">		
			<div class="attr1_info_1" style="margin-left: 5px; width: 20%;">
			<p>연면적</p>
			<input type="text" name="BL_Total_area" placeholder="연적면" value="${list.BL_Total_area}">
			</div>			
			<div class="attr1_info_2" style="width: 20%;">
			<p>건축면적</p>
			<input type="text" name="BL_Surface" placeholder="건축면적" value="${list.BL_Surface}">
			</div>			
			<div class="attr1_info_3" style="width: 20%;">
			<p>용적율</p>
			<input type="text" name="BL_Floor_Area_Ratio" placeholder="용적율" value="${list.BL_Floor_Area_Ratio}">
			</div>			
			<div class="attr1_info_4" style="width: 20%;">
			<p>건페율</p>
			<input type="text" name="BL_Building_Ratio" placeholder="건페율" value="${list.BL_Building_Ratio}">
			</div>
			<div class="attr1_info_5" style="width: 20%;">
			<p>위반건축여부</p>
			<input type="text" name="BL_Violation" placeholder="위반건물여부" value="${list.BL_Violation}">
			</div>			
		
		</div>
		
		<div class="attr2_info" style="display: flex;">
			<div class="attr2_info_1" style="width: 10%;">
			<p>총층</p>
			<input type="text" name="BL_Total_Floor" placeholder="총층" style="width: 90%; height: 30px;" value="${list.BL_Total_Floor}">
			</div>
			<div class="attr2_info_2" style="width: 10%;">
			<p>세대수</p>
			<input type="text" name="BL_N_of_H" placeholder="세대수" style="width: 90%; height: 30px;" value="${list.BL_N_of_H}">
			</div>
			<div class="attr2_info_3" style="width: 20%;">
			<p>주차</p>
			<input type="text" name="BL_Parking" placeholder="주차" style="width: 90%; height: 30px;" value="${list.BL_Parking}">
			</div>
			<div class="attr2_info_4" style="width: 20%;">
			<p>엘리베이터</p>
			<input type="text" name="BL_Elevator" placeholder="엘레베이터" style="width: 90%; height: 30px;" value="${list.BL_Elevator}">
			</div>
			<div class="attr2_info_5" style="width: 20%;">
			<p>냉난방</p>
			<input type="text" name="BL_Climatisation" placeholder="냉난방" style="width: 90%; height: 30px;" value="${list.BL_Climatisation}">
			</div>
			<div class="attr2_info_6" style="width: 20%;">
			<p>지하철역</p>
			<input type="text" name="BL_Subway" placeholder="지하철역" style="width: 90%; height: 30px;" value="${list.BL_Subway}">
			</div>

		</div>
		
		<div class="attr3_info" style="display: flex;">

			<div class="attr3_info_1" style="width: 20%;">
			<p>지목</p>
			<input type="text" name="BL_Land_Purpose" placeholder="지목" style="width: 90%; height: 30px;" value="${list.BL_Land_Purpose}">
			</div>
			<div class="attr3_info_2" style="width: 20%;">
			<p>용도지역</p>
			<input type="text" name="BL_Use_District" placeholder="용도지역" style="width: 90%; height: 30px;" value="${list.BL_Use_District}">
			</div>
			<div class="attr3_info_3" style="width: 20%;">
			<p>용도지구</p>
			<input type="text" name="BL_Specific_Use" placeholder="용도지구" style="width: 90%; height: 30px;" value="${list.BL_Specific_Use}">
			</div>
			<div class="attr3_info_4" style="width: 20%;">
			<p>인접도로</p>
			<input type="text" name="BL_Road" placeholder="인접도로" style="width: 90%; height: 30px;" value="${list.BL_Road}">
			</div>
			<div class="attr3_info_5" style="width: 20%;">
			<p>대지면적</p>
			<input type="text" name="BL_Plottage" placeholder="대지면적" style="width: 90%; height: 30px;" value="${list.BL_Plottage}">
			</div>
		</div>
		<div class="attr_content" style="display: flex;">
		
		<div style="width: 33%;">
		<p style="margin-left: 5px;">특이사항</p>
		<textarea rows="15" cols="30" name="BL_Content" style="margin-left: 5px;">${list.BL_Content}</textarea>
		</div>
		
		<div style="width: 33%;">
		<p style="margin-left: 5px;">층별용도</p>
		<textarea rows="15" cols="30" name="BL_Floor_use" style="margin-left: 5px;">${list.BL_Floor_use}</textarea>
		</div>
		
		<div style="margin-left: 10px; width: 31%">
			<p>전화번호</p>
			<input type="text" name="BL_Tel" placeholder="전화번호" style="width: 98%; height: 30px;" value="${list.BL_Tel}">
			<br>
			<br>
			
		<!-- 	<p>이미지 업로드</p>
			<input multiple="multiple" name="files" type="file" value="파일 찾기" style="width:200px;">
 -->
		</div>	
		
		
		</div>
		<input class="su_bt1" type="submit" name="submit" style="margin-left: 5px;" value="수정">
		</form>
		</div>
		

		
	
		
	</div>












</div>


</body>
</html>