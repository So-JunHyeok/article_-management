package com.real_estate.agent.dao;

import java.util.List;




import java.util.Map;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Schedule_VO;
import com.real_estate.agent.model.file_LIst;
import com.real_estate.agent.model.file_path;
import com.real_estate.agent.model.ob_select_dong_list;

public interface Object_List_Service {

	
	public List<Object_List> getObject_List(Map map)throws Exception;
	
	public List<Object_List> getSubList(Map map)throws Exception;
	
	public Object_List getbo_View(Map map)throws Exception;
	
	public List<Object_List> get_filter_List(Map map)throws Exception;
	
	public int getObfect_Count(Map map)throws Exception;
	
	public int getObfect_filter_Count(Map map)throws Exception;
	
	public void insert_Object_List(Map map) throws Exception;
	
	public void insert_Obfiles(Map map) throws Exception;
	
	public int getObfect_last_List(Map map) throws Exception;
	
	public List<file_path> getFile_List(Map map)throws Exception;
	
	public void delete_object(Map map) throws Exception;
	
	public void update_ob_state(Map map) throws Exception;
	
	public void update_object(Map map) throws Exception;
	
	public List<ob_select_dong_list> dong_list(Map map) throws Exception;
	
	public int get_obf_num(Map map) throws Exception;

}
