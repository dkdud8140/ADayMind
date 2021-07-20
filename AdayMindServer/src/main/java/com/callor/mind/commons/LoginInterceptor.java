package com.callor.mind.commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.callor.mind.model.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
	    log.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	    log.debug("LoginInterceptor 진입");
	    log.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	    
	    log.debug(request.getContextPath());
	    log.debug(request.getServletPath());
	    log.debug(request.getRequestURI());
	    
	    if(request.getServletPath().contains("/admin")) {
	    	UserVO userVO = (UserVO) request.getSession().getAttribute("USER");
	    	if(userVO == null || !(userVO.getU_level() == 0)) {
	    		response.sendRedirect("/mind");
	    		return false;
	    	}
	    }
	    
	    if(request.getSession().getAttribute("USER") == null) {
	    	response.sendRedirect("/mind");
	    	return false;
	    }
		return true;
	}

	
}
