<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
<html>
	<head>
	   <script src='resources/js/jquery-3.4.1.min.js'></script>
	<!-- <script type="text/javascript" src="resources/js/calender.js"></script> -->
		<link rel="stylesheet" href="resources/css/schedule.css">
		<script src='resources/js/calender.js'></script>
	     <script src='resources/js/cookie.js'></script>



	

		<script type="text/javascript">
		
		

			
    	var today = null;
    	var sc_day = null;
		var sc_year = null;
		var sc_month = null;
		var lastDay_t ="";
		var lastDay ="";
		var year = 0;
		var month = 0;
		var day = 0;
		var schedule_div = "${up_in}";
		
		
		var in_day = "";
		var in_month ="";
		var in_year = "";
		var kind = "";
		var sc_p_kind ="";
		
		var v_index;
		var box_index;
		
		var chack_num = 0;
		var chack_time;
		var chack_minute;
		var chack_content;
		var chack_title;
		var chack_tel;
		var chack_name;
		var chack_kind;
		var up_num;
		
		
		
		var scheduler = new Array();
		
		var date = "${date}";
		var dayOfMonth ="${dayOfMonth}";
		var dada = 0;
		var dayCount = 0;
		var schedule_count = "${schedule_count}";
		var st_size = "${st.size()}";
		var d;
		var c ="";
		var b = "";
		var schedule ="";
		var schedule_box ="";
		var lastday = "${lastday}";
	
		
		
		function sc_popup(){
			var url = "resources/test.jsp";
            var name = "스케줄 등록";
            var option = "width = 400, height = 500, top = 100, left = 200, location = no"
			var openWin = window.open(url, name, option);
		}
		
		
		
		
		
		function week_num(){
			for(var i = date; i >= 1; i--) {
				dada = dayOfMonth;
				--dayOfMonth;
				if(dayOfMonth == 0) {
					dayOfMonth = 7;
				}
				
			}
		}
		
		 		
		function day_scheduler_count(){
			week_num()
			var s_days ="";
			dayCount = 0;
			var setTableHTML = "";
			var j_Ste = 7;
			var SC_Title = "";
			var j = 1;
			
			setTableHTML+="<table class='calender'>";
			setTableHTML+="<tr><th>SUN</th><th>MON</th><th>TUE</th>"
			+"<th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>";
			for(var i =0; i<6; i++){
				setTableHTML+="<tr height='100'>";
				if(i == 5) {j_Ste = 2;}	
					for(j=1; j<=j_Ste; j++){
						if(i == 0) {
							if(j >= dada) {++dayCount; s_days = dayCount;}
							if(j < dada){s_days ="";}
						  }
					else {
						
						if(dayCount > lastday) {s_days ="";}
						if(dayCount < lastday) {dayCount++; s_days = dayCount}
						if(dayCount == lastday) {s_days = dayCount; dayCount++;}
					}
						
			setTableHTML+="<td class='day_td' style='width:12%;"
			+"text-overflow:ellipsis;overflow:hidden;white-space:nowrap'>";
			setTableHTML+="<div class='cal-day'><br>"+s_days+"</div>";
			setTableHTML+="<div style='height:65%' class='cal-schedule"+s_days+"'></div>";	
			setTableHTML+="</td>";
			}
			setTableHTML+="</tr>";
			}
			setTableHTML+="</table>";
			schedule ="";
			$(".schedule_div").append(setTableHTML);
			}
				
		
		
		
		
		
		
		
		
		 		function tttt(){
					var a_year = "${Set_year}";
					var a_month = "${Set_month}"
					var a_day = "${Set_day}"
					var sch = 0;
	 				$.ajax({
						type : "GET",	
						dataType : "json",
						url : "tttt",
						data : {a_year: a_year, a_month: a_month},
						success : function(data) {
			 				$.each(data, function(key, value){
			 					console.log(key, value)
			 					$.each(value, function(list_key, list_value){
									var a_day = list_value.sc_Day;
									var a_title = list_value.sc_Title;
									var a_kind = list_value.sc_Kind;
									var b = "";
									
					 				if(a_kind == "방문"){b = "#daeef3";}
					 				if(a_kind == "계약"){b = "#ccc0da";}
					 				if(a_kind == "잔금"){b = "#da9694";}
					 				var cal_schedule = "<p class='ti'"
					 				+"style=background:"+b+";>"+a_title+"</p>";	
									$(".cal-schedule"+a_day).append(cal_schedule);
									});
								}); 							
							}
					 	});	 				
					} 

		function update_schedule(){
			
			  up_num = chack_num;
			  sc_p_kind = "sc_insert";	
			  in_month =$('.month').text();
			  in_year = $('.year').text();
			  in_day = $('.day').text();
			  	


				if(chack_num == 0){
					alert("일정이 선택되지 않았습니다.");
		            
				}
				else{
					sc_p_kind = "sc_update";
					sc_popup();
		            
				}
				
			}

		
		
		
		function addschedule(){
			sc_p_kind = "sc_insert";
			  in_month =$('.month').text();
			  in_year = $('.year').text();
			  in_day = $('.day').text();
			  sc_kind = "sc_insert";
			  sc_popup();
		}
		
		function del_schedule(){
			var SC_Num = chack_num;

			if(SC_Num == "0"){
				alert("삭제할 스케줄을 선택하지 않았습니다.");
				
			}else{
				location.href = "delete_schedule?SC_Num="+SC_Num;
			}
			
			
		}
		
	    function schedule1() {
 	    	$('.data *').remove();
 	    	$('.today_content1 *').remove();
	    	var html = "";
	    	var string_to = "";
	    	var string_to_t = "";
			$.ajax({
				type : "GET",	
				dataType : "json",
				url : "day_schedule",
				data : {Set_year: sc_year, Set_month: sc_month, Set_day: sc_day},
				success : function(data) {
	 				$.each(data, function(key, value){
	 					$.each(value, function(list_key, list_value){					
							var num = list_value.sc_Num;
							var time = list_value.sc_Time;
							var title = list_value.sc_Title;
							var minute = list_value.sc_Minute;
							var kind = 	list_value.sc_Kind;
							var s_content = list_value.sc_Content;
							if(s_content == null){s_content = "";}
							var kind_color = "resources/img/w.png";
							if(kind == "방문"){kind_color = "resources/img/b.png";}
							if(kind == "계약"){kind_color = "resources/img/g.png";}
							if(kind == "잔금"){kind_color = "resources/img/j.png";}
							if(minute < 10){
								string_to = minute.toString();
								string_to = "0"+string_to;
							}
							else{string_to = minute;}
							if(time < 10){
								string_to_t = time.toString();
								string_to_t = "0"+string_to_t;
							}
							else{string_to_t = time;}
							var sc_Content = "";
							var sc_C_Tel = "";
							sc_C_Tel = list_value.sc_C_Tel;
							sc_Content = list_value.sc_Content;
							html = "";			
							var kind_img = '<img src='+kind_color+'>';
							var tmp_html = "";
							var div = '<div style="display: flex; height:50px;">';
	 						var sc = '<div class="sc" style= width: 100%;" data-value='+num+'>'
		 					var left = '<div class="left" style= width: 100%;" data-value='+string_to_t+' data-value1='+string_to+'><p>'+string_to_t+':'+string_to+'</p></div>'
							var right = '<div class="right"><div class="title"><div class="tit" style="display: flex;" data-value='+title+' data-value1='+kind+'>'
							+kind_img+'<p>'+title+'</p></div><div class="tel" data-value='+sc_C_Tel+'><p>'+sc_C_Tel+'</p></div>'
							+'</div></div>'
							var memo = '<span class="cs"><p>메모</p></span><span><p>'+s_content+'</p></span>';
							tmp_html = sc + div + left + right +'</div><div style="display: flex;>'+ memo +'</div></div>';
							html += tmp_html; 
							$('.today_content1').append(html);	
	 					});
	 				});	 				
			},
			error : function(e) {
                console.log(e.responseText);
			}
	    });
	    	set_year = "<h3 class='year'>"+sc_year+"</h3><span>년</span>";
	    	set_month = "<h3 class='month'>"+sc_month+"</h3><span>월</span>";
	    	set_day = "<h3 class='day'>"+sc_day+"</h3><span>일</span>";
	    	$('.data').append(set_year+set_month+set_day); 
	    
	    };
		

		
		$(document).ready(function(){
			sc_year = "${Set_year}";
			sc_month = "${Set_month}";
			sc_day = "${Set_day}";
			
			day_scheduler_count()
			tttt()
			schedule1();
			setCookie("Name", "");
			today = new Date();
			
			
			
			

			$('.day_td').on("click", function(){
				$('.day_td').css("border-color", "#f3f3f3");
				$(this).css("border-color", "#ccc0da");
				sc_year = $('.ym').attr("data-value");
				sc_month = $('.ym').attr("data-value1");
				sc_day = $(this).children('.cal-day').text();
			 	schedule1();
			});
			
			$("#Next").on("click", function(){

				year = $(".year").text();
				month = $(".month").text();
				day = $(".day").text();
				lastDay_t = new Date(year,month,0);
				lastDay = lastDay_t.getDate();
				Next();
			 	schedule1();
				
				});
			
			
			$("#Prve").on("click", function(){
				year = $(".year").text();
				month = $(".month").text();
				day = $(".day").text();
				lastDay_t = new Date(year,month,0);
				lastDay = lastDay_t.getDate()
				Prve();
				schedule1();
				
			});

			
				$(".sc_plues").mouseover(function(){
					var len = $(this).parent().children(".cal_sc").length;
					var di = "";
					var kind ="";
					var p = "";
					var b = "";
					for(var i = 0; i <len; i++){
						
					di = $(this).parent().children(".cal_sc").eq(i).text();
					kind = $(this).parent().children(".cal_sc").eq(i).attr("data-value");
					
					if(kind == "방문"){
						b = "#daeef3";	
					}
					if(kind == "계약"){
						b = "#ccc0da";	
					}
					if(kind == "잔금"){
						b = "#da9694";	
					}
					
					p += "<p style='background-color:"+b+";'>"+di+"</p>";
					}
					$(this).parent().append("<div class='add_sc'>"+p+"</div>");
					
				});
			
			
			
				$(".sc_plues").mouseleave(function(){
					$( 'div' ).remove( '.add_sc' );
					
					
				});
				
		});
		


		

		
		function Next(){

			if(day == lastDay){
				day = 1;
				if(month >= 12){
					month = 1;
					year++;
				}
				else{
					month++;
				}
				
			}
			else{
				day++;
			}
			
			sc_day = day;
			sc_year = year;
			sc_month = month;
	
		}
		
		function Prve(){
			if(day == 1){
				day = lastDay;
				if(month == 1){
					month = 12;
					year--;
				}
				else{
					month--;
				}
				
			}
			else{
				day--;
			}
			
			sc_day = day;
			sc_year = year;
			sc_month = month;	
			
		}
		
		

		
		
		function init(){
	    	sc_day = today.getDate();
			sc_year = today.getFullYear();
			sc_month = today.getMonth()+1;
			
		}
		

		

		
	    


	    
	    $(document).on("click",".sc", function(){
	    	$('.sc').css("background", "white");
	    	$('.sc').css("color", "black");
	    	v_index = $(this).index();
	    	alert(v_index);
	    	
	    	$('.sc').eq(v_index).css("background", "#3d1261");
	    	$('.sc').eq(v_index).css("color", "white");
	    	
	    	chack_num = $('.sc').eq(v_index).attr("data-value");
	    	chack_time = $('.sc').eq(v_index).children('.left').attr("data-value");
	    	chack_minute = $('.sc').eq(v_index).children('.left').attr("data-value1");
	    	chack_title = $('.sc').eq(v_index).find('.tit').attr("data-value");
	    	chack_tel = $('.sc').eq(v_index).find('.tel').attr("data-value");
	    	chack_content = $('.sc').eq(v_index).find('.content_ff').attr("data-value");
	    	chack_kind = $('.sc').eq(v_index).find('.tit').attr("data-value1");

	    	
	    });

	    
	    

	    
	    
	    
	    

	    	

	    	
	    
	    
	    
	    
	    
	    
		</script>


	</head> 
	<body>
		
		<div class="wrap" style="width: 100%; height: 100%;">
		
		<!-- 프로그램 상단 구성(메뉴바) -->
			<div class="header" style="width: 100%; height: 75px;">
				<jsp:include page="/resources/header.jsp"></jsp:include>
	        
	        </div>
			
			
			<div class="content">
				

				
				<div class="schedule_right">
					<div class="today_title">
						<div class="data_area">
						<div class="data" style="display: flex;"></div> 
						<a id="Prve">◀</a><a id="Next">▶</a>
						</div>
						
						<div class="but_e">
						<button onclick="addschedule()">추가</button>
						<button onclick="update_schedule()">수정</button>
						<button onclick="del_schedule()">삭제</button>
						</div>
			
					</div>
					
					<div class="today_content">
					<div class="today_sc"><p>오늘일정</p></div>
					<div class="today_content1">

										
					</div>

					
					</div>
				
				
				</div>

				
				<div class="schedule_left">
				<div class="calender_top" style="display: flex;">
				
				<div class="ym" style="display: flex;" data-value="${Set_year}" data-value1="${Set_month}">
				<h3 class="top_year">${Set_year}년</h3>
				<a href="schedule?MoveMonth=Prev&Set_year=${Set_year}&Set_month=${Set_month}"><img alt="" src="resources/img/left.png" style="margin-top: 10px;"></a>
				 <h2 class="top_month">${Set_month}월</h2>
				<a href="schedule?MoveMonth=Next&Set_year=${Set_year}&Set_month=${Set_month}"><img src="resources/img/Right.png" style="margin-top: 10px;"></a>
				</div>
				
				</div>				
					<div class="schedule_div">
					
					</div>	
				</div>	
			
			

		</div>
		</div>
		
	</body>
</html>

