package com.callor.mind.dao.ext;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.WritingVO;

public interface WritingDao extends GenericDao<WritingVO, Long> {
	
	public List<WritingVO> findByUser(Long wr_user);
	
	public List<WritingVO> selectOrderByLike();
	
	public List<WritingVO> selectByUserLike(Long user);
	public List<WritingVO> selectMyWriting(Long user);
	
	// 0716 추가메소드
	public List<WritingVO> findByUserSeqOrNick(String search);
	public List<WritingVO> findByContent(String search);
	public List<WritingVO> findByDate(@Param("stDate") String stDate, @Param("edDate") String edDate);
	
	
	//public List<WritingVO> findByCatSearch(AdminSearchDTO searchDTO);
	
	
	public WritingVO selectByRandom();
	
	public int likeCountUp(Long wr_seq);
	public int likeCountDown(Long wr_seq);
	
	// 0716 경고 카운트 업데이트 메소드 추가
	public int warningCountUp(Long wr_seq);
	public int warningCountDown(Long wr_seq);
	
	// 신고 들어온 글 셀렉트할 떄 빼도록.......................
	
}