package com.callor.mind.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		UserVO userVO = (UserVO) session.getAttribute("USER");
		
		if(userVO == null) {
			model.addAttribute("WRITING", wrtVO);
			model.addAttribute("CHECK",0);
			return "main";
		}
		
		Long seq = wrtVO.getWr_seq();		
		Long user = userVO.getU_seq();
		
		LikeVO likeVO = new LikeVO();
		likeVO.setLi_wr_seq(seq);
		likeVO.setLi_fan(user);
		
		int check = lSer.check_like(likeVO);
		log.debug("체크여부 {}",check);
		
		// 좋아요 테이블 find한 결과 값
		// check = 1 ; 현재 로그인한 유저가 좋아요 누른 글
		// check = 0 ; 현재 로그인한 유저가 좋아요를 누르지 않은 글
		model.addAttribute("CHECK",check);
		model.addAttribute("WRITING", wrtVO);
		
		return "main";
	}
	
	@ResponseBody
	@RequestMapping(value="/like_count",method=RequestMethod.GET)
	public String likeCount(Long bseq, Long useq) {
		
		log.debug("글번호 {}",bseq);
		log.debug("회원번호 {}",useq);
		LikeVO likeVO = new LikeVO();
		likeVO.setLi_wr_seq(bseq);
		likeVO.setLi_fan(useq);
		
		WritingVO writingVO = wtSer.findById(bseq);
		log.debug("글 공감숫자 {}",writingVO.getWr_like_count());
		
		int like_count = lSer.likeCount(likeVO);
		if(like_count > 0) {
			return "COUNT_DOWN";
		}else {
			return "COUNT_UP";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/wrlike_count",method=RequestMethod.GET)
	public int likeCount(Long bseq) {
		
		WritingVO writingVO = wtSer.findById(bseq);
		log.debug("글 공감숫자 {}",writingVO.getWr_like_count());
		
		return writingVO.getWr_like_count();
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Locale locale, Model model) {
		return "insert";
	}
	
	

	// 7월 14일 추가
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Long u_seq,String u_nick, WritingVO writingVO) {
	
		log.debug("글정보 {}",writingVO);
		writingVO.setWr_user(u_seq);
		writingVO.setWr_nick(u_nick);
		
		log.debug("2개 합치기 {}",writingVO);
		
		int result = wtSer.insert(writingVO);
		if(result > 0) {
			return "redirect:/list/iwrite";
		}
		return "redirect:/insert";
	}
	
	
}
