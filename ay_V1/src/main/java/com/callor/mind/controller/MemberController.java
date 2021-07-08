package com.callor.mind.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.callor.mind.model.UserVO;
import com.callor.mind.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@RequestMapping(value="/member")
@Controller
public class MemberController {
	
	@Qualifier("userServiceV1")
	protected final UserService uService;
	

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UserVO userVO, 
				HttpSession hSession, 
				RedirectAttributes rttr, 
				HttpServletRequest req ) throws Exception {
		hSession = req.getSession();
		UserVO login = uService.login(userVO);
		
		if(login == null) {
			hSession.setAttribute("USER", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			hSession.setAttribute("USER", login);
		}
		log.debug("로그인 : {}",login);
		log.debug("세션 : {}", hSession);
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String logout(HttpSession hSession) throws Exception {
		hSession.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		
		return "member/mypage";
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(Model model) {
		
		UserVO uVO = new UserVO();
		model.addAttribute("USER", uVO);
		return "header";
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserVO userVO) {
		
		uService.join(userVO);
		
		return "redirect:/";
	}

	
	
	
	
	
}
	
	
	
