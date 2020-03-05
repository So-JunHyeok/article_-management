package com.real_estate.agent.dao;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real_estate.agent.model.UserVO;
@Service
public class User_ServiceImpl implements User_Service {
	
	
	@Autowired
	private User_DaoImpl userdao; 

	@Override
	public UserVO loging_check(Map map) throws Exception {
		return userdao.loging_check(map);
	}

}
