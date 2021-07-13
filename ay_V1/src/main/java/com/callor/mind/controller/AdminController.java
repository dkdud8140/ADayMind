package com.callor.mind.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.mind.model.UserVO;
import com.callor.mind.model.WarningVO;
import com.callor.mind.model.WritingVO;
import com.callor.mind.service.UserService;
import com.callor.mind.service.WarningService;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "/admin")
@RequiredArgsConstructor
public class AdminController {

	@Qualifier("writeServiceV1")
	protected final WritingService wtSer; 
	@Qualifier("userServiceV1")
	protected final UserService uSer;
	@Qualifier("warningServiceV1")
	protected final WarningService wSer;
	
	
	@RequestMapping(value = {"/",""}, method=RequestMethod.GET)
	public String home(Model model) {
		
		List<WritingVO> writeList = wtSer.selectAll();

		model.addAttribute("WTLIST", writeList);
		model.addAttribute("ADMIN", "admin_write");
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/admin_user", method=RequestMethod.GET)
	public String admin_user(Model model) {
		
		List<UserVO> userList = uSer.selectAll();
		
		model.addAttribute("USERS", userList);
		model.addAttribute("ADMIN", "admin_user");
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/admin_warning", method=RequestMethod.GET)
	public String admin_warning(Model model) {
		
		List<WarningVO> wList = wSer.selectAll();
		
		model.addAttribute("WARNINGS", wList);
		model.addAttribute("ADMIN", "admin_warning");
		
		return "admin/admin";
	}
	
	
	
}
