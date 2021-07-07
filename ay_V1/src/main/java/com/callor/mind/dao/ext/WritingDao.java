package com.callor.mind.dao.ext;

import java.util.List;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.WritingVO;

public interface WritingDao extends GenericDao<WritingVO, Long> {
	
	public List<WritingVO> selectOrderByLike();
	
	public List<WritingVO> selectByUserLike(Long user);
	public List<WritingVO> selectMyWriting(Long user);
	
	public WritingVO selectByRandom();
	
	// 신고 들어온 글 셀렉트할 떄 빼도록.......................

}
