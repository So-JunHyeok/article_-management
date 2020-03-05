package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Storage_List;
@Repository
public class Stroage_DaoImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Object_List> getOb_list_stroage(Map map) {
	return sqlSession.selectList("getStotage_List", map);
	}
	
	public void insert_Stroage(Map map) {
	sqlSession.insert("insert_Stroage", map);	
	}

	public int getStorage_Title_count(Map map) {
	return sqlSession.selectOne("getStotage_Title_count", map);
	}
	public int getStorage_Title_count_min(Map map) {
		return sqlSession.selectOne("getStotage_Title_count_min", map);
	}
	
	public List<Storage_List> getStorage_List(Map map) {
	return sqlSession.selectList("getStotage_List_view", map);	
	}
	
	public void delete_Storage(Map map) {
	sqlSession.delete("delete_Storage", map);
	}
	
	public int getStorage_List_Count(Map map) {
	return sqlSession.selectOne("getStotage_List_view_count", map);
	}
	public void update_S_State(Map map) {
	sqlSession.update("update_S_State", map);
	}
	public void update_object(Map map) {
	sqlSession.update("update_s_object", map);
	}
	
	
}
