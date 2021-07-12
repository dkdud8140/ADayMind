package com.callor.mind.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.callor.mind.model.UserVO;
import com.callor.mind.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {


	protected final UserService uService;
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		
		return "member/mypage";
	}
	@RequestMapping(value="/mypage", method=RequestMethod.POST)
	public String update(UserVO userVO) {
		uService.update(userVO);
		return "redirect:/member/mypage";
	}
	@RequestMapping(value="/pw_change", method=RequestMethod.POST)
	public String updatePw(UserVO userVO) {
		uService.updatePw(userVO);
		return "redirect:/member/mypage";
	}
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(Model model) {
		return "header";
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserVO userVO, Model model) {
		log.debug("가입정보 : {}" , userVO.toString());
		userVO = uService.join(userVO);
		return "redirect:/main";
	}
	@ResponseBody
	@RequestMapping(value="/id_check",method=RequestMethod.GET)
	public String idChk(String u_id) {
		log.debug("아이디 중복검사 : {}" , u_id);
		UserVO userVO = uService.findById(u_id);
		if(userVO == null) {
			return "NOT_USE_ID";
		}else {
			return "USE_ID";
		}
	}
	@ResponseBody
	@RequestMapping(value="/pw_check", method=RequestMethod.GET)
	public String pwChk(String u_pw) {
		UserVO userVO = uService.findByPw(u_pw);
		if(userVO == null) {
			return "NOT_USE_PW";
		}else {
			return "USE_PW";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UserVO userVO,HttpSession hSession,
			HttpServletRequest req, RedirectAttributes rttr) {
		hSession = req.getSession();
		UserVO login = uService.login(userVO);
		
		if(login == null) {
			hSession.setAttribute("USER", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			hSession.setAttribute("USER", login);
		}
		
		return "redirect:/main";
	}
	@RequestMapping(value="logout", method=RequestMethod.POST)
	public String logout(HttpSession hSession) {
		hSession.removeAttribute("USER");
		return "redirect:/";
	}
	

}