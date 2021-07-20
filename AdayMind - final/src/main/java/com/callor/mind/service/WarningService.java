package com.callor.mind.service;

import java.util.List;

import org.springframework.ui.Model;

import com.callor.mind.model.UserVO;
import com.callor.mind.model.WarningVO;

public interface WarningService {
	
	public List<WarningVO> selectAll();
	
	//페이징 추가한 selectAll
	public List<WarningVO> selectAllPage(int pageNum, Model model);
	
	public WarningVO findById(Long wa_seq);
	
	//0715 추가 
	public int insert(WarningVO warning );
	
	
	//0716 admim 페이지에서 목록검색하기
	public List<WarningVO> search(String category, String search, Model model) throws Exception;
	//0716 admim 페이지에서 날짜별검색하기
	public List<WarningVO> searchDate(String stDate, String edDate) ;
	public int delete(WarningVO warningVO);
	
}
