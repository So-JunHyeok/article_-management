<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>	
  <script src='resources/js/jquery-3.4.1.min.js'></script>
  
  
  <script type="text/javascript">
 	
  var view = "${view}";
  var sc_year = "${year}";
  var sc_month = "${month}";
  var sc_day = "${day}";
  var up_in;
  var clo = 0;
  var OB_Num = "${ob_num}";


  
  $(document).ready(function(){
		
	  if(view == "schedule"){
		  opener.location.href = "schedule?up_in=ok&Set_year="+sc_year+"&Set_month="+sc_month+"&Set_day="+sc_day;
		  clo++
	  }
	  if(view == "object_write"){
		/*   opener.location.href = "list"; */
		opener.window.location.reload(true);
		  clo++
	  }
	  if(view == "add_img"){
		  opener.location.reload(true);
		  clo++
	  }
	  
	  
	  if(view == "bliding_insert"){
		  opener.location.href = "building_nhn";
		  clo++		  
	  }
	  if(view == "bliding_update"){
		  opener.location.href = "building_nhn";
		  clo++		  
	  }
	  if(view == "object_update"){
		  opener.location.href = "list";
		  clo++		  
	  }
	  
	  if(clo == 1){
		  window.close();
	  }
  });
  
 
  
  
  
  </script>
  
  
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


</body>
</html>