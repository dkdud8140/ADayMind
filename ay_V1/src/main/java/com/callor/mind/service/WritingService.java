package com.callor.mind.service;

import java.util.List;

import com.callor.mind.model.LikeVO;
import com.callor.mind.model.WarningVO;
import com.callor.mind.model.WritingVO;

public interface WritingService {

	public List<WritingVO> selectAll();
	
	public WritingVO selectByRandom();
	public WritingVO findById(Long wr_seq);
	public List<WarningVO> selectByWarning(); 	//모든 신고글 조회
	
	public List<WritingVO> selectOrderByLike();
	
	public List<WritingVO> selectMyWriting(Long u_seq);
	public List<WritingVO> selectByUserLike(Long u_seq);
	
	public int insert(WritingVO wtVO);
	public int delete(WritingVO wtVO);
	public int update(WritingVO wtVO);
	
	// 좋아요 메소드
	public int like(LikeVO likeVO);
	
	// 신고메소드
	public int warning(WarningVO wrVO);
	
	
	
	
	// 밴................?
	// 관리자 ㅋ...
	// 관리자건 메시지 디자인 XXXXXXXXX
	// 우리 여태까지 했던 테이블 디자인
	// 신고글 / 모든 글 목록 / 유저 목록 
	
}
