package com.callor.mind.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/admin_write/{wr_seq}", method=RequestMethod.GET)
	public String admin_write(Model model, @PathVariable("wr_seq") Long wr_seq) {
		
		WritingVO write= wtSer.findById(wr_seq);

		model.addAttribute("WRITE", write);
		model.addAttribute("ADMIN", "admin_write_detail");
		
		return "admin/admin";
	}
	
	
	@RequestMapping(value = "/admin_user", method=RequestMethod.GET)
	public String admin_user(Model model) {
		
		List<UserVO> userList = uSer.selectAll();
		
		model.addAttribute("USERS", userList);
		model.addAttribute("ADMIN", "admin_user");
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/admin_user/{u_seq}", method=RequestMethod.GET)
	public String admin_user(Model model, @PathVariable("u_seq") Long u_seq) {

		UserVO user = uSer.findBySeq(u_seq);
		List<WritingVO> wtList = wtSer.findByUser(u_seq);
		
		model.addAttribute("WTLIST", wtList);
		model.addAttribute("USER", user);
		model.addAttribute("ADMIN", "admin_user_detail");
		
		return "admin/admin";
	}
	
	
	
	@RequestMapping(value = "/admin_warning", method=RequestMethod.GET)
	public String admin_warning(Model model) {
		
		List<WarningVO> wList = wSer.selectAll();
		
		model.addAttribute("WARNINGS", wList);
		model.addAttribute("ADMIN", "admin_warning");
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/admin_warning/{wa_seq}", method=RequestMethod.GET)
	public String admin_warning(Model model, @PathVariable("wa_seq") Long wa_seq) {

		WarningVO warning = wSer.findById(wa_seq);
		
		model.addAttribute("WARNING", warning);
		model.addAttribute("ADMIN", "admin_warning_detail");
		
		return "admin/admin";
	}
	
	
	
}
