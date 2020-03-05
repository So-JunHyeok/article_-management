package com.real_estate.agent.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.real_estate.agent.dao.Schedule_Service;
import com.real_estate.agent.model.Schedule_VO;

@Controller
public class Schedule_Action {
	
@Autowired

private Schedule_Service scheduleservice;

	// 변수 선언
	// 기본 달력 변수
		Calendar today = null;
		int year = 0;
		int month = 0;
		int firstDay = 0;
		int lastday = 0;
		int tod = 0;
		int dayOfMonth =0;
		int date = 1;
	    String scheduler[] = new String[32];
		
		
	// 달력 앞뒤 이동 변수	
		int set_year = 0;
		int set_month = 0;
		int set_date = 0;
		int schedule_count;
		String schedule ="";
		String schedule_box ="";
		List<Schedule_VO>  st;
		
		
		
		
		
		
		@RequestMapping(value="write_schedule")
		public ModelAndView sc_popup_view(
				@RequestParam(value="kind", defaultValue="sc_insert")String kind,
				@RequestParam(value="up_num", defaultValue="0")String up_num,
				@RequestParam(value="year", defaultValue="0")String year,
				@RequestParam(value="month", defaultValue="0")String month,
				@RequestParam(value="day", defaultValue="0")String day
						)throws Exception {
			ModelAndView mv = new ModelAndView();
				
			

			
			Map map = new HashMap();
			
			if("sc_update".equals(kind)) {
				map.put("SC_Num", up_num);
				Schedule_VO schedlue_one = scheduleservice.get_sc_num_schedule(map);
		/*		System.out.println(schedlue_one.getSC_Title());*/
				 mv.addObject("update", schedlue_one);	
				 mv.addObject("sc_kind", kind);	
			}
			else {
				 mv.addObject("year", year);	
				 mv.addObject("month", month);	
				 mv.addObject("day", day);	
				 mv.addObject("sc_kind", kind);	
			}
				
				mv.setViewName("popup/schedule_write");
			
			return mv;
		}
		
		
		
		
		
		
		
		@RequestMapping(value="schedule", method=RequestMethod.GET)
		public ModelAndView schedule(
				@RequestParam(value="up_in", defaultValue="no")String up_in,
				Model model,
				@RequestParam(value="MoveMonth", defaultValue="mid")String MoveMonth,		
				@RequestParam(value="Set_year", defaultValue="0")int Set_year,		
				@RequestParam(value="Set_month", defaultValue="0")int Set_month,		
				@RequestParam(value="Set_day", defaultValue="0")int Set_day		
				)throws Exception {
			
			ModelAndView mv = new ModelAndView();
			Map map = new HashMap();
			// 캘린더 객체 생성
			today = Calendar.getInstance();
			// 캘린더 년, 월, 일 세팅			
				if("Next".equals(MoveMonth) ) {
					if(Set_month < 12)
					today.set(Calendar.MONTH,Set_month);
					today.set(Calendar.YEAR,Set_year);
					if(Set_month == 12) {
					today.set(Calendar.YEAR,Set_year+1);
					today.set(Calendar.MONTH,0);
					}
					today.set(Calendar.DATE,1);
				}
				if("Prev".equals(MoveMonth) ) {
					if(Set_month > 1)
					today.set(Calendar.MONTH,Set_month-2);
					today.set(Calendar.YEAR,Set_year);
					if(Set_month == 1) {
					today.set(Calendar.YEAR,Set_year-1);
					today.set(Calendar.MONTH,11);
					}
					today.set(Calendar.DATE,1);
				}				
				year = today.get(Calendar.YEAR);
				month =today.get(Calendar.MONTH)+1;
				date = today.get(Calendar.DATE);
				Calendar cal = new GregorianCalendar(year, month-1, date);
				lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				dayOfMonth = today.get(Calendar.DAY_OF_WEEK);
				map.put("sc_year", year);
				map.put("sc_month", month);
				schedule_count = scheduleservice.get_Month_Schedule_Count(map);
				st = scheduleservice.get_Month_Schedule_List(map);	
				
				mv.addObject("schedule_count", schedule_count);
		    	mv.addObject("up_in", up_in);
			    mv.addObject("Set_year", year);
			    mv.addObject("Set_day", date);
			    mv.addObject("Set_month", month);
			    mv.addObject("st", st);
				mv.addObject("date", date);
				mv.addObject("dayOfMonth", dayOfMonth);
				mv.addObject("lastday", lastday);
			    mv.setViewName("sec/schedule");
				    
			return mv;
		}	
			
		
		
		
		
