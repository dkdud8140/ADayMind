package com.callor.mind.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.mind.model.WritingVO;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping(value="/list")
@RequiredArgsConstructor
public class ListController {
	
	@Qualifier("writeServiceV1")
	protected final WritingService wrSer;

	@RequestMapping(value="/ilike", method=RequestMethod.GET)
	public String list(Long seq, Model model) {
		
		List<WritingVO> likeList = wrSer.selectByUserLike(seq);
		
		log.debug(likeList.toString());
		
		model.addAttribute("LIKELIST", likeList);
		model.addAttribute("title", "나의 공감리스트");
		return "list/list";
	}
	
	@RequestMapping(value="/iwrite", method=RequestMethod.GET)
	public String mylist(Model model, Long seq) {
		
		List<WritingVO> wrList = wrSer.selectMyWriting(seq);
		
		model.addAttribute("MYWRITING", wrList);
		model.addAttribute("title", "내가 쓴 하루 생각");
		return "list/list";
	}
	
	@RequestMapping(value="/bestlist", method=RequestMethod.GET)
	public String bestlist(Model model) {
		
		List<WritingVO> wrList = wrSer.selectOrderByLike();
		
		model.addAttribute("LIKELIST", wrList);
		model.addAttribute("title", "인기 하루 생각");
		return "list/list";
	}

}