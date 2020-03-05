package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Storage_List;
@Service
public class Stroage_ServiceImpl implements Stroage_Service {

	@Autowired
	private Stroage_DaoImpl stroage_DAO;
	
	@Override
	public List<Object_List> getOb_list_stroage(Map map) {
	return stroage_DAO.getOb_list_stroage(map);
	}

	@Override
	public void insert_Stroage(Map map) {
	stroage_DAO.insert_Stroage(map);
		
	}

	@Override
	public int getStorage_Title_count(Map map) {
		return stroage_DAO.getStorage_Title_count(map);
	}

	@Override
	public List<Storage_List> getStorage_List(Map map) {
		return stroage_DAO.getStorage_List(map);
	}

	@Override
	public void delete_Storage(Map map) {
		System.out.println("µµÂø");
		stroage_DAO.delete_Storage(map);
		
	}

	@Override
	public int getStorage_Title_count_min(Map map) {
		return stroage_DAO.getStorage_Title_count_min(map);
	}

	@Override
	public int getStorage_List_Count(Map map) {
		
		return stroage_DAO.getStorage_List_Count(map);
	}

	@Override
	public void update_S_State(Map map) {
		stroage_DAO.update_S_State(map);
		
	}

	@Override
	public void update_object(Map map) {
		stroage_DAO.update_object(map);
		
	}


	
	
	

}
