<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>	
  <script src='js/jquery-3.4.1.min.js'></script>
<script type="text/javascript">

$(document).ready(function(){
	var kind = window.opener.bl_kind;
	var ob_kind = window.opener.ob_p_kind;	
	var sc_kind = window.opener.sc_p_kind;	
	var num = window.opener.up_num;
	
	var state = window.opener.state;
	

	var add = window.opener.img_add;
	
	var year = window.opener.in_year;
	var month = window.opener.in_month;
	var day = window.opener.in_day;
	
	var bl_Num = window.opener.bl_Num_img;
	
	var bl_search = window.opener.search
	var bl_select = window.opener.select
	
	

	
	if(kind =="update"){
		location.href = "../building_popup?kind="+kind+"&up_num="+num;
	}
	if(kind == "insert"){
		location.href = "../building_popup";	
	}
	if(ob_kind == "ob_insert"){
		location.href = "../object_form_popup";	
	}
	
	
	
	if(sc_kind == "sc_insert"){
		location.href = "../write_schedule?year="+year+"&month="+month+"&day="+day;
	}
	
	if(sc_kind == "sc_update"){
		location.href = "../write_schedule?kind="+sc_kind+"&up_num="+num;
		
	}
	
	if(kind == "bl_img"){
		location.href = "../bl_add_img?BL_Num="+bl_Num;
	}
	
	if(ob_kind == "ob_view"){
		location.href = "../view_form?Ob_num="+num;
	}
	
	if(kind == "search_b"){
		location.href = "../search_building?search_select="+bl_select+"&search="+bl_search+"&state="+state;
	}
	
	
});




</script>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>




</body>
</html>