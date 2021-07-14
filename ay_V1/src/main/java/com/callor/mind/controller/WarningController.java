package com.callor.mind.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/warning")
public class WarningController {

	
	// 0714 신고하기
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String warning(Locale locale, Model model, HttpSession session) {
		
		
		return "redirect:/";
	}
	
	
}
