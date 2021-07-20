package com.callor.ajax;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.ajax.model.userDTO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/json", method = RequestMethod.GET)
	public String json(Model model) {
		return "json";
	}
	
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model) {
		
		return "form";
	}
	
	
	/*
	 * Web client와 JSON 데이터 교환하기
	 * Web JSON 데이터를 보내면
	 * Controller에서는 @RequsestBody 속성을 사용하여 데이터를 받고
	 * Web에 다시 JSON 데이터를 return하기 위해서
	 * 	@responseBody속성을 사영하야 데이터를 retrurn
	 */
	
	
	/*
	 * Controller에서 web에서 보낸 데이터가 2가지 이상의 변수에 해당하면
	 * 무조건 VO, DTO를 만들어서 받아라
	 * @RequestBody는 Jsckson Bindㅇ 의해서
	 * web에서 정달된 JSON 데이터를 DTO클래스에 binding한다
	 * 
	 * Spring 4.x에서는 Jackson bind가 기본으로 포함이 되었다
	 * Spring 5.x에서는 Jsckson binf가 분리되어서
	 * porm.xml에서 jsckson-bind를 포함시켜줘야한다
	 */
	
	@ResponseBody
	@RequestMapping(value = "/json", method = RequestMethod.POST)
	public userDTO json( @RequestBody userDTO userDTO, Model model) {
		
		return userDTO;
	}
	
	@ResponseBody
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public userDTO form( @RequestBody userDTO userDTO, Model model) {
		
		return userDTO;
	}
	
}
