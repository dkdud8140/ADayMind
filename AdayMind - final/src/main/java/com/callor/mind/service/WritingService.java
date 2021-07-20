package com.callor.mind.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.callor.mind.model.LikeVO;
import com.callor.mind.model.WarningVO;
import com.callor.mind.model.WritingVO;

public interface WritingService {

	public List<WritingVO> selectAll();
	
	//페이징 추가한 selectAll
	public List<WritingVO> selectAllPage(int pageNum, Model model);
	
	public WritingVO selectByRandom();
	public WritingVO findById(Long wr_seq);
	
	public List<WritingVO> findByUser(Long wr_user);
	
	//0716 admim 페이지에서 목록검색하기
	public List<WritingVO> search(String category, String search, Model model) throws Exception;
	//0716 admim 페이지에서 날짜별검색하기
	public List<WritingVO> searchDate(String stDate, String edDate) ;
	
	public List<WarningVO> selectByWarning(); 	//모든 신고글 조회
	
	public List<WritingVO> selectOrderByLike();
	
	public List<WritingVO> selectMyWriting(Long u_seq);
	public List<WritingVO> selectByUserLike(Long u_seq);
	public Map<String,Object> selectMoroList(int moreCount, String url_now, Long u_seq);
	
	
	public int insert(WritingVO wtVO);
	public int delete(WritingVO wtVO);
	public int update(WritingVO wtVO);
	
	// 좋아요 메소드
	public int like(LikeVO likeVO);
	
	// 신고메소드
	public int warning(WarningVO wrVO);
}
