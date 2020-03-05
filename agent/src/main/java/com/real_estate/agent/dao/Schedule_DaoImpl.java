package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Schedule_VO;

@Repository
public class Schedule_DaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	public List<Schedule_VO>get_Month_Schedule_List(Map map)throws Exception {
		return sqlSession.selectList("get_Month_Schedule_List", map);
	}
	public List<Schedule_VO>get_Day_Schedule_List(Map map)throws Exception {
		return sqlSession.selectList("get_Day_Schedule_List", map);
	}
	public int  get_Month_Schedule_Count(Map map)throws Exception {
		return sqlSession.selectOne("get_Month_Schedule_Count", map);
	}
	public void  Insert_Schedule(Map map)throws Exception {
		sqlSession.insert("insert_schedule", map);
	}
	
	public void update_Schedule(Map map)throws Exception{
		sqlSession.update("update_Schedule", map);
	}
	
	public void delete_Schedule(Map map)throws Exception{
		sqlSession.delete("delete_schedule", map);
	}
	
	public Schedule_VO get_sc_num_schedule(Map map)throws Exception{
		return sqlSession.selectOne("select_num_schedule", map);
	}
	
	
}
	