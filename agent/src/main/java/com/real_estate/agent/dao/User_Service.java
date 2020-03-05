package com.real_estate.agent.dao;

import java.util.Map;

import com.real_estate.agent.model.UserVO;

public interface User_Service {
	
	public UserVO loging_check(Map map)throws Exception;
}
