package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.file_LIst;
import com.real_estate.agent.model.file_path;
import com.real_estate.agent.model.ob_select_dong_list;

@Repository
public class Object_List_DaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	public List<Object_List>getObject_List(Map map)throws Exception {
		return sqlSession.selectList("getObject_List", map);
	}
	
	
	public List<Object_List> getSubList(Map map)throws Exception{
		return sqlSession.selectList("getSubList",map);
	}
	
	public Object_List getbo_View(Map map)throws Exception{
		return sqlSession.selectOne("getSubList",map);
	}
	

	public List<Object_List> get_filter_List(Map map) throws Exception {
		return sqlSession.selectList("get_filter_list", map);
		
		
	}
	
	public int getObject_Count(Map map) throws Exception {
		return sqlSession.selectOne("get_Object_Count", map);
	}
	
	public int getObfect_filter_Count(Map map) throws Exception {
		return sqlSession.selectOne("get_filter_list_count", map);
	}
	
	public int getObfect_last_List(Map map) throws Exception {
		return sqlSession.selectOne("get_Last_num", map);
	}
	
	public void insert_Object_List(Map map) throws Exception {
		sqlSession.insert("insert_ob_list", map);
	}
	
	public void insert_Obfiles(Map map) throws Exception {
		sqlSession.insert("insert_obfiles", map);
	}
		
	public List<file_path> getFile_List(Map map)throws Exception {
		return sqlSession.selectList("get_file_list", map);
	}
	
	public void delete_object(Map map) throws Exception{
		sqlSession.delete("object_delete", map);
	}

	public void update_ob_state(Map map) throws Exception{
		sqlSession.update("update_OB_State", map);
	}
	public void update_object(Map map) throws Exception{
		sqlSession.update("update_object", map);
	}
	public List<ob_select_dong_list> dong_list(Map map) throws Exception{
		return sqlSession.selectList("select_dong_List", map);
	}
	
	public int get_obf_num(Map map) throws Exception{
		return sqlSession.selectOne("get_obf_num", map);
	}
	
	
	
}
	