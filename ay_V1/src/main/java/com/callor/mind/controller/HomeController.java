package com.callor.mind.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.mind.model.LikeVO;
import com.callor.mind.model.UserVO;
import com.callor.mind.model.WritingVO;
import com.callor.mind.service.LikeService;
import com.callor.mind.service.UserService;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class HomeController {
	
	@Qualifier("writeServiceV1")
	protected final WritingService wtSer;
	
	@Qualifier("userServiceV1")
	protected final UserService uSer;
	
	@Qualifier("likeServiceV1")
	protected final LikeService lSer;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model, HttpSession session) {
		
		
		WritingVO wrtVO = wtSer.selectByRandom();
		
		Long seq = wrtVO.getWr_seq();
		UserVO userVO = (UserVO) session.getAttribute("USER");
		
		if(userVO == null) {
			model.addAttribute("WRITING", wrtVO);
			return "main";
		}
		
		Long user = userVO.getU_seq();
		
		LikeVO likeVO = new LikeVO();
		likeVO.setLi_seq(seq);
		likeVO.setLi_fan(user);
		
		int check = lSer.check_like(likeVO);
		
		model.addAttribute("CHECK",check);
		model.addAttribute("WRITING", wrtVO);
		
		return "main";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Locale locale, Model model) {
		
		return "insert";
	}
	
	
	
}
