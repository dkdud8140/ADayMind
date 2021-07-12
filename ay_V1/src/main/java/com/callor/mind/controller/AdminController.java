package com.callor.mind.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.mind.model.WritingVO;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "/admin")
@RequiredArgsConstructor
public class AdminController {

	@Qualifier("writeServiceV1")
	protected final WritingService wtSer; 
	
	@RequestMapping(value = {"/",""}, method=RequestMethod.GET)
	public String home(Model model) {
		
		List<WritingVO> writeList = wtSer.selectAll();

		int nSize = writeList.size();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		model.addAttribute("WTLIST", writeList);
		model.addAttribute("ADMIN", "admin_write");
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/admin_user", method=RequestMethod.GET)
	public String admin_user(Model model) {
		
		model.addAttribute("ADMIN", "admin_user");
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/admin_warning", method=RequestMethod.GET)
	public String admin_warning(Model model) {
		
		model.addAttribute("ADMIN", "admin_warning");
		
		return "admin/admin";
	}
	
	
	
}
