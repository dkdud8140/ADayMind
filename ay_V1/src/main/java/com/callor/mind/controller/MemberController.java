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
	public String update(UserVO userVO, RedirectAttributes rtta, HttpSession hSession) {
		if (uService.update(userVO) > 0) {
			log.debug("로그인 : {}", userVO);
			hSession.setAttribute("USER", userVO);
			return "redirect:/member/mypage";
		}
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value="/pw_change", method=RequestMethod.POST)
	public String updatePw(String u_pw, String us_pw, RedirectAttributes rtta, HttpSession hSession, UserVO userVO) {
		rtta.addFlashAttribute("OK", uService.updatePw(u_pw, us_pw));
		log.debug("USER : {}", userVO);
		hSession.removeAttribute("USER");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/expire", method = RequestMethod.POST)
	public String expire(UserVO userVO, RedirectAttributes rtta, HttpSession hSession) {
		UserVO uVO = (UserVO) hSession.getAttribute("USER");
		if (uVO.getU_pw().equals(userVO.getU_pw())) {
			uService.expire(userVO);
			hSession.removeAttribute("USER");
			return "redirect:/";
		} else {
			return "member/mypage";
		}
	}
	
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(Model model) {
		return "header";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserVO userVO, Model model) {
		log.debug("가입정보 : {}", userVO.toString());
		userVO = uService.join(userVO);
		return "redirect:/main";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/id_check",method=RequestMethod.GET)
	public String idChk(String u_id) {
		log.debug("아이디 중복검사 : {}", u_id);
		UserVO userVO = uService.findById(u_id);
		if (userVO == null) {
			return "NOT_USE_ID";
		} else {
			return "USE_ID";
		}
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/pw_check", method=RequestMethod.GET)
	public String pwChk(String u_pw) {
		UserVO userVO = uService.findByPw(u_pw);
		log.debug("u_pw  : {}", u_pw);
		if (userVO == null) {
			return "NOT_USE_PW";
		} else {
			return "USE_PW";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/u_nick", method = RequestMethod.GET)
	public String nickChk(String u_nick) {
		UserVO userVO = uService.findByNick(u_nick);
		log.debug("u_nick :{}", u_nick);
		if (userVO == null) {
			return "NOT_USE_NICK";
		} else {
			return "USE_NICK";
		}
	}
	
	
	@RequestMapping(value = "/u_mail", method = RequestMethod.GET)
	public String mailChk(String u_mail) {
		UserVO userVO = uService.findByMail(u_mail);
		if (userVO == null) {
			return "NOT_USE_MAIL";
		} else {
			return "USE_MAIL";
		}
	}
	

	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String us_id, String us_pw, HttpSession hSession, HttpServletRequest req,
			RedirectAttributes rttr) {
		hSession = req.getSession();
		UserVO userVO = new UserVO();
		userVO.setU_id(us_id);
		userVO.setU_pw(us_pw);
		UserVO login = uService.login(userVO);
		if (login == null) {
			hSession.setAttribute("USER", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			hSession.setAttribute("USER", login);
		}

		return "redirect:/main";
	}
	
	
	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession hSession) {
		hSession.removeAttribute("USER");
		return "redirect:/";
	}

}