<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



    
<html>
	<head>
	<link rel="stylesheet" href="resources/css/object_list.css">
	 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>	
	  <script src='resources/js/cookie.js'></script>

	
	
	
	
	
	
	
	<script type="text/javascript">

	
	
	var v_OB_Num = "";
	var v_OB_Date = "";
	var v_OB_Kind = "";
	var v_OB_Form = "";
	var v_OB_Name = "";
	var v_OB_S_Address = "";
	var v_OB_B_Address = "";
	var v_OB_Floor = "";
	var v_OB_Ho = "";
	var v_OB_Month_Cost = "";
	var v_OB_Deposit = "";
	var v_OB_Premium_Cost = "";
	var v_OB_Maintenance_Cost = "";
	var v_OB_Dealing_Cost = "";
	var v_OB_Pyeong = "";
	var v_OB_M2 = "";
	var v_OB_Content = "";
	var v_OB_Lessor_Tel = "";
	var v_OB_Tenant_Tel = "";
	var v_OB_Dong = "";
	var v_OB_State = "";
	var v_OB_Type = "";
	var v_index;
	var s_index;
	var back;
	var col;
	var pag_num = "${PagNum}";
	var temp = new Array();
	var willCookie = "";
	var state = "${state}";
	var m_value = "${m_value}";
	var pag_n = "";
	var Startpage = "";
	var list_filter = "${list_filter}";

	
	
	//전역변수
	var test = new Array();
	var index = 0;
	var up_num;
	var ob_p_kind;
	var select_op = "${ListOption}";
	var select_op_s = "${ListOption}";

	
	
    var date = new Date();

  

	
	
	
	
	//선택된 매물 번호를 가지고 와서 test 배열이 담는다.
		function checked_in(){
		$("input[name=d]:checked").each(function() {
			test[index] = $(this).val();
			index ++;
		});
		$("input[name=ba]:checked").each(function() {
			test[index] = $(this).val();
			index ++;
		});
		var co = getCookie("Name");
		var add_co ="";

		if(test != ""){
			
			if(co == ""){
				
				setCookie("Name", test);
			}
			else{
				add_co = co + "," + test;
				setCookie("Name", add_co);
				/* document.cookie += "," +test; */	
			}
			
		}
		

	}


	    var getCookie = function(name) {
	        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	        return value? value[2] : null;
	    };


	    var setCookie = function(name, value, day) {
	        document.cookie = name + '=' + value;
	    };

	

	
	//새 스토리지를 만들고 선택된 매물을 담는다.
	function Storage_page(){
		checked_in()
		var cookie = getCookie("Name");
		var ttt = cookie.length;
		var storge_arry = cookie;

		var storge_a = storge_arry.split(",");

		
			
		$.ajax({
			type : "GET",	
			url : "Storage_page",
			traditional : true,
			data : {'test' : storge_arry},
		success : function(data) {
			if(data == "ok"){
				location.href = "storage";
			}
		}
			});
	
		setCookie("Name", "");
	};
	
	
	//스토리지에 매물을 새롭게 추가한다
	function add_ob(){
		checked_in()
		
		var cookie = getCookie("Name");
		var ttt = cookie.length;
		var storge_add_arry = cookie;
		var storge_a = storge_arry.split(",");

		var k = 0;
		k = $('.S_Title').attr("data-value");
		checked_in()
			
		$.ajax({
			type : "GET",	
			url : "Storage_page",
			traditional : true,
			data : {'test' : storge_add_arry, "S_Title" : k},
		success : function(data) {
			if(data == "ok"){
				location.href = "storage";
			}
		}
			});
	
		setCookie("Name", "");
	};
	
	// 고객스토리지에 새 매물들을 추가한다.
	function C_add_ob(){
		checked_in()
		var cookie = getCookie("Name");
		var ttt = cookie.length;
		var storge_cadd_arry = cookie;
		var storge_a = storge_arry.split(",");
		
		var j = 0;
		j = $('.Tel').attr("data-value");
		checked_in()
			
		$.ajax({
			type : "GET",	
			url : "customer_interest_add",
			traditional : true,
			data : {'test' : storge_cadd_arry, "tel" : j},
		success : function(data) {
			if(data == "ok"){
				location.href = "customer_interest_view?C_tel="+j;
			}
		}
			});
	
		setCookie("Name", "");
	};
	
	
	// 매물을 삭제한다. -> 스토리지, 고객스토리지도 삭제
	function delete_object(){
		checked_in()
		var cookie = getCookie("Name");
		var ttt = cookie.length;
		var storge_del_arry = cookie;
		
		var result = confirm("정말삭제하시겠습니까 ?");
        
        if(result)
        {
        
    		
    		$.ajax({
    			type : "GET",	
    			url : "delete_object",
    			traditional : true,
    			data : {'test' : storge_del_arry},
    		success : function(data) {
    			if(data == "ok"){
    				/* location.href = "list"; */
    				window.location.reload(true);
    			}
    		}
    			});
        }
        else
        {
            
        }
				
	}
	
	
	function address_view(){
		
		$('.address_view').show();
		$('.content_view').hide();;
		$('.price_view').hide();
		$('.py_tel_view').hide();
		m_value = "address";
	
	}
	function content_view(){
		$('.content_view').show();
		$('.price_view').hide();
		$('.address_view').hide();
		$('.py_tel_view').hide();
		m_value = "content";
		
	}
	function price_view(){
		
		$('.price_view').show();
		$('.content_view').hide();
		$('.address_view').hide();
		$('.py_tel_view').hide();
		m_value = "price";
		
	}
	function py_tel_view(){
		$('.py_tel_view').show();
		$('.price_view').hide();
		$('.content_view').hide();
		$('.address_view').hide();
		m_value = "py_tel";
		
	}
	
