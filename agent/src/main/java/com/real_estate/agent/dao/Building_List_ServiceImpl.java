package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real_estate.agent.model.BL_Type;
import com.real_estate.agent.model.Building_List;
import com.real_estate.agent.model.bl_file_path2;
import com.real_estate.agent.model.file_path;
@Service
public class Building_List_ServiceImpl implements Building_ListService {
	
	@Autowired
	private Building_List_DaoImpl Building_List_Dao;
	
	//건물리스트 select
	@Override
	public Building_List getBuilding_List(Map map)throws Exception {
		return Building_List_Dao.getBuilding_List(map);
	}

	@Override
	public int getgetBuilding_List_Count(Map map) throws Exception {
		return Building_List_Dao.getgetBuilding_List_Count(map);
	}

	@Override
	public void insert_Building(Map map)throws Exception{
		Building_List_Dao.insert_Building(map);
	}

	@Override
	public void insert_blfiles(Map map) throws Exception {
		Building_List_Dao.insert_blfiles(map);
		
	}

	@Override
	public int getblfile_in_num(Map map) throws Exception {
		return Building_List_Dao.getblfile_in_num(map);
	}

	@Override
	public List<bl_file_path2> getbl_file_path(Map map) throws Exception {
		
		return Building_List_Dao.getbl_file_path(map);
	}

	@Override
	public int getbl_List_count(Map map) throws Exception {
		return Building_List_Dao.getbl_List_count(map);
	}

	@Override
	public int getbl_List_min(Map map) throws Exception {
		return Building_List_Dao.getbl_List_min(map);
	}

	@Override
	public Building_List getbl_List_search(Map map) throws Exception {
		return Building_List_Dao.getbl_List_search(map);
	}

	@Override
	public void update_bl_list(Map map) throws Exception {
		Building_List_Dao.update_bl_list(map);
		
	}

	@Override
	public void delete_bl_list(Map map) throws Exception {
		Building_List_Dao.delete_bl_list(map);
		
	}

	@Override
	public List<file_path> get_bl_file_list(Map map) throws Exception {
		return Building_List_Dao.get_bl_file_list(map);
	}

	@Override
	public void delete_bl_files(Map map) throws Exception {
		Building_List_Dao.delete_bl_files(map);
		
	}

	@Override
	public String select_bl_num_img(Map map) throws Exception {
	
		return Building_List_Dao.select_bl_num_img(map);
	}

	@Override
	public List<file_path> get_bl_file_img(Map map) throws Exception {
		return Building_List_Dao.get_bl_file_img(map);
	}

	@Override
	public int get_blf_num(Map map) throws Exception {
		return Building_List_Dao.get_blf_num(map);
	}

	@Override
	public List<BL_Type>get_Type_list(Map map) throws Exception {
		return Building_List_Dao.get_Type_list(map);
	}

	@Override
	public List<Building_List> get_building_List(Map map) throws Exception {
		return Building_List_Dao.get_building_List(map);
	}
	
	
}
