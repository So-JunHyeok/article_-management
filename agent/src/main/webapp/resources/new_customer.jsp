<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <script src='js/jquery-3.4.1.min.js'></script>
<title>Insert title here</title>
<link rel="stylesheet" href="css/new_customer.css">	    
<script type="text/javascript">

var SC_Year = "";
var SC_Month = "";
var SC_Day = "";
var SC_Time = "";
var SC_Title = "";
var SC_C_Name ="";
var SC_C_Tel = "";
var SC_Content = "";
var SC_Kind = "";

$(document).ready(function(){
	var n_title = window.opener.Title;
	
	$('.title').val(n_title);
	
	
	
});

function popup_la(){
    var url = "succes.jsp";
    var name = "상세보기";
    var option = "width = 300, height = 100, left = 1000, location = no"
    var openWin = window.open(url, name, option).close();

}

function clo(){
	openWin.close();
}


function schedule_page(){
	var queryString = $("form[name=formt]").serialize();
	var ss = "no";
	if(ss == "no"){
	$.ajax({
		type : "GET",	
		url : "../New_insert_C_interest",
		data : queryString
		
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
<div class="sc_title">
<p>스케줄 등록</p>
</div>
<form action="" name="formt">

<div class="tc_form">
<p>고객연락처</p>
<input id="in_tn" type="text"  name="C_Tel" >
</div>
<div class="in_n_t" style="display: flex;">
	<div class="nt">
	<p>이름</p>
	<input type="text"  name="C_Name" >
	</div>
	
	<div class="nt">
	<p>나이</p>
	<input type="text"  name="C_Age" >
	</div>
	
	<div class="nt">
	<p>성별</p>
	<select  name="C_Gender" >
	<option>선택없음</option>
	<option>남자</option>
	<option>여자</option>
	</select><br><br>
	</div>
	
	
	

	
</div>

<div class="nt_form">
<p>기타 특이사항</p>
<input id="in_t" type="text"  name="C_Content" >
</div>

<input class="title" type="hidden" name="Title" value="">
<input class="su_bt" type="submit" value="등록" onclick="schedule_page();">
</form>
</div>
</body>
</html>