		@RequestMapping(value="day_schedule")
		@ResponseBody 
		public Map<String, Object> schedule_data(		
				@RequestParam(value="Set_year", defaultValue="0")int Set_year,		
				@RequestParam(value="Set_month", defaultValue="0")int Set_month,		
				@RequestParam(value="Set_day", defaultValue="0")int Set_day		
				)throws Exception {
			Map map = new HashMap();
			// 캘린더 객체 생성
			today = Calendar.getInstance();
			System.out.println("year"+Set_year);
			map.put("sc_year", Set_year);
			map.put("sc_month", Set_month);
			map.put("sc_day", Set_day);
		
				
			List<Schedule_VO> day_sc = scheduleservice.get_Day_Schedule_List(map);

			HashMap<String, Object> result = new HashMap<String, Object>();
			
			result.put("listkey1", day_sc);
			
			return result;
		}
		
		@RequestMapping(value="tttt")
		@ResponseBody 
		public Map<String, Object> schedule_ttt(		
				@RequestParam(value="a_year", defaultValue="0")int a_year,		
				@RequestParam(value="a_month", defaultValue="0")int a_month,
				@RequestParam(value="n", defaultValue="0")int n		
				)throws Exception {
			Map map = new HashMap();
			// 캘린더 객체 생성
			today = Calendar.getInstance();
			
			map.put("sc_year", a_year);
			map.put("sc_month", a_month);
			
			st = scheduleservice.get_Month_Schedule_List(map);
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			
			result.put("listkey", st);
			
			return result;
		}
		
		
	
		
		@RequestMapping(value="schedule_Insert")
		public ModelAndView Insert_schedule(
				@ModelAttribute Schedule_VO Schedule_VO
				)throws Exception {
			Map map = new HashMap();

			
		   
			map.put("schedule_vo", Schedule_VO);
			scheduleservice.Insert_Schedule(map);	
			
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("view", "schedule");
			mv.addObject("year", Schedule_VO.getSC_Year());
			mv.addObject("month", Schedule_VO.getSC_Month());
			mv.addObject("day", Schedule_VO.getSC_Day());
			mv.setViewName("popup/success");
			
	
			return mv;	
		
		}
		
		
		
		@RequestMapping(value="schedule_update")
		public ModelAndView schedule_update(
				@ModelAttribute Schedule_VO Schedule_VO
				)throws Exception {
			Map map = new HashMap();

		   
			map.put("schedule_vo", Schedule_VO);
			scheduleservice.update_Schedule(map);
			
	
			ModelAndView mv = new ModelAndView();
			mv.addObject("view", "schedule");
			mv.addObject("year", Schedule_VO.getSC_Year());
			mv.addObject("month", Schedule_VO.getSC_Month());
			mv.addObject("day", Schedule_VO.getSC_Day());
			mv.setViewName("popup/success");
			
			return mv;
		
		}
		
		@RequestMapping(value="delete_schedule")
		public String delete_schedule(
				@RequestParam(value="SC_Num")int SC_Num
				)throws Exception {
			Map map = new HashMap();
			
		
			
			map.put("SC_Num", SC_Num);
			scheduleservice.delete_Schedule(map);
			
			return "redirect:schedule";	
			
		}
	
}
