package com.real_estate.agent.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthenticationInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception)
			throws Exception {
		// TODO Auto-generated method stub
	

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		

	}

	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse 
			response, Object handler) 
			throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		
/*		System.out.println("authenµµÂø");*/
		if(obj == null) {
			response.sendRedirect("loginform.nhn");
			return false;
		}
		
		
		return true;
	}

}
