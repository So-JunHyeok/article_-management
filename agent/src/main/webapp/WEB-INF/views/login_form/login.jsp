<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/loginform.css">
<script src='resources/js/jquery-3.4.1.min.js'></script>
<script type="text/javascript">


document.cookie = "Name=";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body style="height: 100%">




	<div class="wrap" style="width: 100%; height: 100%;">
	
		<div class="baner" style="width: 100%; height: 100%; position: relative;">
		<img alt="" src="resources/img/intro2.jpg" style="width: 100%; height: 100%;"> 
			<div class="cobar" style="width: 100%; height: 100%; position: absolute; top: 0px; left: 0px; background: black; opacity: 0.5"></div>
			<form action="login" method="post" role="form">
			<div class="login" >
			  <div class="login_area">	
				<br>
				<br>
				<br>
				<div style="width: 100%; height: 100px;"><img src="resources/img/nlogo.JPG" style="width: 100%; height: 100%;"></div>
				<hr>
				<br>
				<div style="text-align: center;"><h1 style="color: gray; font-weight: normal;">Sing in</h1></div>
				<br>
				<p>아이디</p>
				<div><input name="Mb_id" type="text"></div>
				<br>
				<p>비밀번호</p>
				<div><input name="Mb_pass" type="password"></div>
				<br>
				<br>
				<div><input type="submit" value="로그인" style="width: 100%; height: 50px;"></div>
			  </div>	
			</div>
			</form>
		</div>
	
	
	
	
	
	</div>





</body>
</html>