package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Storage_List;

public interface Stroage_Service {
	
	public List<Object_List>getOb_list_stroage(Map map);
	public void insert_Stroage(Map map);
	public int getStorage_Title_count(Map map);
	public int getStorage_Title_count_min(Map map);
	public List<Storage_List> getStorage_List(Map map);
	public void delete_Storage(Map map);
	public int getStorage_List_Count(Map map);
	public void update_S_State(Map map);
	public void update_object(Map map);
	
}
