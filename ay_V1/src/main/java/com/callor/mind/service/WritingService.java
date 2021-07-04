package com.callor.mind.service;

import java.util.List;

import com.callor.mind.model.dto.LikeListDTO;
import com.callor.mind.model.dto.WriteListDTO;
import com.callor.mind.model.vo.WritingVO;

public interface WritingService {

	public WriteListDTO selectByRandom();
	
	public List<WriteListDTO> selectOrderByLike();
	
	public List<WriteListDTO> selectMyWriting(String user);
	public List<LikeListDTO> selectByUserLike(String user);
	
	
	public int insert(WritingVO wtVO);
	
	
}
