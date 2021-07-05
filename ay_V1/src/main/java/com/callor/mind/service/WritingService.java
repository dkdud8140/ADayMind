package com.callor.mind.service;

import java.util.List;

import com.callor.mind.model.dto.LikeListDTO;
import com.callor.mind.model.dto.WriteListDTO;
import com.callor.mind.model.vo.LikeVO;
import com.callor.mind.model.vo.WarningVO;
import com.callor.mind.model.vo.WritingVO;

public interface WritingService {

	public WriteListDTO selectByRandom();		
	public List<WarningVO> selectByWarning(); 	//모든 신고글 조회
	
	public List<WriteListDTO> selectOrderByLike();
	
	public List<WriteListDTO> selectMyWriting(String user);
	public List<LikeListDTO> selectByUserLike(String user);
	
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
