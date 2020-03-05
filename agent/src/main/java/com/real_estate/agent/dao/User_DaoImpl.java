package com.real_estate.agent.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real_estate.agent.model.UserVO;
@Repository
public class User_DaoImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public UserVO loging_check(Map map) throws Exception {
		

		return sqlSession.selectOne("User_login", map);
	}
}
