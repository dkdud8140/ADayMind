package com.callor.mind.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.mind.dao.ext.WritingViewDao;
import com.callor.mind.model.dto.WriteListDTO;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class HomeController {
	
	@Qualifier("writeServiceV1")
	protected final WritingService wtSer;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		
		WriteListDTO wrtDTO = wtSer.selectByRandom();
		model.addAttribute("WRITING", wrtDTO);
		
		return "main";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Locale locale, Model model) {
		
		return "insert";
	}
	
	
	
}
