package com.callor.mind.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.mind.model.LikeVO;
import com.callor.mind.model.UserVO;
import com.callor.mind.model.WritingVO;
import com.callor.mind.service.LikeService;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping(value="/list")
public class ListController {
	
	protected final WritingService wService;
	protected final LikeService lService;

	@RequestMapping(value="/ilike", method=RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute("USER");

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
		model.addAttribute("LISTSIZE",likeList.size());
		return "list/list";
	}
	
	@RequestMapping(value="/iwrite", method=RequestMethod.GET)
	public String mylist(Model model, HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute("USER");
		
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
		model.addAttribute("LISTSIZE",wrList.size());
		return "list/list";
	}
	
	@RequestMapping(value="/bestlist", method=RequestMethod.GET)
	public String bestlist(Model model, HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute("USER");
		if(userVO == null) {
			List<WritingVO> wrList = wService.selectOrderByLike();
			model.addAttribute("LIKELIST",wrList);
			model.addAttribute("title", "인기 하루 생각");
			model.addAttribute("LISTSIZE",wrList.size());
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
		model.addAttribute("LISTSIZE",wrList.size());
		return "list/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/moreList",method=RequestMethod.GET)
	public Map<String, Object> moreList(int moreCount, String url_now,HttpSession session) {
		log.debug("주소정보 {}",url_now);
		log.debug("리스트개수 {}",moreCount);
		
		UserVO userVO = (UserVO) session.getAttribute("USER");
		Map<String,Object> moreList = new HashMap<>();
		if(userVO == null) {
			moreList = wService.selectMoroList(moreCount, url_now, null);
		} else {
			moreList = wService.selectMoroList(moreCount, url_now, userVO.getU_seq());
		}
		
		return moreList;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(WritingVO writingVO) {
		
		int result = wService.delete(writingVO);
		
		return "redirect:/list/iwrite";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(WritingVO writingVO) {
		
		int result = wService.update(writingVO);
		
		return "redirect:/list/iwrite";
	}
}
