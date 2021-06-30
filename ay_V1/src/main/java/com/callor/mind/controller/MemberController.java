package com.callor.mind.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value="/member")
@Controller
public class MemberController {

	
	@RequestMapping(value="/mypage", method=RequestMethod.GET )
	public String mypage() {
		
		return "member/mypage";
	}
}
