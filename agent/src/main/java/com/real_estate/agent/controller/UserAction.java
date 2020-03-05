package com.real_estate.agent.controller;

import java.io.File;


import java.util.Date;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.real_estate.agent.dao.Building_ListService;
import com.real_estate.agent.dao.Object_List_Service;
import com.real_estate.agent.dao.User_Service;
import com.real_estate.agent.model.Building_List;
import com.real_estate.agent.model.Building_file_list;
import com.real_estate.agent.model.Filter_param;
import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Object_List_file;
import com.real_estate.agent.model.Schedule_VO;
import com.real_estate.agent.model.UserVO;
import com.real_estate.agent.model.file_LIst;



@Controller
public class UserAction {
	
	private static final String SAVE_PATH = "resources/room_photo/";
	
@Autowired
private User_Service userservice;

@Autowired
private ServletContext servletContext;

@RequestMapping(value="loginform.nhn", method=RequestMethod.GET)
public String loginform()throws Exception {
	
	
	return "login_form/login";
}



@RequestMapping(value="login", method=RequestMethod.POST)
public String loginsuccess(
		HttpSession session, 
		UserVO user)
		throws Exception {
	String returnURL="";
	Map map = new HashMap();
	if(session.getAttribute("login") != null) {
		session.removeAttribute("login");
	}
	map.put("UserVO", user);
	UserVO vo = userservice.loging_check(map);
	
	if(vo != null) {
		session.setAttribute("login", vo);
		returnURL="redirect:schedule";
	}else {
		returnURL="redirect:loginform";
	}
	
	return returnURL;
}



@RequestMapping(value="logout", method=RequestMethod.GET)
public String loginfail(HttpSession session)throws Exception {
	session.invalidate();
	
	return "login_form/login";
}







@RequestMapping(value="logoutform", method=RequestMethod.GET)
public String logoutform()throws Exception {
	
	
	return "login_form/login";
}
	




}
	