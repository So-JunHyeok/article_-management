package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import com.real_estate.agent.model.BL_Type;
import com.real_estate.agent.model.Building_List;
import com.real_estate.agent.model.bl_file_path2;
import com.real_estate.agent.model.file_path;

public interface Building_ListService {
	
	public Building_List getBuilding_List(Map map)throws Exception;
	
	public int getgetBuilding_List_Count(Map map)throws Exception;
	
	public void insert_Building(Map map)throws Exception;
	
	public void insert_blfiles(Map map) throws Exception;
	
	public int getblfile_in_num(Map map)throws Exception;
	
	public List<bl_file_path2> getbl_file_path(Map map) throws Exception;

	
	public int getbl_List_count(Map map)throws Exception;
	
	public int getbl_List_min(Map map)throws Exception;
	
	public Building_List getbl_List_search(Map map)throws Exception;
	
	public void update_bl_list(Map map) throws Exception;
	
	public void delete_bl_list(Map map) throws Exception;
	
	public List<file_path> get_bl_file_list(Map map)throws Exception;
	
	public void delete_bl_files(Map map)throws Exception;
	
	public String select_bl_num_img(Map map)throws Exception;
	
	public List<file_path> get_bl_file_img(Map map)throws Exception;
	
	public int get_blf_num(Map map) throws Exception;
	
	public List<BL_Type>get_Type_list(Map map) throws Exception;
	
	public List<Building_List> get_building_List(Map map) throws Exception;
}
