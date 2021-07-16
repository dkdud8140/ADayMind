package com.callor.mind.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.mind.model.UserVO;
import com.callor.mind.model.WarningVO;
import com.callor.mind.service.WarningService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value = "/warning")
public class WarningController {
	
	@Qualifier("warningServiceV1")
	protected final WarningService wSer;
	
//	@RequestMapping(value = "/insert", method = RequestMethod.GET)
//	public String warning(Locale locale, Model model) {
//		return "redirect:/";
//	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String warning(
			@RequestParam("wa_writing") Long wa_writing,
			@RequestParam("wa_user") Long wa_user,
			@RequestParam("wa_content") String wa_content,
			@RequestParam( name= "wa_content_other", required = false, defaultValue = "0") String wa_content_other,
			Locale locale, Model model, HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute("USER");
		
		if(userVO == null) {
			return "redirect:/";
		}
		
		if(wa_content.equals("") || wa_content == null) {
			return "redirect:/";
		} 
		if(wa_content_other.equals("") || wa_content_other == null) {
			return "redirect:/";
		}
		
		// 기타 사유 넣었을 때 
		if(wa_content.equals("6")) {
			log.debug("####other : {}", wa_content_other);
			wa_content = wa_content_other ;
		}
		
		log.debug("####form 값 유저SEQ : {}, 글SEQ : {}, 신고자SEQ : {}, 신고내용 : {}", wa_user,wa_writing,userVO.getU_seq(),wa_content);
		
		WarningVO warning = new WarningVO();
		warning.setWa_writing(wa_writing);
		warning.setWa_user(wa_user);
		warning.setWa_content(wa_content);
		warning.setWa_reporter(userVO.getU_seq());
		
		int ret = wSer.insert(warning);
		
		
		return "redirect:/main";
	}
	
	
}
