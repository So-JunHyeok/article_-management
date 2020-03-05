<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/building_list.css">
	 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	  <script src='resources/js/cookie.js'></script>
	
	
	
	
	
	
	
	<script type="text/javascript">
	
	var file_path = new Array();
	var st = 0;
	var ed = 9;
	var count = 0;
	var te = 0;
	var len = 0;
	var main_index = 1;
	var max_in = 10;
	var bl_kind = "";
	var up_num = 0;
	var bl_Num_img = "${BL_Num}";
	var s_index;
	var back;
	var col;
	var del_num;
	var search;
	var select;
	var state = "${state}";
	
	
			function list_sub(){
				$('.sub_list *').remove();
				var ob_b_adress = $('.b_adress').text();
				var ob_s_adress = $('.s_adress').text();
				$.ajax({
					type : "GET",	
					dataType : "json",
					url : "object_list_data",
					data : {ob_s: ob_s_adress, ob_b: ob_b_adress, state: state},
					success : function(data) {
		 				$.each(data, function(key, value){
		 					$.each(value, function(list_key, list_value){
 						var tr = "<tr>";
 						if(list_value.ob_State == '계약'){tr ="<tr class='td_tr1' style='background: #ffff00;'>";}
 							else if(list_value.ob_State == '보류'){tr ="<tr class='td_tr1' style='background: #f3dbdb;'>";}
 							else if(list_value.ob_State == '방문'){tr ="<tr class='td_tr1' style='background: #dbeef4;'>";}
 						else{tr = "<tr class='td_tr1' style='background: white;'>";}
 						var td = "<tr>";
 						var etd = "</tr>";
 						var ck = "<td><input class=ts type=checkbox name=d value="+list_value.ob_Num +"></td>"
 						var wnd = "<td>v</td>";
 						var OB_Num = "<td>"+list_value.ob_Num +"</td>";
 						var OB_Date_date = "<td>"+list_value.ob_Date+"</td>";
 						var OB_Kind = "<td>"+list_value.ob_Kind +"("+list_value.ob_D_Kind +")</td>";
 						var OB_Form = "<td>"+list_value.ob_Form  +"</td>";
 						var OB_Name = "<td>"+list_value.ob_Name  +"</td>";
						var OB_Dong = "<td>"+list_value.ob_Dong  +"</td>";
 						var OB_S_Address = "<td>"+list_value.ob_B_Address  +"</td>";
 						var OB_B_Address = "<td>"+list_value.ob_B_Address  +"</td>";
 						var OB_Floor = "<td>"+list_value.ob_Floor  +"</td>";
 						var OB_Ho = "<td>"+list_value.ob_Ho +"</td>";
 						var OB_Month_Cost = "<td>"+list_value.ob_Month_Cost +"</td>";
 						var OB_Premium_Cost = "<td>"+list_value.ob_Premium_Cost +"</td>";
 						var OB_Maintenance_Cost = "<td>"+list_value.ob_Maintenance_Cost  +"</td>";
 						var OB_Dealing_Cost = "<td>"+list_value.ob_Dealing_Cost + "</td>";
 						var OB_Pyeong = "<td>"+list_value.ob_Dealing_Cost  +"</td>";
  						var OB_M2 = "<td>"+list_value.ob_M2  +"</td>";
 						var OB_Content = "<td>"+list_value.ob_Content +"</td>";
 						var OB_Tel = "<td>"+list_value.ob_Lessor_Tel+"<br>"+ list_value.ob_Tenant_Tel +"</td>";
 						var OB_Deal_State ="<td>"+list_value.ob_Deal_State  +"</td>";					
						var view = "<td ><a onclick='nwindow()'>보기</a></td>";
 						$('.sub_list').append(tr+ck+ OB_Num + OB_Date_date + OB_Kind + OB_Form 
 								+ OB_Dong + OB_Name + OB_S_Address + OB_Floor + OB_Ho + OB_Month_Cost + OB_Premium_Cost 
 								+ OB_Maintenance_Cost + OB_Dealing_Cost + OB_Pyeong + OB_M2 +OB_Content + OB_Tel  +   "</tr>");
		 					});
		 				});
					 },				
					error : function(e) {console.log(e.responseText);}
				 });
			   }
			
	$(function(){
		var test = $('.td_tr').css("background-color");
			$('.td_tr').click(function(){
			$('.td_tr').css("background","white");
				$('.td_tr').css("color","black");
				$(this).css("background-color","#3d1261");
				$(this).css("color","white");
				
			});
		});
	
	
	function for_img(){
		var sub = 1;
		var v;
		for(var k = st; k <= len; k++){
			
			v = "sub_"+sub;
			$('#'+v).attr("src", "resources/room_photo/"+file_path[k]);
			sub++;
		};
	}
	
	function for_img_del(){
		var sub = 1;
		var v;
		for(var k = st; k < 10; k++){
			v = "sub_"+sub;
			$('#'+v).attr("src", "");
			sub++;
		};
		
	}
	
	
	function main_img(){
		
		var main_img = $('#sub_'+main_index).attr("src");
			$('.sub').css("border", "1px solid black");
			$('#sub_'+main_index).css("border", "1px solid blue");
			$('.main_img').attr("src", main_img);


			
		}
	

	

	
	
	
	
	$(document).on("click",".td_tr1",function(){
		$('.sub_list').children('tr').eq(s_index).css("background", back);
		$('.sub_list').children('tr').eq(s_index).css("color", col);

	
		s_index = $(this).index();

        var checkbox = $(this).find('td:first-child :checkbox');
        var checkbox_TF = checkbox.is(":checked");
   
       	if(checkbox_TF){
       		checkbox.prop("checked", false);
       	}else{
       		checkbox.prop("checked", true);
       	 	$("input[name=d]").prop("checked",false);
       		
       	}
	
	  	back = $('.sub_list').children('tr').eq(s_index).css('background');
	 	col = $('.sub_list').children('tr').eq(s_index).css('color');

	 	
	 	$('.sub_list').children('tr').eq(s_index).css('background-color','#ff7f00');
	 	$('.sub_list').children('tr').eq(s_index).css('color','white');
	});

	
	
	
	$(document).ready(function(){
		if(state == '계약off'){	$('.state_select').css("background","gainsboro");}
		if(state == '계약on'){	$('.state_select').css("background","yellow");}
		$('.state_select').text(state);
		
		setCookie("Name", "");

	
		var img_num = $('.Storage_Num').attr("data-value");
		te = 0;
		$.ajax({
		
			type : "GET",	
			dataType : "json",
			url : "building_img_data",
			data : {img_num: img_num},
			success : function(data) {
					$.each(data, function(key, value){
						console.log(key)
						console.log(value)
						$.each(value, function(object, Object){
							file_path[te] = Object.file_path;
							te++;
							
							
						});
		
					});
					for_img_del()
					len = file_path.length
					console.log(len)
					for_img()
					main_img()

			}
			


		
		});
		
		$('.img_type_bt').click(function(){
			main_index = 1;
			st = 0;
			te = 0;
			en = 0;
			count = 0;
			 var img_num = $('.Storage_Num').attr("data-value");
			 var Type = $(".Img_Type option:selected").text(); 
			 file_path = Array();
			 for_img_del()
			 te = 0;
				$.ajax({
					
					type : "GET",	
					dataType : "json",
					url : "building_img_data",
					data : {img_num: img_num, img_type: Type},
					success : function(data) {
							$.each(data, function(key, value){
								console.log(key)
								console.log(value)
								$.each(value, function(object, Object){
									file_path[te] = Object.file_path;
									te++;
									
									
								});
				
							});
						
							len = file_path.length
							console.log("d"+len)
							for_img()
							main_img()

					}
					


				
				});
				
			});
		
		$('.sub_img_rigth').click(function(){
			if(count >= len-1){
				alert("다음이미지가 없습니다.")
			}else{
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
		
		$('.sub_img_left').click(function(){
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
	
		
	});
	
	
	
	
	
	
	
	
	
	
	function search_bt_en(){
		if (window.event.keyCode == 13) {
			search = $('.search').val();
			select = $('.search_select option:selected').val();
			bl_kind = "search_b";
	        var url = "resources/test.jsp";
	        var name = "건물목록";
	        var option = "width = 700, height =1500, left = 1000, location = no";
	        var openWin = window.open(url, name, option);

		}

	}
	
	function search_bt(){
		
			search = $('.search').val();
			select = $('.search_select option:selected').val();
			bl_kind = "search_b";
	        var url = "resources/test.jsp";
	        var name = "건물목록";
	        var option = "width = 700, height =1500, left = 1000, location = no";
	        var openWin = window.open(url, name, option);

		

	}
	
	function m_search_bt(){
		search = $('.m_search').val();
		select = $('.m_search_select option:selected').val();
		bl_kind = "search_b";
        var url = "resources/test.jsp";
        var name = "건물목록";
        var option = "width = 700, height =1500, left = 1000, location = no";
        var openWin = window.open(url, name, option);
		
	}
	
	
	
	
	function insert_bL(){
		bl_kind = "insert"
        var url = "resources/test.jsp";
        var name = "건물등록";
        var option = "width = 700, height =1500, left = 1000, location = no";
        var openWin = window.open(url, name, option);	
	}
	
	
	function move_prev(){
	var prev_max = $('.customar_bt2').attr("data-value");
	var prev_num = $('#prev_bt').val()
		prev_max = Number(prev_max);
		prev_num = Number(prev_num);
		
		if(prev_num < prev_max){
			location.href = "building_nhn?Prev=Prev&Num="+prev_num+"&state="+state;
		}
		else{
			alert("이전건물정보가 없습니다.");
		}
	}
	
	
	function move_next(){
		var next_mim = $('.customar_bt2').attr("data-value1");
		var next_num = $('#next_bt').val()
		next_mim = Number(next_mim);
		next_num = Number(next_num);

			if(next_num > next_mim){
				
				location.href = "building_nhn?Next=Next&Num="+next_num+"&state="+state;
				
			}
			else{
				alert("다음건물정보가 없습니다.");
			}
	}
	
    function state_select(){
    	var temp_state = $('.state_select').text();
    	if(temp_state == "계약on"){
    		$('.state_select').text("계약off");

    		state = "계약off";

    	}
    	
    	if(temp_state == "계약off"){
    		$('.state_select').text("계약on");
    		state = "계약on";
    	}
		if(state == '계약off'){	$('.state_select').css("background","gainsboro");}
		if(state == '계약on'){	$('.state_select').css("background","yellow");}
    	/* location.href ="building_nhn?state="+state; */

    }
	
/* 	function search_check(){

		 search = $('.search').val();
		 search_select = $('.search_select').val();
		$.ajax({
			type : "GET",	
			url : "building_check",
			data : {"search" : search, "search_select" : search_select},
			success : function(data){
				if(data != "no"){
					alert("검색결과없음");
					location.href = "building_nhn";
					
				}
				else if(data == "ok"){
					location.href = "building_search?search_select="+search_select+"&search="+search;
				}
			
			}
		});		
	} */
	
	
	function update_form(){
		bl_kind = "update";
		up_num = $('.Storage_Num').attr("data-value");
        var url = "resources/test.jsp";
        var name = "건물등록";
        var option = "width = 700, height =1500, left = 1000, location = no";
        var openWin = window.open(url, name, option);
		
		
	}
	
	
	function bl_delete(){
		del_num = $('.Storage_Num').attr("data-value");

		var result = confirm("삭세하시겠습니까?");
		
		
		if(result){
			location.href = "bl_delete?del_num="+del_num;
		}
		else{
			
		}
		
		
	}
	
	function file_uplod(){
		bl_kind = "bl_img";
	    var url = "resources/test.jsp";
	    var name = "매물등록";
	    var option = "width = 700, height = 1000, left = 1000, location = no"
	    var openWin = window.open(url, name, option);	
	}
	
	
	
	
	
	
	</script>
	
		<script type="text/javascript">
		
		function foo(){
	    var floor = $('input[name=floor]').val();
	    var m2_min = $('input[name=m2_min]').val();
	    var m2_max = $('input[name=m2_max]').val();
	    var deposit_min = $('input[name=deposit_min]').val();
	    var deposit_max = $('input[name=deposit_max]').val();
	    var month_min = $('input[name=month_min]').val();
	    var month_max = $('input[name=month_max]').val();
	    var premium_min = $('input[name=premium_min]').val();
	    var premium_max = $('input[name=premium_max]').val();
	    var mcost_min = $('input[name=mcost_min]').val();
	    var mcost_max = $('input[name=mcost_max]').val();
	    
	    

		
		if(floor == ""){$('input[name=floor]').val(0);}	
		if(m2_min ==""){$('input[name=m2_min]').val(0);}		
		if(m2_max ==""){$('input[name=m2_max]').val(999999);}		
		if(deposit_min ==""){$('input[name=deposit_min]').val(0);}		
		if(deposit_max ==""){$('input[name=deposit_max]').val(999999);}		
		if(month_min ==""){$('input[name=month_min]').val(0);}		
		if(month_max ==""){$('input[name=month_max]').val(999999);}		
		if(premium_min ==""){$('input[name=premium_min]').val(0);}		
		if(premium_max ==""){$('input[name=premium_max]').val(999999);}		
		if(mcost_min ==""){$('input[name=mcost_min]').val(0);}		
		if(mcost_max ==""){$('input[name=mcost_max]').val(999999);}		
		
			
					
		}
		
		
		</script>
	
<!-- 	<script type="text/javascript">
/* $(document).on("click","#ajax_test", function(){
		$('.sub_list *').remove();
	
	var s_address = $(this).attr("data-value");
	var b_address = $(this).attr("data-value1");
	console.log("s변수=" + s_address)
	console.log("b변수=" + b_address)
		$.ajax({
			type : "GET",	
			dataType : "json",
			url : "sublist",
			data : {s_address: s_address, b_address: b_address},
			success : function(data) {
 				$.each(data, function(key, value){
 					$.each(value, function(list_key, list_value){
 						console.log(list_key, list_value)
 						var td = "<tr>";
 						var etd = "</tr>";
 						var wnd = "<td>v</td>";
 						var OB_Num = "<td>"+list_value.ob_Num +"</td>";
 						var OB_Date_date = "<td>"+list_value.ob_Date+"</td>";
 						var OB_Kind = "<td>"+list_value.ob_Kind +"</td>";
 						var OB_Form = "<td>"+list_value.ob_Form  +"</td>";
 						var OB_Name = "<td>"+list_value.ob_Name  +"</td>";
						var OB_Dong = "<td>"+list_value.ob_Dong  +"</td>";
 						var OB_S_Address = "<td>"+list_value.ob_B_Address  +"</td>";
 						var OB_B_Address = "<td>"+list_value.ob_B_Address  +"</td>";
 						var OB_Floor = "<td>"+list_value.ob_Floor  +"</td>";
 						var OB_Ho = "<td>"+list_value.ob_Ho +"</td>";
 						var OB_Month_Cost = "<td>"+list_value.ob_Month_Cost +"</td>";
 						var OB_Premium_Cost = "<td>"+list_value.ob_Premium_Cost +"</td>";
 						var OB_Maintenance_Cost = "<td>"+list_value.ob_Maintenance_Cost  +"</td>";
 						var OB_Dealing_Cost = "<td>"+list_value.ob_Dealing_Cost + "</td>";
 						var OB_Pyeong = "<td>"+list_value.ob_Dealing_Cost  +"</td>";
  						var OB_M2 = "<td>"+list_value.ob_M2  +"</td>";
 						var OB_Content = "<td>"+list_value.ob_Content +"</td>";
 						var OB_Tel = "<td>"+list_value.ob_Lessor_Tel+"<br>"+ list_value.ob_Tenant_Tel +"</td>";
 						var OB_Deal_State ="<td>"+list_value.ob_Deal_State  +"</td>";					




						
						var view = "<td ><a onclick='nwindow()'>보기</a></td>";
 						
 						$('.sub_list').append("<tr>"+ OB_Num + OB_Date_date + OB_Kind + OB_Form 
 								+ OB_Dong + OB_Name + OB_S_Address + OB_Floor + OB_Ho + OB_Month_Cost + OB_Premium_Cost 
 								+ OB_Maintenance_Cost + OB_Dealing_Cost + OB_Pyeong + OB_M2 +OB_Content + OB_Tel  +   "</tr>");
 						
 						console.log(OB_Name)
 					});
 				});


			
		},				
			error : function(e) {
                    console.log(e.responseText);
                }
	
});
		
}); */
	
</script> -->


	</head> 
	<body>
		
		<div class="wrap">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 98%; height: 75px; margin: 0 auto;" >
				<jsp:include page="/resources/header.jsp"></jsp:include>
	        
	        </div>
			
			
			
			
			
			
			<div class="content">
				
				<div class="Storage_Area">
				<div class="Storage_Title">
					<div class="d">
					  <div class="ds">	
					  	<div class="dss" style="display: flex;">
							<div class="Storage_Num" data-value="${BL_Num}"><h4>- ${object_list.BL_Num} -</h4></div>
							<div class="Storage_Num1" style="display: flex;">
							
							<h4>- ${object_list.BL_Name} -</h4>
							<select class="Img_Type">
							<c:forEach var="type_list" items="${BL_Type_List}" varStatus="status">
							<option>${type_list.BF_Type}</option>
							</c:forEach>
							</select>
							<button class="img_type_bt">보기</button>
							<button class="state_select" onclick="state_select()"></button>
								
							</div>
							<div class="custmar_name_h4">
									<h4>${object_list.BL_Tel}</h4>
								</div>
						 </div>	
						 
						 <div class="m_Customar_Name">
						 
						 <div class="m_customar_bt2" data-value="${BL_Max}" data-value1="${BL_Min}">
							<button id="prev_bt" onclick="move_prev()" value="${BL_Num}">이전</button>
							<button id="next_bt" onclick="move_next()" value="${BL_Num}">다음</button>
						</div>
						<div class="m_customar_bt3">
				
							<select class="m_search_select" name="search_select">
								<option value="s_adds">도로명</option>
								<option value="b_adds">번지명</option>
								<option value="name">건물명</option>
							</select>
							
							<input class="m_search" type="text">
							<input type="button" onclick="m_search_bt()" value="검색" style="margin-top: 3px; background: white; color: #0c2a3a; padding: 1px; font-weight: bold; height: 40px; width: 45px;">
					
						</div>
						 
						 
						 
						 
						 </div>
						 
						</div>	
							<div class="customar_bt1">
								<button onclick="insert_bL()">건물등록</button>
								<button onclick="update_form()">건물수정</button>
								<button onclick="bl_delete()">건물삭제</button>
								<button onclick="file_uplod()">사진편집</button>
								
	
							</div>
					
					</div>
					
					<div class="Customar_Name">
	
						<div class="customar_bt2" data-value="${BL_Max}" data-value1="${BL_Min}">
							<button id="prev_bt" onclick="move_prev()" value="${BL_Num}">이전</button>
							<button id="next_bt" onclick="move_next()" value="${BL_Num}">다음</button>
						</div>
						<div class="customar_bt3">
							
							<select class="search_select" name="search_select">
								<option value="s_adds">도로명</option>
								<option value="b_adds">번지명</option>
								<option value="name">건물명</option>
							</select>
							
							<input class="search" type="text" onkeyup="search_bt_en();">
							<button type="button" onclick="search_bt()" style="margin-top: 3px; background: white; color: #0c2a3a; padding: 1px; font-weight: bold; height: 30px; width: 60px;">검색</button>
						
						</div>
							
					</div>
					
					<div class="ob_list">

					
						<button onclick="list_sub()">건물매물 보기</button>
						
					</div>
				
				</div>
					<div class="buildig_content">
						<div class="b_img">
							<div class="b_img_area">
							<img class="main_img" alt="" src="">
							</div>
							<div class="b_subimg">
								
								<div class="sub_img_left" style="border: none;">
								<img src="resources/img/move1.png" style="height: 40px;">
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_1 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_2 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_3 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_4 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_5 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_6 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_7 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_8 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_9 alt="" src="">	
								</div>
								<div class="sub_img">
								<img class="sub" id=sub_10 alt="" src="">	
								</div>
								<div class="sub_img_rigth" style="border: none;">
								<img alt="" src="resources/img/move.png" style="height: 40px;">
								</div>
								
								
							</div>
						</div>
						<div class="b_con">
							<div class="b_con1">
							

									
									<table>
										<tr>
											<th>종류</th>
											<td>${object_list.BL_Use}</td>
										</tr>
										<tr>
											<th>동</th>
											<td>${object_list.BL_dong}</td>
										</tr>
										
										<tr>
											<th>도로명 주소</th>
											<td class="s_adress">${object_list.BL_S_Address}</td>
										</tr>
										
										<tr>
											<th>번지 주소</th>
											<td class="b_adress">${object_list.BL_B_Address}</td>
										</tr>
										
										<tr class="asd">
											<th>특이사항</th>
											<td><pre>${object_list.BL_Content}</pre></td>
										</tr>
										
									</table>
									
								</div>
								
									<div class="b_con2">
									
									
										<table  class="b_2">
										<tr>
											<th>준공연도</th>
											<td>${object_list.BL_Completion_Year}</td>
										</tr>
										<tr>
											<th>리모델링</th>
											<td>${object_list.BL_Remodeling}</td>
										</tr>
										<tr>
											<th>세대수</th>
											<td>${object_list.BL_N_of_H}세대</td>
										</tr>	
										<tr>
											<th>구조</th>
											<td>${object_list.BL_Structure}</td>
										</tr>
										<tr>
											<th>층수</th>
											<td>${object_list.BL_Total_Floor}층</td>
										</tr>
										<tr>
											<th>주차</th>
											<td>${object_list.BL_Parking}대</td>
										</tr>
										<tr>
											<th>엘리베이터</th>
											<td>${object_list.BL_Elevator}대</td>
										</tr>
										<tr>
											<th>냉난방</th>
											<td>${object_list.BL_Climatisation}</td>
										</tr>
										
										<tr>
											<th>지하철역</th>
											<td>${object_list.BL_Subway}</td>
										</tr>
										
										<tr>
											<th>건축면적(m2)</th>
											<td>${object_list.BL_Surface}㎡</td>
										</tr>

										
										<tr>
											<th>연면적(m2)</th>
											<td>${object_list.BL_Total_area}㎡</td>
										</tr>
										
										<tr>
											<th>용적율</th>
											<td>${object_list.BL_Floor_Area_Ratio}%</td>
										</tr>
										
										<tr>
											<th>건폐율</th>
											<td>${object_list.BL_Building_Ratio}%</td>
										</tr>

										

										
										</table>
							</div>

									
							
							<div class="b_con3">
										<table>
										<tr class="fuse">
											<th>층별용도</th>
											<td><pre>${object_list.BL_Floor_use}</pre></td>
										</tr>

										<tr>
											<th>지목</th>
											<td>${object_list.BL_Land_Purpose}</td>
										</tr>
										<tr>
											<th>용도지역</th>
											<td>${object_list.BL_Use_District}</td>
										</tr>
										<tr>
											<th>용도지구</th>
											<td>${object_list.BL_Specific_Use}</td>
										</tr>
										<tr>
											<th>인접도로</th>
											<td>${object_list.BL_Road}</td>
										</tr>
										
										<tr>
											<th>대지면적(m2)</th>
											<td>${object_list.BL_Plottage}㎡</td>
										</tr>
										


										
										</table>
							</div>
							
						
							</div>
							


				<!-- 모바일 테이블 -->



					<div class="b_con_m">
						<div class="b_con1_m">
						
						<table>
							<tr>
											<th>종류</th>
											<td>${object_list.BL_Use}</td>	
											<th>동</th>
											<td>${object_list.BL_dong}</td>																		
							</tr>
						
						
							<tr>
											<th>준공연도</th>
											<td>${object_list.BL_Completion_Year}</td>										
											<th>리모델링</th>
											<td>${object_list.BL_Remodeling}</td>																		
							</tr>
						
						
							<tr>
											<th>구조</th>
											<td>${object_list.BL_Structure}</td>
											<th>층수</th>
											<td>${object_list.BL_Total_Floor}층</td>																		
							</tr>
						
						
							<tr>
											<th>주차</th>
											<td>${object_list.BL_Parking}대</td>	
											<th>엘리베이터</th>
											<td>${object_list.BL_Elevator}대</td>																	
							</tr>
						
						
							<tr>
											<th>냉난방</th>
											<td>${object_list.BL_Climatisation}</td>
											<th>지하철역</th>
											<td>${object_list.BL_Subway}</td>																		
							</tr>
						
						
							<tr>
											<th>건축면적(m2)</th>
											<td>${object_list.BL_Surface}㎡</td>		
											<th>연면적(m2)</th>
											<td>${object_list.BL_Total_area}㎡</td>																
							</tr>
						
						
							<tr>
											<th>용적율</th>
											<td>${object_list.BL_Floor_Area_Ratio}%</td>
											<th>건폐율</th>
											<td>${object_list.BL_Building_Ratio}%</td>																		
							</tr>
						
						
							<tr>
											<th>지목</th>
											<td>${object_list.BL_Land_Purpose}</td>	
											<th>대지면적(m2)</th>
											<td>${object_list.BL_Plottage}㎡</td>																	
							</tr>
						
						
							<tr>
											<th>용도지역</th>
											<td>${object_list.BL_Use_District}</td>	
											<th>용도지구</th>
											<td>${object_list.BL_Specific_Use}</td>																	
							</tr>
						
						
							<tr>
											<th>인접도로</th>
											<td>${object_list.BL_Road}</td>
											<th>세대수</th>
											<td>${object_list.BL_N_of_H}세대</td>											
							</tr>
							
						</table>
						
						</div>
						
						<div class="b_con2_m">
							
							<table>
										<tr>
											<th>도로명 주소</th>
											<td class="s_adress_m">${object_list.BL_S_Address}</td>
										</tr>
										
										<tr>
											<th>번지 주소</th>
											<td class="b_adress_m">${object_list.BL_B_Address}</td>
										</tr>
										
										<tr class="asd">
											<th>특이사항</th>
											<td><pre>${object_list.BL_Content}</pre></td>
										</tr>
										
										<tr class="fuse">
											<th>층별용도</th>
											<td><pre>${object_list.BL_Floor_use}</pre></td>
										</tr>																				
							</table>
						
						</div>
					
					
					</div>



















						
						</div>
					
					
					
					</div>
					
					
					
					<div class="s_list">
						<div class="s_list_title">
						<table class="s_table">
							<colgroup>
				        		<!-- 공통 -->
				        			
				        			<col width="15px"/><!-- 체크 -->
				        			<col width="40px"/><!-- 번호 -->
				        			<col width="80px"/><!-- 접수일자 -->
				        			<col width="100px"/><!-- 종류 -->
				        			<col width="50px"/><!-- 전월세 -->
				        			
				        			<col width="60px"/><!-- 동 -->
				        			
				        			<col width="150px"/><!-- 건물업체명 -->
				        			<col width="280px"/><!-- 주소 -->
				        			<col width="50px"/><!-- 호수 -->
				        			<col width="40px"/><!-- 층수 -->
				        			
				        			<col width="60px"/><!-- 면적 -->
				        			<col width="80px"/><!-- 보증금 -->
				        			<col width="80px"/><!-- 월세 -->
				        			
				         			<col width="80px"/><!-- 관리비 -->   
				         		
				         		
				        			<col width="80px"/><!-- 권리금 -->
				        			
				        			
				        			<col width="80px"/><!-- 매매가 -->
				        		
				        			
				        			<col width="*"/><!-- 상세내용 -->
				        			<col width="170px"/><!-- 전화번호 -->
				        		
				        	</colgroup>
				        		<thead>
				        		<tr class="th_tr">
							 		<th scope="col"></th>
							 		<th scope="col">번호</th>
							 		<th scope="col">접수일자</th>
							 		<th scope="col">종류</th>
							 		<th scope="col">전월세</th>
							 		<th scope="col">동</th>
							 		<th scope="col">건물/업체명</th>
							 		
							
							
							
							 		<th scope="col">${address} 주소</th>
							 		
							 		
							 		
							 		<th scope="col">층수</th>
							 		<th scope="col">호수</th>
							 		
							 		<th scope="col">면적</th>
							 		
							 		<th scope="col">보증금</th>
							 		<th scope="col">월세</th>
							 		<th scope="col">관리비</th>

							 	
							 		<th scope="col">권리금</th>
							 	
							 		
							 		<th scope="col">매매가</th>
							 	

							 		<th scope="col">상세내용</th>
							 		<th scope="col">전화번호</th>
							 
							 	</tr>
							 	</thead>


										
							</table>
							</div>		
							
							<div class="s_list_content">
								<table class="s_table">
															<colgroup>
				        		<!-- 공통 -->
				        			<col width="15px"/><!-- 체크 -->
				        			<col width="40px"/><!-- 번호 -->
				        			<col width="80px"/><!-- 접수일자 -->
				        			<col width="100px"/><!-- 종류 -->
				        			<col width="50px"/><!-- 전월세 -->
				        			
				        			<col width="60px"/><!-- 동 -->
				        			
				        			<col width="150px"/><!-- 건물업체명 -->
				        			<col width="280px"/><!-- 주소 -->
				        			<col width="50px"/><!-- 호수 -->
				        			<col width="40px"/><!-- 층수 -->
				        			
				        			<col width="60px"/><!-- 면적 -->
				        			<col width="80px"/><!-- 보증금 -->
				        			<col width="80px"/><!-- 월세 -->
				        			
				         			<col width="80px"/><!-- 관리비 -->   
				         		
				         			
				        			<col width="80px"/><!-- 권리금 -->
				        		
				        			
				        			<col width="80px"/><!-- 매매가 -->
				        		
				        			
				        			<col width="*"/><!-- 상세내용 -->
				        			<col width="170px"/><!-- 전화번호 -->
				        	</colgroup>

							 	<tbody class="sub_list">
							 	
							 	
							 	</tbody>
									
									
									
							 	</table>
							</div>									
					</div>
					
					
					
					
					
					
					
					
					
					
				</div>
				
				
				
				
						

				
			</div>
			
			

		</div>
		
	</body>
</html>