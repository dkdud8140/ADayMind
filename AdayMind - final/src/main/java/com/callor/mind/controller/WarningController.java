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
	public String warning(WarningVO warning, 
			@RequestParam( name= "wa_content_other", required = false, defaultValue = "0") String wa_content_other,
			Locale locale, Model model, HttpSession session, String url_now2) {
		
		UserVO userVO = (UserVO) session.getAttribute("USER");
		
		if(userVO == null) {
			return "redirect:/";
		}
		
		String wa_content = warning.getWa_content();
		
		if(wa_content.equals("") || wa_content == null) {
			return "redirect:/";
		} 
		
		// 0720 수정 기타 사유 넣었을 때 
		if(wa_content.equals("6")) {
			if(wa_content_other.equals("") || wa_content_other == null) {
				return "redirect:/";
			}
			wa_content = wa_content_other ;
		}
		
		warning.setWa_content(wa_content);
		warning.setWa_reporter(userVO.getU_seq());
		
		log.debug("신고내용 : {} ", warning.toString());
		
		int ret = wSer.insert(warning);
		
		// ??
		String urlPath = url_now2.substring(5);
		return "redirect:" + urlPath;
	}
}