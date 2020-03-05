package com.real_estate.agent.dao;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Schedule_VO;
import com.real_estate.agent.model.file_LIst;
import com.real_estate.agent.model.file_path;
import com.real_estate.agent.model.ob_select_dong_list;
@Service
public class Object_List_ServiceImpl implements Object_List_Service {

	@Autowired
	private Object_List_DaoImpl Object_List_DAO;
	
	@Override
	public List<Object_List> getObject_List(Map map) throws Exception {
		return Object_List_DAO.getObject_List(map);
		
		
	}

	@Override
	public List<Object_List> getSubList(Map map) throws Exception {
		return Object_List_DAO.getSubList(map);
	}
	
	@Override
	public Object_List getbo_View(Map map) throws Exception{
		return Object_List_DAO.getbo_View(map);
	}
	
	
	@Override
	public List<Object_List> get_filter_List(Map map) throws Exception {
		return Object_List_DAO.get_filter_List(map);
	}

	@Override
	public int getObfect_Count(Map map) throws Exception {
		return Object_List_DAO.getObject_Count(map);
	}
	
	@Override
	public int getObfect_filter_Count(Map map) throws Exception {
		return Object_List_DAO.getObfect_filter_Count(map);
	}
	@Override
	public int getObfect_last_List(Map map) throws Exception {
		return Object_List_DAO.getObfect_last_List(map);
	}
	
	@Override
	public void insert_Object_List(Map map) throws Exception {
		 Object_List_DAO.insert_Object_List(map);
	}
	
	@Override
	public void insert_Obfiles(Map map) throws Exception {
		Object_List_DAO.insert_Obfiles(map);
	}

	
	public List<file_path> getFile_List(Map map)throws Exception{
		return	Object_List_DAO.getFile_List(map);
	}

	@Override
	public void delete_object(Map map) throws Exception {
		Object_List_DAO.delete_object(map);
		
	}

	@Override
	public void update_ob_state(Map map) throws Exception {
		Object_List_DAO.update_ob_state(map);
		
	}

	@Override
	public void update_object(Map map) throws Exception {
		Object_List_DAO.update_object(map);
		
	}

	@Override
	public List<ob_select_dong_list> dong_list(Map map) throws Exception {
		return Object_List_DAO.dong_list(map);
	}

	@Override
	public int get_obf_num(Map map) throws Exception {
		return Object_List_DAO.get_obf_num(map);
	}

	
}
