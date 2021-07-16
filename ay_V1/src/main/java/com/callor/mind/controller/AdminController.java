package com.callor.mind.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.mind.model.UserVO;
import com.callor.mind.model.WarningVO;
import com.callor.mind.model.WritingVO;
import com.callor.mind.service.UserService;
import com.callor.mind.service.WarningService;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Qualifier("writeServiceV1")
	protected final WritingService wtSer; 
	@Qualifier("userServiceV1")
	protected final UserService uSer;
	@Qualifier("warningServiceV1")
	protected final WarningService wSer;
	
	public String admin_check(Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("USER");
		if( user==null || !(user.getU_level() == 0)) {
			//model.addAttribute("ERROR","NOT_RIGNT");
			//return "redirect:/";
			return "admin/admin";
		} 
		return "admin/admin";
	}
	
	
	@RequestMapping(value = {"/",""}, method=RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		return this.admin_write(model, session);
		
	}
	
	@RequestMapping(value =  "/admin_write", method=RequestMethod.GET)
	public String admin_write(Model model, HttpSession session) {
		List<WritingVO> writeList = wtSer.selectAll();

		model.addAttribute("WTLIST", writeList);
		model.addAttribute("ADMIN", "admin_write");
		
		return this.admin_check(model, session);
	}
	
	
	@RequestMapping(value = "/admin_write/{wr_seq}", method=RequestMethod.GET)
	public String admin_write(Model model, @PathVariable("wr_seq") Long wr_seq, HttpSession session) {
		WritingVO write= wtSer.findById(wr_seq);

		model.addAttribute("WRITE", write);
		model.addAttribute("ADMIN", "admin_write_detail");
		
		return this.admin_check(model, session);
	}
	
	
	// 0715 글 전체 목록에서 검색하기
	@RequestMapping(value = "/write_search/{CAT}", method=RequestMethod.GET)
	public String admin_write_search(Model model, HttpSession session,
									@PathVariable("CAT") String cat, 
									@RequestParam(name="search",required = false, defaultValue="") String search ) 
											throws Exception {
		
		log.debug("####파라메터값 확인 : {}, {}",cat,search);
		
		if(search.equals("") || search == null) {
			return "admin/admin";
		}
		
		model.addAttribute("CAT",cat);
		
		List<WritingVO> writing = wtSer.search(cat, search, model);
		model.addAttribute("WTLIST", writing);
		model.addAttribute("ADMIN", "admin_write");
		return this.admin_check(model, session);
	}
	
	
	
	
	
	@RequestMapping(value = "/admin_user", method=RequestMethod.GET)
	public String admin_user(Model model, HttpSession session) {
		List<UserVO> userList = uSer.selectAll();
		
		model.addAttribute("USERS", userList);
		model.addAttribute("ADMIN", "admin_user");
		
		return this.admin_check(model, session);
	}
	
	@RequestMapping(value = "/admin_user/{u_seq}", method=RequestMethod.GET)
	public String admin_user(Model model, @PathVariable("u_seq") Long u_seq, HttpSession session) {
		
		UserVO user = uSer.findBySeq(u_seq);
		List<WritingVO> wtList = wtSer.findByUser(u_seq);
		
		model.addAttribute("WTLIST", wtList);
		model.addAttribute("USER", user);
		model.addAttribute("ADMIN", "admin_user_detail");
		
		return this.admin_check(model, session);
	}
	
	
	
	
	
	
	@RequestMapping(value = "/admin_warning", method=RequestMethod.GET)
	public String admin_warning(Model model, HttpSession session) {
		List<WarningVO> wList = wSer.selectAll();
		
		model.addAttribute("WARNINGS", wList);
		model.addAttribute("ADMIN", "admin_warning");
		
		return this.admin_check(model, session);
	}
	
	@RequestMapping(value = "/admin_warning/{wa_seq}", method=RequestMethod.GET)
	public String admin_warning(Model model, @PathVariable("wa_seq") Long wa_seq, HttpSession session) {
		
		WarningVO warning = wSer.findById(wa_seq);
		
		model.addAttribute("WARNING", warning);
		model.addAttribute("ADMIN", "admin_warning_detail");
		
		return this.admin_check(model, session);
	}
	
	
	
}
