package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Schedule_VO;
@Service
public class Schedule_ServiceImpl implements Schedule_Service {

	@Autowired
	private Schedule_DaoImpl Schedule_DAO;
	
	@Override
	public List<Schedule_VO> get_Month_Schedule_List(Map map) throws Exception {
		
		return Schedule_DAO.get_Month_Schedule_List(map);
		
		
	}
	@Override
	public List<Schedule_VO> get_Day_Schedule_List(Map map) throws Exception {
		
		return Schedule_DAO.get_Day_Schedule_List(map);
		
		
	}
	@Override
	public int  get_Month_Schedule_Count(Map map) throws Exception {
		
		return Schedule_DAO.get_Month_Schedule_Count(map);
		
		
	}
	@Override
	public void Insert_Schedule(Map map) throws Exception {
		Schedule_DAO.Insert_Schedule(map);
		
	}
	@Override
	public void update_Schedule(Map map) throws Exception {
		Schedule_DAO.update_Schedule(map);
		
	}
	@Override
	public void delete_Schedule(Map map) throws Exception {
		Schedule_DAO.delete_Schedule(map);
		
	}
	@Override
	public Schedule_VO get_sc_num_schedule(Map map) throws Exception {

		return Schedule_DAO.get_sc_num_schedule(map);
	}
	
	
	
	
}
