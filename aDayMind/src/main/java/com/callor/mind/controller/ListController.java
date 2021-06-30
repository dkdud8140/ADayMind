package com.callor.mind.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping(value="/list")
public class ListController {

	@RequestMapping(value="/ilike", method=RequestMethod.GET)
	public String list(Model model) {
		
		model.addAttribute("title", "나의 공감리스트");
		return "list/list";
	}
	
	@RequestMapping(value="/iwrite", method=RequestMethod.GET)
	public String mylist(Model model) {
		
		model.addAttribute("title", "내가 쓴 하루 생각");
		return "list/list";
	}
	
	@RequestMapping(value="/bestlist", method=RequestMethod.GET)
	public String bestlist(Model model) {
		
		model.addAttribute("title", "인기 하루 생각");
		return "list/list";
	}

}