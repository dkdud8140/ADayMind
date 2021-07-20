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

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "member/mypage";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public String update(UserVO userVO, RedirectAttributes rtta, HttpSession hSession,String url_now2) {
		if (uService.update(userVO) > 0) {
			log.debug("로그인 : {}", userVO);
			hSession.setAttribute("USER", userVO);
			String urlPath = url_now2.substring(5);
			return "redirect:" + urlPath;
		}
		return "member/mypage";
	}

	@RequestMapping(value = "/pw_change", method = RequestMethod.POST)
	public String updatePw(String u_pw, String us_pw, String u_id, RedirectAttributes rtta, HttpSession hSession, UserVO userVO
			) {
		rtta.addFlashAttribute("OK", uService.updatePw(u_pw, us_pw, u_id));
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

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO userVO, Model model, String url_now, String wr_seq,RedirectAttributes rttr) {
		log.debug("가입정보 : {}", userVO.toString());
		userVO = uService.join(userVO);
		String urlPath = url_now.substring(5);
		
		if(urlPath.equals("/main")) {
		rttr.addFlashAttribute("wr_seq",wr_seq);
		}
		return "redirect:" + urlPath;
	}

	@ResponseBody
	@RequestMapping(value = "/id_check", method = RequestMethod.GET)
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
	@RequestMapping(value = "/pw_check", method = RequestMethod.GET)
	public String pwChk(String u_pw, String u_id) {
		UserVO userVO = uService.findByPw(u_pw, u_id);
		log.debug("u_pw  : {}", u_pw);
		if (userVO == null) {
			return "NOT_USE_PW";
		} else {
			return "USE_PW";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/nick_check", method = RequestMethod.GET)
	public String nickChk(String u_nick) {
		UserVO userVO = uService.findByNick(u_nick);
		
		log.debug("u_nick :{}", u_nick);
		if (userVO == null) {
			return "NOT_USE_NICK";
		} else {
			return "USE_NICK";
		}
	}
	@ResponseBody
	@RequestMapping(value = "/mail_check", method = RequestMethod.GET)
	public String mailChk(String u_mail) {
		UserVO userVO = uService.findByMail(u_mail);
		log.debug("userVO  : {}",userVO);
		if (userVO == null) {
			return "NOT_USE_MAIL";
		} else {
			return "USE_MAIL";
		}
	}
	@ResponseBody
	@RequestMapping(value = "/login_check", method = RequestMethod.GET)
	public String loginChk(String u_id, String u_pw) {
		UserVO userVO = new UserVO();
		userVO.setU_id(u_id);
		userVO.setU_pw(u_pw);
		UserVO login = uService.login(userVO);
		log.debug("userVO  : {}",userVO);
		if (login == null) {
			return "NOT_USE_LOGIN";
		} else {
			return "USE_LOGIN";
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String us_id, String us_pw, HttpSession hSession, HttpServletRequest req,
			RedirectAttributes rttr, String url_now , String wr_seq) {
		log.debug("글번호 {}",wr_seq);
		
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
		String urlPath = url_now.substring(5);
		
		if(urlPath.equals("/main")) {
		rttr.addFlashAttribute("wr_seq",wr_seq);
		}
		return "redirect:" + urlPath;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession hSession) {
		hSession.removeAttribute("USER");
		return "redirect:/";
	}

}