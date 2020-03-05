package com.real_estate.agent.dao;

import java.util.List;


import java.util.Map;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Schedule_VO;

public interface Schedule_Service {

	
	public List<Schedule_VO> get_Month_Schedule_List(Map map)throws Exception;
	public List<Schedule_VO> get_Day_Schedule_List(Map map)throws Exception;
	public int get_Month_Schedule_Count(Map map)throws Exception;
	public void Insert_Schedule(Map map)throws Exception; 
	public void update_Schedule(Map map)throws Exception;
	public void delete_Schedule(Map map)throws Exception;
	public Schedule_VO get_sc_num_schedule(Map map)throws Exception;

	
}