;

	


	$(document).on("click",".td_tr1",function(){
		$('.s_table_con').children('tbody').eq(s_index).css("background", back);
		$('.s_table_con').children('tbody').eq(s_index).css("color", col);
		
	
		s_index = $(this).index();

        var checkbox = $(this).find('td:first-child :checkbox');
        var checkbox_TF = checkbox.is(":checked");
   
       	if(checkbox_TF){
       		checkbox.prop("checked", false);
       	}else{
       		checkbox.prop("checked", true);
       	 	$("input[name=d]").prop("checked",false);
       		
       	}
	
	  	back = $('.s_table_con').children('tbody').eq(s_index).css('background');
	 	col = $('.s_table_con').children('tbody').eq(s_index).css('color');

	 	
	 	$('.s_table_con').children('tbody').eq(s_index).css('background-color','#ff7f00');
	 	$('.s_table_con').children('tbody').eq(s_index).css('color','white');
	});
	

	
	$(document).on("click",".m_list_m2",function(){
		$('.s_list_v').children('.m_list_m2').eq(s_index).css("background", back);
		$('.s_list_v').children('.m_list_m2').eq(s_index).css("color", col);
		

		s_index = $(this).index();
		

        var checkbox = $(this).find('span:first-child :checkbox');
        var checkbox_TF = checkbox.is(":checked");
   
       	if(checkbox_TF){
       		checkbox.prop("checked", false);
       	}else{
       		checkbox.prop("checked", true);
       	 	$("input[name=d]").prop("checked",false);

       	}
	  	back = $('.s_list_v').children('.m_list_m2').eq(s_index).css('background');
	 	col = $('.s_list_v').children('.m_list_m2').eq(s_index).css('color');
	


	 	$('.s_list_v').children('.m_list_m2').eq(s_index).css('background-color','#ff7f00');
	 	$('.s_list_v').children('.m_list_m2').eq(s_index).css('color','white');

	});
			
		  

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
    	
    	location.href ="list?state="+state;
    }
	
	
	
	// 계약상태를 업데이트한다.
	$(document).ready(function(){
		
		if(state == '계약off'){	$('.state_select').css("background","gainsboro");}
		if(state == '계약on'){	$('.state_select').css("background","yellow");}
		
		if(m_value == "address"){address_view();}
		if(m_value == "content"){content_view();}
		if(m_value == "price"){price_view();}
		if(m_value == "py_tel"){py_tel_view();}		
	
		
		


		var kind_f ="";
		var form_f ="";
		var dong_f ="";
		var floor_f ="";
		var m2_min_f ="";
		var m2_max_f ="";
		var deposit_min_f ="";
		var deposit_max_f ="";
		var month_min_f ="";
		var month_max_f ="";
		var premium_min_f ="";
		var premium_max_f ="";
		var mcost_min_f ="";
		var mcost_max_f ="";
		var ob_num = "";
		$('.state_select').text(state);
		var value = "address";
		

		
		
		
		var cookie = "${coo}";
		if(cookie == "no"){
			date.setDate(date.getDate() - 1);
			
		
		}	

		
		
		var fff = getCookie("Name");
		var temp = new Array();
		var break_for = "no";
		var ind = 0;
		if(fff != ""){
			var arr = fff.split(",");
			var arr_len = arr.length;


			
			for(var i = 0; i < arr.length; i++){
				ind = 0;
				for(var j = 0; j < 13; j++){		
				
					var input_n = $("input[name=d]").eq(j).val();	
						
						if(input_n == arr[i]){
							
							$("input[name=d]").eq(j).prop("checked", true);
							arr[i] = "";

							ind = 1;
							break;
						}

				 }
			
				if(ind == 0){
					if(i == arr.length-1){
						temp += arr[i];
						
					}
					else{
						if(arr[i] == ""){

							temp += arr[i];
						}
						else{

							temp += arr[i]+",";
						}
						
					}
				}
				
				
				
			}
			setCookie("Name", temp);
						
		}
		// yes가 아니면 실행하였기 때문에 두번째 체크가 일어나지 않음?
		$('.kind_bt').click(function(){
			var kind_text = $(this).text();
			
			
			var s_title = "${S_Title}";
			var c_tel = "${Tel}";
			var listoption = "";
			
			
			
			if(kind_text == "원룸"){listoption = "OneRoom";}
			if(kind_text == "투룸"){listoption = "TwoRoom";}
			if(kind_text == "쓰리룸"){listoption = "ThreeRoom";}
			if(kind_text == "오피스텔"){listoption = "Officetel";}
			if(kind_text == "빌라"){listoption = "Villa";}
			if(kind_text == "아파트"){listoption = "Apartment";}
			if(kind_text == "상가"){listoption = "Shop";}
			if(kind_text == "상가+주택"){listoption = "Shop_House";}
			
			checked_in()
			
			location.href ="list?ListOption="+listoption+"&S_Title="+s_title+"&C_tel="+c_tel+"&state="+state+"&m_value="+m_value;
			
			
			
		});
		
		
		$('.pag_bt').click(function(){
			pag_n = $(this).text();
			Startpage = "${startpage}";
			var listoption_p = "${ListOption}";
			var Next_pag = 0;
			

			checked_in()
			location.href ="list?Nextpage="+Next_pag+"&startpage="+Startpage+"&ListOption="+listoption_p+"&currentpage="+pag_n+"&coo=yes&state="+state+"&m_value="+m_value;
			
		});
		
		
		$('.pag_bt_f').click(function(){
			
			 kind_f ="${kind}";
			 form_f ="${form}";
			 dong_f ="${dong}";
			 floor_f ="${floor}";
			 m2_min_f ="${m2_min}";
			 m2_max_f ="${m2_max}";
			 deposit_min_f ="${deposit_min}";
			 deposit_max_f ="${deposit_max}";
			 month_min_f ="${month_min}";
			 month_max_f ="${month_max}";
			 premium_min_f ="${premium_min}";
			 premium_max_f ="${premium_max}";
			 mcost_min_f ="${mcost_min}";
			 mcost_max_f ="${mcost_max}";
			 pag_f = $(this).text();
			 
			
			var listoption_p = "${ListOption}";
			
			var hre1 = "&kind="+kind_f+"&form="+form_f+"&dong="+dong_f+"&floor="+floor_f+"&m2_min="+m2_min_f+"&m2_max="+m2_max_f;
			var hre2 = "&deposit_min="+deposit_min_f+"&deposit_max="+deposit_max_f+"&month_min="+month_min_f+"&month_max="+month_max_f;
			var hre3 = "&premium_min="+premium_min_f+"&premium_max="+premium_max_f+"&mcost_min="+mcost_min_f+"&mcost_max="+mcost_max_f;
			checked_in()
			location.href = "filter?&currentpage="+pag_f+hre1+hre2+hre3+"&state="+state+"&m_value="+m_value;
			
			
			
			
		});
		
		
		$('.pag_bt_f_n').click(function(){
			var Startpage = "${startpage}";
			 kind_f ="${kind}";
			 form_f ="${form}";
			 dong_f ="${dong}";
			 floor_f ="${floor}";
			 m2_min_f ="${m2_min}";
			 m2_max_f ="${m2_max}";
			 deposit_min_f ="${deposit_min}";
			 deposit_max_f ="${deposit_max}";
			 month_min_f ="${month_min}";
			 month_max_f ="${month_max}";
			 premium_min_f ="${premium_min}";
			 premium_max_f ="${premium_max}";
			 mcost_min_f ="${mcost_min}";
			 mcost_max_f ="${mcost_max}";
			 
			 
				var hre1 = "&kind="+kind_f+"&form="+form_f+"&dong="+dong_f+"&floor="+floor_f+"&m2_min="+m2_min_f+"&m2_max="+m2_max_f;
				var hre2 = "&deposit_min="+deposit_min_f+"&deposit_max="+deposit_max_f+"&month_min="+month_min_f+"&month_max="+month_max_f;
				var hre3 = "&premium_min="+premium_min_f+"&premium_max="+premium_max_f+"&mcost_min="+mcost_min_f+"&mcost_max="+mcost_max_f;
			 
				location.href = "filter?Nextpage=10&startpage="+Startpage+hre1+hre2+hre3+"&state="+state+"&m_value="+m_value;
		});
		
		$('.pag_bt_f_p').click(function(){
			var Startpage = "${startpage}";
			 kind_f ="${kind}";
			 form_f ="${form}";
			 dong_f ="${dong}";
			 floor_f ="${floor}";
			 m2_min_f ="${m2_min}";
			 m2_max_f ="${m2_max}";
			 deposit_min_f ="${deposit_min}";
			 deposit_max_f ="${deposit_max}";
			 month_min_f ="${month_min}";
			 month_max_f ="${month_max}";
			 premium_min_f ="${premium_min}";
			 premium_max_f ="${premium_max}";
			 mcost_min_f ="${mcost_min}";
			 mcost_max_f ="${mcost_max}";
			 
			 
				var hre1 = "&kind="+kind_f+"&form="+form_f+"&dong="+dong_f+"&floor="+floor_f+"&m2_min="+m2_min_f+"&m2_max="+m2_max_f;
				var hre2 = "&deposit_min="+deposit_min_f+"&deposit_max="+deposit_max_f+"&month_min="+month_min_f+"&month_max="+month_max_f;
				var hre3 = "&premium_min="+premium_min_f+"&premium_max="+premium_max_f+"&mcost_min="+mcost_min_f+"&mcost_max="+mcost_max_f;
			 
				location.href = "filter?Nextpage=-10&startpage="+Startpage+hre1+hre2+hre3+"&state="+state+"&m_value="+m_value;
		});


		
		
		
		
		
		
		
		
		
		
		
		
 
		
		

		


		
		
		
		
		
		
		$(document).on("click","#ajax_test", function(){
			
			$('.s_table_con *').remove();
			$('.s_list_v *').remove();
		
		var s_address = $(this).attr("data-value");
		var b_address = $(this).attr("data-value1");
		
		console.log("s변수=" + s_address)
		console.log("b변수=" + b_address)
		console.log("state=" + state)
			$.ajax({
				type : "GET",	
				dataType : "json",
				url : "sublist",
				data : {s_address: s_address, b_address: b_address, state: state},
				success : function(data) {
	 				$.each(data, function(key, value){
	 					$.each(value, function(list_key, list_value){
	 						console.log(list_key, list_value)
	 						

	 						var tbody = "<tbody class='td_tr1' style='background: white;'>";
	 						var m_list_m1 = '<div class="m_list_m2" style="display: flex; width: 980px; background: white;">';
	 						
	 						
	 						if(list_value.ob_State == '계약'){
	 							tbody = "<tbody class='td_tr1' style='background: #ffff00;'>";
	 							m_list_m1 = '<div class="m_list_m2" style="display: flex; width: 980px; background: #ffff00;">';
	 							
	 						}
	 						else if(list_value.ob_State == '보류'){
	 							tbody = "<tbody class='td_tr1' style='background: #f3dbdb;'>";
	 							m_list_m1 = '<div class="m_list_m2" style="display: flex; width: 980px; background: #f3dbdb;">';
	 						}
	 						else if(list_value.ob_State == '방문'){
	 							tbody = "<tbody class='td_tr1' style='background: #dbeef4;'>";
	 							m_list_m1 = '<div class="m_list_m2" style="display: flex; width: 980px; background: #dbeef4;">';
	 						}
	 						else{
	 							tbody = "<tbody class='td_tr1' style='background: white;'>";
	 							m_list_m1 = '<div class="m_list_m2" style="display: flex; width: 980px; background: white;">';
	 						}
	 						
	 						
	 						
	 						
	 				
	 			
	 						var ck_m = '<span style="width:20px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;"><input class="ts" type="checkbox" name="ba" value='+list_value.ob_Num +'></span>';
	 						var key_object ='<div class="key_object" style="display: table-cel; width: 565px; font-size: 20px;">';

	 						var OB_Kind_m = '<span style="width:100px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Kind +'<br>('+list_value.ob_D_Kind +')</span>';
	 						var OB_Form_m = '<span style="width:65px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Form +'</span>';
	 						var OB_Dong_m = '<span style="width:115px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Dong +'</span>';
	 						var OB_Name_m = '<span style="width:165px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Name +'</span>';
	 						var OB_Floor_m = '<span style="width:45px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Floor +'</span>';
	 						var OB_Ho_m = '<span style="width:55px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Ho +'</span>';
	 						
	 						var value_object = '<div class="value_object" style="display: table-cell; width: 370px; height:60px; font-size: 20px; overflow: scroll;">';
	 						
	 						
	 						var OB_B_Address_m = '<span class="address_view" style="width:370px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_B_Address +'</span>';
	 						
	 						var OB_Content_m = '<span class="content_view" style="width:370px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center; overflow: scroll;">'+ list_value.ob_Content +'</span>'
							
	 						var OB_Pyeong_m = '	<span class="py_tel_view" style="width:80px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center; overflow: scroll;">'+list_value.ob_Pyeong+'</span>';
	 						var OB_Tel_m = '	<span class="py_tel_view" style="width:290px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center; overflow: scroll;">주)'+ list_value.ob_Lessor_Tel +'<br>세)'+list_value.ob_Tenant_Tel +'</span>';
	 							
	 		
	 						
	 						
	 						var py_tel_m = OB_Pyeong_m + OB_Tel_m;
							
							
							
							
	 						
	 						var OB_Dealing_Cost_m =  '<span class="price_view" style="width:80px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Dealing_Cost +'</span>';
	 						var OB_Deposit_m =  '<span class="price_view" style="width:77px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center; table-layout: fixed;">'+list_value.ob_Deposit +'</span>';
	 						var OB_Month_Cost_m = '<span class="price_view" style="width:65px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Month_Cost +'</span>'; 
	 						var OB_Maintenance_Cost_m = '<span class="price_view" style="width:65px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Maintenance_Cost +'</span>';  
	 						var OB_Premium_Cost_m =  '<span class="price_view" style="width:80px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">'+list_value.ob_Premium_Cost +'</span>';
	 				
	 						
	 						var D2_m2_p = OB_Dealing_Cost_m + OB_Deposit_m + OB_Month_Cost_m + OB_Maintenance_Cost_m + OB_Premium_Cost_m;
	 						
	 						var view_form = '<div style="width: 45px; height: 60px; font-size: 22px; display: table-cell;">'		
								+'<span class="view_form" data-value='+list_value.ob_Num+'style="width:70px; height: 60px; border: 1px solid #d3caca; display: table-cell; text-align: center;"><img src="resources/img/list.JPG" style="width: 35px; height: 45px;"></span>	'
								+'</div>';
	 		
							

								
								
								
						
						
							
							
							
								
								
								
								
								
								
								
								
								
								
	 						
	 						var td = "<tr>";
	 						var etd = "</tr>";
	 						var ck = "<td class='te1' rowspan='2'><input class=ts type=checkbox name=ba value="+list_value.ob_Num +"></td>"
	 						var wnd = "<td rowspan='2'>v</td>";
	 						var OB_Num = "<td class='te2' rowspan='2'>"+list_value.ob_Num +"</td>";
	 						var OB_Date_date = "<td class='te3' rowspan='2'>"+list_value.ob_Date+"</td>";
	 						var OB_Kind = "<td class='te4'>"+list_value.ob_Kind +"</td>";
	 						var OB_Form = "<td class='te5' rowspan='2'>"+list_value.ob_Form  +"</td>";
	 						var OB_Dong = "<td class='te6' rowspan='2'>"+list_value.ob_Dong  +"</td>";
	 						var OB_Name = "<td class='te7' rowspan='2'>"+list_value.ob_Name  +"</td>";
	 						var OB_S_Address = list_value.ob_B_Address;
	 						var OB_B_Address = "<td class='te8' rowspan='2'>"+list_value.ob_B_Address+"</td>";
	 						var OB_Floor = "<td class='te9' rowspan='2'>"+list_value.ob_Floor  +"</td>";
	 						var OB_Ho = "<td class='te10' rowspan='2'>"+list_value.ob_Ho +"</td>";
	 						var OB_Pyeong = "<td class='te11' rowspan='2'>"+list_value.ob_Pyeong+"</td>";
	 						var OB_M2 = "<td class='te11' rowspan='2'>"+list_value.ob_M2  +"</td>";
	 						
	 						
	 						var OB_Deposit = "<td class='te14' rowspan='2'>"+list_value.ob_Deposit +"</td>";
	 						var OB_Month_Cost = "<td class='te15' rowspan='2'>"+list_value.ob_Month_Cost +"</td>";
	 						var OB_Premium_Cost = "";
	 						var OB_Maintenance_Cost = "<td class='te16' rowspan='2'>"+list_value.ob_Maintenance_Cost  +"</td>";
	 						var OB_Dealing_Cost = "";
	  						
	 						
	 						
	 						var OB_Content = "<td colspan='3' rowspan='2'>"+list_value.ob_Content +"</td>";
	 						var OB_Tel = "<td class='te17'>"+list_value.ob_Lessor_Tel+"</td>";
	 						var OB_Deal_State ="<td>"+list_value.ob_Deal_State  +"</td>";	
	 						
	 						var sub_kind = "<td class='te4'>("+list_value.ob_D_Kind +")</td>";
	 						var sub_s_address = "<td class='te8'>"+list_value.ob_S_Address+"</td>";
						 	var tel_b = "<td class='te17'>"+list_value.ob_Tenant_Tel+"</td>";	
	 						
/* 	 						if(list_value.ob_Kind == "원룸" || list_value.ob_Kind == "2룸" || list_value.ob_Kind == "3룸"){
	 							OB_Content = "<td colspan='5' rowspan='2'>"+list_value.ob_Content +"</td>";
	 						} */
	 						if(list_value.ob_Kind == "상가" || list_value.ob_Kind == "상가+주택" || list_value.ob_Kind == "오피스텔"){
	 					/* 		OB_Content = "<td colspan='7'>"+list_value.ob_Content +"</td>"; */
	 							OB_Premium_Cost = "<td class='te12' rowspan='2'>"+list_value.ob_Premium_Cost +"</td>";
	 							
	 							
	 						}
	 						if(list_value.ob_Kind == "오피스텔" || list_value.ob_Kind == "빌라" || list_value.ob_Kind == "아파트" || list_value.ob_Kind == "상가"){
	 					/* 		OB_Content = "<td colspan='6'>"+list_value.ob_Content +"</td>"; */
	 							OB_Dealing_Cost = "<td class='te13' rowspan='2'>"+list_value.ob_Dealing_Cost + "</td>";
	 						}
	 						
	 						


			
							var view = '<td rowspan="2" style="width: 50px;" class="view_form" data-value="'+list_value.ob_Num +'"><img src="resources/img/list.JPG" style="width: 25px; height: 30px;"></td>';
	 						
	 						$('.s_table_con').append(tbody+"<tr>"+ck+ OB_Num + OB_Date_date + OB_Kind + OB_Form 
	 								+ OB_Dong + OB_Name + OB_B_Address + OB_Floor + OB_Ho +  OB_Pyeong + OB_Dealing_Cost + OB_Premium_Cost + OB_Deposit + OB_Month_Cost  
	 								+ OB_Maintenance_Cost + OB_Content + OB_Tel+ view +"</tr>"+"<tr>"+sub_kind + tel_b + "</tr></tbody>");
	 						
	 						$('.s_list_v').append(m_list_m1 + key_object + ck_m + OB_Kind_m + OB_Form_m + OB_Dong_m + OB_Name_m + OB_Floor_m + OB_Ho_m + '</div>' + value_object + OB_B_Address_m + OB_Content_m + py_tel_m + D2_m2_p + '</div>' + view_form + '</div>');
	 						
	 						
	 						if(m_value == "address"){address_view();}
	 						if(m_value == "content"){content_view();}
	 						if(m_value == "price"){price_view();}
	 						if(m_value == "py_tel"){py_tel_view();}
	 						
	 						
	 						console.log(OB_Name)
	 					});
	 				});


				
			},				
				error : function(e) {
	                    console.log(e.responseText);
	                }
		
	});
			
	});
		
		
		
		
		
		
	

		$('.td_tr').click(function(){

				$('tbody').eq(v_index).css("background", back);
				$('tbody').eq(v_index).css("color", col);

			
				v_index = $(this).index()-2;

	            var checkbox = $(this).find('td:first-child :checkbox');
	            var checkbox_TF = checkbox.is(":checked");
	       
	           	if(checkbox_TF){
	           		checkbox.prop("checked", false);
	           	}else{
	           		checkbox.prop("checked", true);	        
	           	}

	           	

			
			  	back = $('tbody').eq(v_index).css('background');
			 	col = $('tbody').eq(v_index).css('color');

			 	
			 	$('tbody').eq(v_index).css('background-color','#3d1261');
			 	$('tbody').eq(v_index).css('color','white');

			});
		
		
		$('.m_list_m1').click(function(){
			
				$('.m_list_m1').eq(v_index).css("background", back);
				$('.m_list_m1').eq(v_index).css("color", col);

			
				v_index = $(this).index()-1;
	

	            var checkbox = $(this).find('span:first-child :checkbox');
	            var checkbox_TF = checkbox.is(":checked");
	       
	           	if(checkbox_TF){
	           		checkbox.prop("checked", false);
	           	}else{
	           		checkbox.prop("checked", true);	        
	           	}

	           	

			
			  	back = $('.m_list_m1').eq(v_index).css('background');
			 	col = $('.m_list_m1').eq(v_index).css('color');

			 	
			 	$('.m_list_m1').eq(v_index).css('background-color','#3d1261');
			 	$('.m_list_m1').eq(v_index).css('color','white');

			});

				
		
		


		
	
		
		


		
		
		if("OneRoom" == select_op){
			select_op = "원룸";
		}
		if("TwoRoom" == select_op){
			select_op = "2룸";
		}
		if("ThreeRoom" == select_op){
			select_op = "3룸";
		}
		if("Officetel" == select_op){
			select_op = "오피스텔";
		}
		if("Apartment" == select_op){
			select_op = "아파트";
		}
		if("Villa" == select_op){
			select_op = "빌라";
		}
		if("Shop" == select_op){
			select_op = "상가";
		}
		if("Shop_House" == select_op){
			select_op = "상가+주택";
		}
		
		
		$(".kind_op").val(select_op).prop("selected", true);
	
		
		$(document).on("click",".view_form",function(){
	
			up_num =   $(this).attr("data-value");
			ob_p_kind = "ob_view";
	        var url = "resources/test.jsp";
	        var name = "매물보기";
	        var option = "width = 700, height = 900, left = 1000, location = no"
	        var openWin = window.open(url, name, option);	
			
		});
		
	
		
		$('.update_form').click(function(){
			

			up_num =  $('.td_tr').eq(v_index).children('tr').children('.OB_Num').text();
				
		    var url = "resources/object_update.jsp";
		    var name = "상세보기";
		    var option = "width = 700, height = 900, left = 1000, location = no"
		    var openWin = window.open(url, name, option);	
			
		});
		
		
		
		
	$("input[name=bt]").click(function(){
		var currentpage = "${currentpage}";
		Startpage = "${startpage}"
		var OB_State = $(this).val();
		if(OB_State == "기본"){
			OB_State = "0";
		}

		checked_in()
		
		
		$.ajax({
			type : "GET",	
			url : "update_state",
			traditional : true,
			data : {'test' : test, 'State' : OB_State},
		success : function(data) {
			if(data == "ok"){
				if(list_filter == "list"){
					location.href = "list?ListOption="+select_op_s+"&startpage="+Startpage+"&currentpage="+currentpage+"&state="+state+"&m_value="+m_value;
				}
				else{
					 kind_f ="${kind}";
					 form_f ="${form}";
					 dong_f ="${dong}";
					 floor_f ="${floor}";
					 m2_min_f ="${m2_min}";
					 m2_max_f ="${m2_max}";
					 deposit_min_f ="${deposit_min}";
					 deposit_max_f ="${deposit_max}";
					 month_min_f ="${month_min}";
					 month_max_f ="${month_max}";
					 premium_min_f ="${premium_min}";
					 premium_max_f ="${premium_max}";
					 mcost_min_f ="${mcost_min}";
					 mcost_max_f ="${mcost_max}";
					 
						var hre1 = "&kind="+kind_f+"&form="+form_f+"&dong="+dong_f+"&floor="+floor_f+"&m2_min="+m2_min_f+"&m2_max="+m2_max_f;
						var hre2 = "&deposit_min="+deposit_min_f+"&deposit_max="+deposit_max_f+"&month_min="+month_min_f+"&month_max="+month_max_f;
						var hre3 = "&premium_min="+premium_min_f+"&premium_max="+premium_max_f+"&mcost_min="+mcost_min_f+"&mcost_max="+mcost_max_f;
					
					
					location.href = "filter?startpage="+Startpage+"&currentpage="+currentpage+"&state="+state+hre1+hre2+hre3+"&m_value="+m_value;
				}
				
			
			}
		}
			});
		
		
	
		
	});
	
	
	
		function check_s() {
			
			if($("input[name=ba]").prop("checked")){
				$("input[name=d]").prop("checked",false);
			}
			
		}


		
	    //최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=d]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=d]").prop("checked",false);
	        }
	    })
	    
	    
	});
	

	//선택된 매물의 커서를 나타낸다.

	
	
	
	function write_form(){
		ob_p_kind = "ob_insert";
        var url = "resources/test.jsp";
        var name = "매물등록";
        var option = "width = 700, height = 1000, left = 1000, location = no"
        var openWin = window.open(url, name, option);	
		
	}
	

	
		


	
	
	</script>
	
		<script type="text/javascript">
		

		
		
		function foo(){
			
			checked_in()
			
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
	
	<script type="text/javascript">

</script>


	</head> 
	<body>
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px;">
				<jsp:include page="/resources/header.jsp"></jsp:include>
	        
	        </div>
			
			
			
			
			
			
			<div class="content" style="width: 100%; height: 92%; display: flex;">
				
				<div class="object_list_sidebar">
				<br>
				<br>
				<br>
					<p class="side_title"></p>
					<div class="kind_box">
						<p class="kind_bt"><a><img alt="" src="resources/img/one.JPG"><br>원룸</a></p>
						<p class="kind_bt"><a><img alt="" src="resources/img/two.JPG"><br>투룸</a></p>
						<p class="kind_bt"><a><img alt="" src="resources/img/tr.JPG"><br>쓰리룸</a></p>
						<p class="kind_bt"><a><img alt="" src="resources/img/of.JPG"><br>오피스텔</a></p>
						<p class="kind_bt"><a><img alt="" src="resources/img/bi.JPG"><br>빌라</a></p>
						<p class="kind_bt"><a><img alt="" src="resources/img/at.JPG"><br>아파트</a></p>
						<p class="kind_bt"><a><img alt="" src="resources/img/sh.JPG"><br>상가</a></p>
						<p class="kind_bt"><a><img alt="" src="resources/img/sh.JPG"><br>상가+주택</a></p>

						<br>
						<p onclick="write_form()"><a href="#"><img alt="" src="resources/img/c.JPG"><br>매물등록</a></p>
					</div>																	
				</div>
				
				<div class="object_list_content">
				<form action="filter" onsubmit="foo();">
					<div class="fillter">
						<div class="filter_top">
						<span>종류</span>
						<select class="kind_op" name="Kind">
							<option>원룸</option>
							<option>2룸</option>
							<option>3룸</option>
							<option>오피스텔</option>
							<option>빌라</option>
							<option>아파트</option>
							<option>상가</option>
							<option>상가+주택</option>
						</select>
						<span>전월세</span>
						<select name="form">
							<option value="월">월세</option>
							<option value="전">전세</option>
							<option value="매매">매매</option>
						</select>
						<span>동</span>
						<select name="dong">
							<c:forEach var="dong_list" items="${dong_list}" varStatus="status">
							<option>${dong_list.OB_Dong}</option>
							</c:forEach>

						</select>
						
						
						
						<span>층수</span>
						<input type="number" name="floor" style="width: 50px; height: 27px; border-radius: 5px;" value="">
						
						<span>면적(m²)</span>
						<input type="text" name="m2_min" style="width: 50px; height: 27px; border-radius: 5px;" value="">
						~
						<input type="text" name="m2_max" style="width: 50px; height: 27px; border-radius: 5px;" value="">
						
						
						<span>보증금</span>
						<input type="text" name="deposit_min" style="width: 70px; height: 27px; border-radius: 5px;" value="">
						~
						<input type="text" name="deposit_max" style="width: 70px; height: 27px; border-radius: 5px;" value="">
						</div>
						<div class="filter_bot">
						<span>월세</span>
						<input type="text" name="month_min" style="width: 70px; height: 27px; border-radius: 5px;" value="">
						~
						<input type="text" name="month_max" style="width: 70px; height: 27px; border-radius: 5px;" value="">
					
						<span>권리금</span>
						<input type="text" name="premium_min" style="width: 70px; height: 27px; border-radius: 5px;" value="">
						~
						<input type="text" name="premium_max" style="width: 70px; height: 27px; border-radius: 5px;" value="">
					
						<span>관리비</span>
						<input type="text" name="mcost_min" style="width: 50px; height: 27px; border-radius: 5px;" value="">
						~
						<input type="text" name="mcost_max" style="width: 50px; height: 27px; border-radius: 5px;" value="">&nbsp;
						
						<input class="search_ob" type="submit" name="filter_bt" value="검색" style="width: 50px; height: 27px;">
						
						<input type="hidden" name="state" value="${state}">
						<button type="button" class="state_select" onclick="state_select()"></button>
						</div>
						
						    
						
						
						
						
						<input type="hidden" name="S_Title" value="${S_Title}">	
						<input type="hidden" name="C_tel" value="${Tel}">	
					</div>
					</form>
					<div class="kind_mb" style="width: 100%; height: 90px;">
					<div style="width: 50%;">
						<div class="kind_mb_top" style="display: flex;">
						<p class="kind_bt"><a><button>원룸</button></a></p>
						<p class="kind_bt"><a><button>투룸</button></a></p>
						<p class="kind_bt"><a><button>쓰리룸</button></a></p>
						<p class="kind_bt"><a><button>오피스텔</button></a></p>			
						</div>

						<div class="kind_mb_bottom" style="display: flex;">
						<p class="kind_bt"><a><button>빌라</button></a></p>
						<p class="kind_bt"><a><button>아파트</button></a></p>
						<p class="kind_bt"><a><button>상가</button></a></p>
						<p class="kind_bt"><a><button>상가+주택</button></a></p>
						</div>
					
						<br>
					</div>	
					
					<div style="width: 35%; padding-top: 20px; display: flex; margin-left: 15px;">
						<button class="view_bt" type="button" onclick="address_view()">주소</button>
						<button class="view_bt" type="button" onclick="content_view()">메모</button>
						<button class="view_bt" type="button" onclick="price_view()">가격</button>
						<button class="view_bt" type="button" onclick="py_tel_view()">평/전화</button>
					</div>
					
						
					<div style="width: 15%; padding-top: 20px;"">
					<p><a href="#"><button onclick="write_form()" style="background: #67229f; color: white; width: 80px; margin-left: 0px;" >매물등록</button></a></p>
					</div>
											
					</div>
					


					
					<div class="m_list" style="overflow-y: auto;">
						<table class="title_table">
							<colgroup>
				        		<!-- 공통 -->
				        			<col class="md0"/><!-- 체크 -->
				        			<col class="md1"/><!-- 번호 -->
				        			<col class="md2"/><!-- 접수일자 -->
				        			<col class="cl1"/><!-- 종류 -->
				        			<col class="cl2"/><!-- 전월세 -->
				        			
				        			<col class="cl3"/><!-- 동 -->
				        			
				        			<col class="cl4"/><!-- 건물업체명 -->
				        			<col class="cl5"/><!-- 주소 -->
				        			<col class="cl6"/><!-- 층수 -->
				        			<col class="cl7"/><!-- 호수 -->
				        			<col class="cl8"/><!-- 면적 -->
				        			<c:if test="${ListOption eq 'Officetel' || ListOption eq 'Villa' || ListOption eq 'Apartment' || ListOption eq 'Shop' || ListOption eq 'Shop_House'}">
				        			<col class="cl13"/><!-- 매매가 -->
				        			</c:if>
				        			 <c:if test="${ListOption eq 'Shop' || ListOption == 'Shop_House' || ListOption eq 'Officetel'}">
				        			<col class="cl12"/><!-- 권리금 -->
				        			</c:if>		
				        			<col class="cl9"/><!-- 보증금 -->
				        			<col class="cl10"/><!-- 월세 -->
				        		
				         			<col class="cl11"/><!-- 관리비 -->   

		        			
				        			
				        			
				        			

				        			
				        			
				        			<col class="cl8_1" width="*"/><!-- 메모 -->
				        			<col class="cl14"/><!-- 전화번호 -->
				        			<col class="cl15"/><!-- 상세보기 -->
				        			
				        	</colgroup>
				        		<thead>
				        		<tr class="th_tr" style="height: 25px;">
							 		<th scope="col"><input type="checkbox" id="checkall" name="check"></th> 
							 		<th class="hn" scope="col">번호</th>
							 		<th class="hn" scope="col">접수일자</th>
							 		<th scope="col">종류</th>
							 		<th scope="col">전월세</th>
							 		<th scope="col">동</th>
							 		<th scope="col">건물/업체명</th>
							
							
							
							 		<th scope="col">${address} 주소</th>
							 		
							 		
							 		
							 		<th scope="col">층수</th>
							 		<th scope="col">호수</th>
							 		
							 		<th scope="col">평</th>
							 		<c:if test="${ListOption eq 'Officetel' || ListOption eq 'Villa' || ListOption eq 'Apartment' || ListOption eq 'Shop' || ListOption eq 'Shop_House'}">
							 		<th scope="col">매매가</th>
							 		</c:if>
							 		 <c:if test="${ListOption eq 'Shop' || ListOption == 'Shop_House' || ListOption eq 'Officetel'}">
							 		<th scope="col">권리금</th>
							 		</c:if>
							 		<th scope="col">보증금</th>
							 		<th scope="col">월세</th>
							 		<th scope="col">관리비</th>


							 		


							 		<th scope="col">메모</th>
							 		<th scope="col">전화번호</th>
							 		<th scope="col">상세</th>
							 	</tr>
							 	</thead>

							 
							 	<c:forEach var="object_list" items="${object_list}" varStatus="status">
							
							 	<c:set var="s_address" value="${object_list.OB_S_Address}"></c:set>
							 	<c:set var="b_address" value="${object_list.OB_B_Address}"></c:set>
							 	
							 	

									
									<c:if test="${object_list.OB_State eq '계약'}">
								 	<tbody id ="ajax_test" class="td_tr" data-value="${s_address}" data-value1="${b_address}" style="background: #ffff00;">
								 	</c:if>
								 	
								 	<c:if test="${object_list.OB_State eq '방문'}">
								 	<tbody id ="ajax_test" class="td_tr" data-value="${s_address}" data-value1="${b_address}" style="background: #dbeef4;">
								 	</c:if>
								 	
								 	<c:if test="${object_list.OB_State eq '보류'}">
								 	<tbody id = "ajax_test"  class="td_tr" data-value="${s_address}" data-value1="${b_address}" style="background: #f3dbdb;">
								 	</c:if>
								 	
								 	<c:if test="${object_list.OB_State eq '0'}">
								 	<tbody id ="ajax_test"  class="td_tr" data-value="${s_address}" data-value1="${b_address}" style="background: white;">
								 	</c:if>
								 	<tr>
							 		<td rowspan="2"><input class="ts" type="checkbox" name="d" value="${object_list.OB_Num}"></td>
							 		<td rowspan="2" class="OB_Num" data-value="${object_list.OB_State}">${object_list.OB_Num}</td>
							 		<td rowspan="2" class="OB_Date">${object_list.OB_Date}</td>
							 		<td class="OB_Kind" data-value="${object_list.OB_D_Kind}">${object_list.OB_Kind}</td>
							 		<td rowspan="2" class="OB_Form">${object_list.OB_Form}</td>
							 		<td rowspan="2" class="OB_Dong">${object_list.OB_Dong}</td>							 		
							 		<td rowspan="2" class="OB_Name">${object_list.OB_Name}</td> 	
							 		<td rowspan="2" class="OB_B_Address" data-value="${object_list.OB_S_Address}">${object_list.OB_B_Address}</td>
						



							


					
							 
							 		
							 		<td rowspan="2" class="OB_Floor">${object_list.OB_Floor}</td>

							 		<td rowspan="2" class="OB_Ho">${object_list.OB_Ho}</td>
							 		
							 		
							 		
							 		<c:if test="${py_m2 eq 'm2'}">
							 		<td rowspan="2" class="OB_M2">${object_list.OB_M2}</td>
							 		<input type="hidden" class="OB_Pyeong" value="${object_list.OB_Pyeong}">
							 	
							 		</c:if>
							 		<c:if test="${py_m2 eq 'py'}">
							 		<td rowspan="2" class="OB_Pyeong"><fmt:formatNumber value="${object_list.OB_Pyeong}" pattern="#.###"/></td>
							 			
							 		<input type="hidden" class="OB_M2" value="${object_list.OB_M2}">		
							 		</c:if> 
							 		
							 		
							 		<c:if test="${ListOption eq 'Officetel' || ListOption eq 'Villa' || ListOption eq 'Apartment' || ListOption eq 'Shop' || ListOption eq 'Shop_House'}">
							 		<td rowspan="2" class="OB_Dealing_Cost"><fmt:formatNumber value="${object_list.OB_Dealing_Cost}" pattern="#,###.#"/> </td>
							 		</c:if>
							 		
							 		 <c:if test="${ListOption eq 'Shop' || ListOption == 'Shop_House' || ListOption eq 'Officetel'}">
							 		<td rowspan="2" class="OB_Premium_Cost"><fmt:formatNumber value="${object_list.OB_Premium_Cost}" pattern="#,###.#" /></td>
							 		</c:if>	
							 		 	
							 		<td rowspan="2" class="OB_Deposit"><fmt:formatNumber value="${object_list.OB_Deposit}" pattern="#,###.#" /></td>
							 		<td rowspan="2" class="OB_Month_Cost"><fmt:formatNumber value="${object_list.OB_Month_Cost}" pattern="#,###.#"/></td>
							 		<td rowspan="2" class="OB_Maintenance_Cost"><fmt:formatNumber value="${object_list.OB_Maintenance_Cost}" pattern="#.###"/></td>
							 		
							 		

						
							 		
							 		

							 		
							 		
							 		<c:if test="${ListOption eq 'OneRoom' || ListOption == 'TwoRoom' || ListOption == 'ThreeRoom'}">
								 	<td  rowspan="2">${object_list.OB_Content}</td>
								 	</c:if>
								 	<c:if test="${ListOption eq 'Shop' || ListOption == 'Shop_House'}">
								 	<td rowspan="2">${object_list.OB_Content}</td>	
								 	</c:if>
								 	<c:if test="${ListOption eq 'Officetel' || ListOption eq 'Villa' || ListOption eq 'Apartment'}">
								 	<td rowspan="2">${object_list.OB_Content}</td>	
								 	</c:if>
								 	
							 		<td class="Tel_lt"><p class="OB_Lessor_Tel" data-value="${object_list.OB_Lessor_Tel}" data-value1="${object_list.OB_Tenant_Tel}">주) ${object_list.OB_Lessor_Tel}</p></td>
							 		<td rowspan="2" class="view_form" data-value="${object_list.OB_Num}"><img src="resources/img/list.JPG" style="width: 25px; height: 30px;"></td>
							 		<input type="hidden" class="OB_Type" value="${object_list.OB_Type}">
							 	</tr>
							 	<tr>
							 	<td>(${object_list.OB_D_Kind})</td>
							 	<td><p class="OB_Tenant_Tel">세) ${object_list.OB_Tenant_Tel}</p></td>	
							   
							 	</tr> 
						
							 	</tbody>
							 	</c:forEach>
							 	
							 	

										
						</table>
					
					</div>
					
					
 					<div class="m_list_m">
 	
 					  <div class="m_list_th" style="display: flex; font-size: 26px; text-align: center; width: 980px;">
 					  	<p style="width:20px; height: 40px; border: 1px solid white; background:#67229f; color: white; font-weight: bold;"><input type="checkbox" id="checkall" name="check"></p>
 					  	<p style="width:100px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold; overflow: auto;">종류</p>
 					  	<p style="width:65px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">전월</p>
 					  	<p style="width:115px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">동</p>
 					  	<p style="width:165px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">건물명</p>
 					  	<p style="width:45px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">층</p>
 					  	<p style="width:55px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">호</p>
 					  	
 						<p class="address_view" style="width:375px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">주소</p>
 						<p class="content_view" style="width:375px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">메모</p>

						 <p class="py_tel_view" style="width:80px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">평</p>
 					  	 <p class="py_tel_view" style="width:295px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">연락처</p>

						 <p class="price_view" style="width:80px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">매매</p>
 					  	 <p class="price_view" style="width:80px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">보증</p>
 					  	 <p class="price_view" style="width:65px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">월세</p>
 					  	 <p class="price_view" style="width:65px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">관리</p>
 					  	 <p class="price_view" style="width:80px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">권리</p>
 					  	
 					  	
 					  	<p style="width:45px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">m</p>
 					  	
 					  </div>	
 						<c:forEach var="object_list" items="${object_list}" varStatus="status">	
 						
 						<c:set var="s_address" value="${object_list.OB_S_Address}"></c:set>
						<c:set var="b_address" value="${object_list.OB_B_Address}"></c:set>
 						
 						<c:if test="${object_list.OB_State eq '계약'}">
 						<div class="m_list_m1" style="display: flex; width: 980px; background: #ffff00;" id ="ajax_test" data-value="${s_address}" data-value1="${b_address}">
						</c:if>
								 	
						<c:if test="${object_list.OB_State eq '방문'}">
						<div class="m_list_m1" style="display: flex; width: 980px; background: #dbeef4;" id ="ajax_test" data-value="${s_address}" data-value1="${b_address}">
						</c:if>
								 	
						<c:if test="${object_list.OB_State eq '보류'}">
						<div class="m_list_m1" style="display: flex; width: 980px; background: #f3dbdb;" id ="ajax_test" data-value="${s_address}" data-value1="${b_address}">
						</c:if>
								 	
						<c:if test="${object_list.OB_State eq '0'}">
						<div class="m_list_m1" style="display: flex; width: 980px; background: white;" id ="ajax_test" data-value="${s_address}" data-value1="${b_address}">
						</c:if>						
 						
 						
					
					
						<div class="key_object" style="display: table-cel; width: 565px; font-size: 20px;">
						<span style="width:20px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;"><input class="ts" type="checkbox" name="d" value="${object_list.OB_Num}"></span>
 					  	<span style="width:100px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Kind}<br>(${object_list.OB_D_Kind})</span>
 					  	<span style="width:65px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Form}</span>
 					  	<span style="width:115px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Dong}</span>
 					  	<span style="width:165px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Name}</span>
 					  	<span style="width:45px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Floor}</span>
 					  	<span style="width:55px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Ho}</span>	
						
						</div>	
						
						        
						<div class="value_object" style="display: table-cell; width: 370px; height:60px; font-size: 20px; overflow: scroll;">
		
						<span class="address_view" style="width:370px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_B_Address}</span>
			
						<span class="content_view" style="width:370px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center; overflow: scroll;">${object_list.OB_Content}</span>	
						
						
						<span class="py_tel_view" style="width:80px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center; overflow: scroll;">${object_list.OB_Pyeong}</span>
						<span class="py_tel_view" style="width:290px; height: 60px; border: 1px solid #d3caca; display: table-cell; vertical-align: middle; text-align: center; overflow: scroll;">
							주)${object_list.OB_Lessor_Tel}<br>세)${object_list.OB_Tenant_Tel}						
						</span>
						
						
						<span class="price_view" style="width:80px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Dealing_Cost}</span>
						<span class="price_view" style="width:77px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center; table-layout: fixed;">${object_list.OB_Deposit}</span>
						<span class="price_view" style="width:65px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Month_Cost}</span>
						<span class="price_view" style="width:65px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Maintenance_Cost}</span>
						<span class="price_view" style="width:80px; height: 60px; border: 1px solid #d3caca;  display: table-cell; vertical-align: middle; text-align: center;">${object_list.OB_Premium_Cost}</span>
						</div>
						
						<div style="width: 45px; height: 60px; font-size: 22px; display: table-cell;">		
						<span class="view_form" data-value="${object_list.OB_Num}" style="width:70px; height: 60px; border: 1px solid #d3caca; display: table-cell; text-align: center;"><img src="resources/img/list.JPG" style="width: 35px; height: 45px;"></span>	
						</div>		
												
						
						
						
						
										  
					 
					  </div>	
					 </c:forEach>

					
					
					
					
					
	
					
					</div> 
					
					
					
					
					
					
					<div class="paging_area" data-value ="${Tel}">
					 <div class="paging_t" style="display:flex;">
					 	<div class="interest">
					 	
					 	
					 	<c:if test="${Tel eq '0'}">
					 	
					 	<c:if test="${S_Title == 0}">
					 	<input type="button" onclick="Storage_page()" value="관심매물등록">
					 	</c:if>
					 	
					 	<c:if test="${S_Title != 0}">
					 	<input class="S_Title" type="button" onclick="add_ob()" value="관심매물추가" data-value="${S_Title}">
					 	</c:if>
					 	
					 	</c:if>
					 	
					 	<c:if test="${Tel ne '0'}">
					 	<input class="Tel" type="button" onclick="C_add_ob()" value="고객매물추가" data-value="${Tel}">
					 	</c:if>
					 	
					 	
					 	
					 	
					 	
					 	</div>
						<div class="paging" style="width: 84%;">
							<c:if test="${startpage !=1}">
							<span><a href="list?Nextpage=-10&startpage=${startpage}&ListOption=${ListOption}"style="width: 40px;">이전</a></span>
							</c:if>
							<c:if test="${endpage < pagelist}">
								<c:set var="Page_end" value="${endpage}"></c:set>
							</c:if>
							<c:if test="${endpage > pagelist}">
								<c:set var="Page_end" value="${pagelist}"></c:set>
							</c:if>
							<c:forEach var="PagNum" begin="${startpage}" end="${Page_end}" step="1">
							
							<c:if test="${list_filter == 'list'}">
							<span><a class="pag_bt">${PagNum}</a></span>
							</c:if>
							<c:if test="${list_filter == 'no'}">
			
							<span><a class="pag_bt_f">${PagNum}</a></span>
							</c:if>
							
							</c:forEach>
							
							<c:if test="${endpage > pagelist}">
							
							<c:if test="${list_filter == 'list'}">
							<span><a href="list?Nextpage=10&currentpage=${startpage+10}&ListOption=${ListOption}&startpage=${startpage}" style="width: 40px;">다음</a></span>
							</c:if>
							
							<c:if test="${list_filter == 'no'}">
							<span class="pag_bt_f_n" style="width: 40px;">다음</span>
							</c:if>
							
							</c:if>
						</div>
						<div class="but_2">
							<input type="button" value="기본" name="bt">
							<input type="button" value="방문" name="bt">
							<input type="button" value="보류" name="bt">
							<input type="button" value="계약" name="bt">
							<input type="button" class="update_form" value="수정">
							<input type="button" value="삭제" onclick="delete_object()">
							
						
						</div>
					   </div>	
						
						<div class=s_title>
							<p>소속매물</p>
						</div>
					
					
					</div>
					
					
					<div class="s_list">
						<div class="s_list_title">
						<table class="s_table">
						
				        		<thead>
				        			<tr class="th_tr" style="height: 25px;">
							 		<th class="ste1"><input type="checkbox" id="checkall" name="check"></th> 
							 		<th class="ste2">번호</th>
							 		<th class="ste3">접수일자</th>
							 		<th class="ste4">종류</th>
							 		<th class="ste5">전월세</th>
							 		<th class="ste6">동</th>
							 		<th class="ste7">건물/업체명</th>
							
							
							
							 		<th class="ste8">${address} 주소</th>
							 		
							 		
							 		
							 		<th class="ste9">층수</th>
							 		<th class="ste10">호수</th>
							 		
							 		<th class="ste11">평</th>
							 		
							 		<c:if test="${ListOption eq 'Officetel' || ListOption eq 'Villa' || ListOption eq 'Apartment' || ListOption eq 'Shop' || ListOption eq 'Shop_House'}">
							 		<th class="ste16">매매가</th>
							 		</c:if>
							 		<c:if test="${ListOption eq 'Shop' || ListOption eq 'Shop_House' || ListOption eq 'Officetel'}">
							 		<th class="ste15">권리금</th>
							 		</c:if>
							 		<th class="ste12">보증금</th>
							 		<th class="ste13">월세</th>
							 		<th class="ste14">관리비</th>
							 		<th width="*">메모</th>
							 		<th class="ste17">전화번호</th>
							 		<th class="ste18">상세</th>
							 	</tr>
							 	</thead>

										
							</table>
							</div>		
							
							<div class="s_list_content">
								<table class="s_table_con">


									
									
									
							 	</table>
							</div>									
					</div>
					
					
					
					<div class="s_list_m">
					
					 	<div class="m_list_th" style="display: flex; font-size: 26px; text-align: center; width: 980px;">
 					  	<p style="width:20px; height: 40px; border: 1px solid white; background:#67229f; color: white; font-weight: bold;"><input type="checkbox" id="checkall" name="check"></p>
 					  	<p style="width:100px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold; overflow: auto;">종류</p>
 					  	<p style="width:65px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">전월</p>
 					  	<p style="width:115px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">동</p>
 					  	<p style="width:165px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">건물명</p>
 					  	<p style="width:45px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">층</p>
 					  	<p style="width:55px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">호</p>
 					  	
 						<p class="address_view" style="width:375px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">주소</p>
 						<p class="content_view" style="width:375px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">메모</p>

						 <p class="py_tel_view" style="width:80px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">평</p>
 					  	 <p class="py_tel_view" style="width:295px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">연락처</p>


						 <p class="price_view" style="width:80px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">매매</p>
 					  	 <p class="price_view" style="width:80px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">보증</p>
 					  	 <p class="price_view" style="width:65px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">월세</p>
 					  	 <p class="price_view" style="width:65px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">관리</p>
 					  	 <p class="price_view" style="width:80px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">권리</p>
 					  	
 					  	
 					  	<p style="width:45px; height: 40px; border: 1px solid white; background: #67229f; color: white; font-weight: bold;">m</p>
					
					
					
						</div>
					
					
					
					
					
					
					
					
					<div class="s_list_v" style="">
					
					
					</div>
					
					
					
					
					
					
					
					
					
				
				</div>
				
			</div>
			
			

		</div>
		
	</body>
</html>