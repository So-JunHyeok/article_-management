<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <script src='resources/js/jquery-3.4.1.min.js'></script>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/sc_write.css">	    
<script type="text/javascript">


var Kind = "${sc_kind}";

$(document).ready(function(){
	
	
	
	if(Kind == "sc_insert"){
		var day = "${day}";
		var month = "${month}";
		var year = "${year}";
		
		

		$('#in_year').val(year);
		$('#in_month').val(month);
		$('#in_day').val(day);

	}
	else{

	
		

		var num = "${update.SC_Num}";
		var day = "${update.SC_Day}";
		var month = "${update.SC_Month}";
		var year = "${update.SC_Year}";
		var time = "${update.SC_Time}";
		var minute = "${update.SC_Minute}";
		var content = "${update.SC_Content}";
		var title = "${update.SC_Title}";
		var tel = "${update.SC_C_Tel}";
		var bgs = "${update.SC_Kind}";
		var name = "${update.SC_C_Name}";
		
		
		$('#in_num').val(num);
		$('#in_year').val(year);
		$('#in_month').val(month);
		$('#in_day').val(day);
		$('#in_time').val(time);
		$('#in_minute').val(minute);
		$('#in_title').val(title);
		$('#in_name').val(name);
		$('#in_tel').val(tel);
		$('#in_content').val(content);
		$("#se").val(bgs).prop("selected", true);
		
		
	}

	
	
	
	
	

	
});



function popup(){
    var url = "succes.jsp";
    var name = "상세보기";
    var option = "width = 300, height = 100, left = 500, location = no"
    var openWin = window.open(url, name, option)
}


function clo(){
	openWin.close();
}


function schedule_page(){
	 
};



function schedule_update(){
	
};




</script>


</head>
<body>
<div class="wrap">
<div class="sc_title">
<p>스케줄 등록</p>
</div>
<c:if test="${sc_kind eq 'sc_insert'}">
<form action="schedule_Insert" name="formt">
</c:if>
<c:if test="${sc_kind eq 'sc_update'}">
<form action="schedule_update" name="formt">
</c:if>
<div class="ymd_form">
<input id="in_year" name="SC_Year" type="text" value=0><span>년</span>
<input id="in_month" name="SC_Month"  type="text" value=0><span>월</span>
<input id="in_day" name="SC_Day"  type="text" value=0><span>일</span>
<input id="in_time" name="SC_Time"  type="text" value=0><span>시</span>
<input id="in_minute" name="SC_Minute"  type="text" value=0><span>분</span><br>
<input id="in_num" name="SC_Num" type="hidden" value=0>
</div>


<div class="tc_form" style="margin-top: 15px;">
<p>내용</p>
<input id="in_title" type="text"  name="SC_Title" value="" style="width: 97%; height: 20px;">
</div>
<div class="in_n_t" style="display: flex;">




	<div style="margin-top: 25px;">
		<p>메모</p>
		<textarea id="in_content" name="SC_Content" rows="10" cols="30"></textarea>
	</div>

<div style="margin-left: 15px; margin-top: 25px;">
	<div class="nt1">
	<p>연락처</p>
	<input id ="in_tel" type="text"  name="SC_C_Tel" value="">
	</div>
	
	<div class="nt2" style="margin-top: 15px;">
		<p>종류</p>
			<select id="se"  name="SC_Kind">
			<option id="n" value="">선택없음</option>
			<option id="b" value="방문">방문</option>
			<option id="g" value="계약">계약</option>
			<option id="j" value="잔금">잔금</option>
			</select>
	</div>
	
	
	<div style="margin-top: 15px;">
	<c:if test="${sc_kind eq 'sc_insert'}">
	<input class="su_bt" type="submit" value="등록">
	</c:if>
	<c:if test="${sc_kind eq 'sc_update'}">
	<input class="su_bt_f" type="submit" value="수정">
</c:if>
	</div>
	
</div>	

	

	
</div>



</form>
</div>
</body>
</html>