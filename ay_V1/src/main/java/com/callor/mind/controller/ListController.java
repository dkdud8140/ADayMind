package com.callor.mind.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.mind.model.LikeVO;
import com.callor.mind.model.UserVO;
import com.callor.mind.model.WritingVO;
import com.callor.mind.service.LikeService;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value="/list")
public class ListController {
	protected final WritingService wService;
	protected final LikeService lService;

	@RequestMapping(value="/ilike", method=RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute("USER");
		if(userVO == null) {
			return "redirect:/main";
		}
		List<WritingVO> likeList = wService.selectByUserLike(userVO.getU_seq());
		List<Integer> ilike = new ArrayList<>();
		LikeVO likeVO = new LikeVO();
		for(int i = 0; i < likeList.size(); i++) {
			likeVO.setLi_fan(userVO.getU_seq());
			likeVO.setLi_wr_seq(likeList.get(i).getWr_seq());
			ilike.add(lService.check_like(likeVO));
		}
		
		model.addAttribute("LIKECHECK",ilike);
		model.addAttribute("LIKELIST", likeList);
		model.addAttribute("title", "나의 공감리스트");
		return "list/list";
	}
	
	@RequestMapping(value="/iwrite", method=RequestMethod.GET)
	public String mylist(Model model, HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute("USER");
		if(userVO == null) {
			return "redirect:/main";
		}
		
		List<WritingVO> wrList = wService.selectMyWriting(userVO.getU_seq());
		List<Integer> ilike = new ArrayList<>();
		LikeVO likeVO = new LikeVO();
		for(int i = 0; i < wrList.size(); i++) {
			likeVO.setLi_fan(userVO.getU_seq());
			likeVO.setLi_wr_seq(wrList.get(i).getWr_seq());
			ilike.add(lService.check_like(likeVO));
		}
		
		model.addAttribute("LIKECHECK",ilike);
		model.addAttribute("MYWRITING",wrList);
		model.addAttribute("title", "내가 쓴 하루 생각");
		return "list/list";
	}
	
	@RequestMapping(value="/bestlist", method=RequestMethod.GET)
	public String bestlist(Model model, HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute("USER");
		if(userVO == null) {
			List<WritingVO> wrList = wService.selectOrderByLike();
			model.addAttribute("LIKELIST",wrList);
			model.addAttribute("title", "인기 하루 생각");
			return "list/list";
		}
		
		List<WritingVO> wrList = wService.selectOrderByLike();
		List<Integer> ilike = new ArrayList<>();
		LikeVO likeVO = new LikeVO();
		for(int i = 0; i < wrList.size(); i++) {
			likeVO.setLi_fan(userVO.getU_seq());
			likeVO.setLi_wr_seq(wrList.get(i).getWr_seq());
			ilike.add(lService.check_like(likeVO));
		}
		
		model.addAttribute("LIKECHECK",ilike);
		model.addAttribute("LIKELIST",wrList);
		model.addAttribute("title", "인기 하루 생각");
		return "list/list";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(WritingVO writingVO) {
		
		int result = wService.delete(writingVO);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(WritingVO writingVO) {
		
		int result = wService.update(writingVO);
		
		return "redirect:/main";
	}
}
