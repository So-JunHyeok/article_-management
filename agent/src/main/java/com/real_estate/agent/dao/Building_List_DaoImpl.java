package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real_estate.agent.model.BL_Type;
import com.real_estate.agent.model.Building_List;
import com.real_estate.agent.model.bl_file_path2;
import com.real_estate.agent.model.file_path;
import com.real_estate.agent.model.ob_select_dong_list;

@Repository
public class Building_List_DaoImpl {

@Autowired	
private SqlSessionTemplate sqlSession;		

public Building_List getBuilding_List(Map map)throws Exception {
	return sqlSession.selectOne("getBuilding_List", map);
}

public int getgetBuilding_List_Count(Map map) throws Exception {
	return sqlSession.selectOne("get_Building_List_Count", map);
}

public void insert_Building(Map map)throws Exception{
	sqlSession.insert("insert_building", map);
}


public void insert_blfiles(Map map) throws Exception {
	sqlSession.insert("insert_blfiles", map);
	
}


public int getblfile_in_num(Map map) throws Exception {

	return sqlSession.selectOne("get_bl_inset_num", map);
}


public List<bl_file_path2> getbl_file_path(Map map) throws Exception {
	
	return sqlSession.selectList("get_blfile_list", map);
}

public int getbl_List_count(Map map)throws Exception{
	return sqlSession.selectOne("get_bl_list_count", map);
}

public int getbl_List_min(Map map)throws Exception{
	return sqlSession.selectOne("getBuilding_List_min", map);
}
public Building_List getbl_List_search(Map map)throws Exception{
	return sqlSession.selectOne("getBuilding_search", map);
}
public void update_bl_list(Map map) throws Exception{
	sqlSession.update("update_bl_list", map);
}
public void delete_bl_list(Map map) throws Exception{
	sqlSession.delete("delete_bl_list", map);
}

public List<file_path> get_bl_file_list(Map map)throws Exception{
	return sqlSession.selectList("get_bl_file_list", map);
}

public void delete_bl_files(Map map)throws Exception{
	sqlSession.delete("delete_bl_files", map);
}

public String select_bl_num_img(Map map)throws Exception{
	return sqlSession.selectOne("get_bl_num_img", map);
}

public List<file_path> get_bl_file_img(Map map)throws Exception{
	return sqlSession.selectList("get_bl_file_img", map);
}

public int get_blf_num(Map map) throws Exception{
	return sqlSession.selectOne("get_blf_num", map);
}

public List<BL_Type>get_Type_list(Map map) throws Exception{
	return sqlSession.selectList("select_type_List", map);
}

public List<Building_List> get_building_List(Map map) throws Exception{
	return sqlSession.selectList("get_bl_list", map);
}



}
