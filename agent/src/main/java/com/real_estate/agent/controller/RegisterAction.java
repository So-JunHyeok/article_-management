package com.real_estate.agent.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterAction {

	
@RequestMapping(value="register_nhn", method=RequestMethod.GET)	
public ModelAndView registerForm()throws Exception {
	
ModelAndView mv = new ModelAndView();

Map map = new HashMap();

mv.setViewName("register");


return mv;	
	
}
	
	
	
}
