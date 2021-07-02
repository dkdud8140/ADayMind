package com.callor.mind.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.mind.dao.ext.WritingDao;
import com.callor.mind.model.dto.LikeListDTO;
import com.callor.mind.model.dto.WriteListDTO;
import com.callor.mind.model.vo.WritingVO;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("writeServiceV1")
public class WritingServiceImplV1 implements WritingService {

	protected final WritingDao wtDao;
	
	@Override
	public int insert(WritingVO wtVO) {
		// TODO 글 입력하기
		int ret = wtDao.delete(wtVO);  
		return 0;
	}

	@Override
	public List<WriteListDTO> selectOrderByLike() {
		// TODO 좋아요순으로 출력하기
		return wtDao.selectOderByLike();
	}

	@Override
	public List<WriteListDTO> selectMyWriting(String user) {
		// TODO 내가 쓴 글 목록 리스트
		return wtDao.selectMyWriting(user);
	}

	@Override
	public List<LikeListDTO> selectByUserLike(String user) {
		// TODO 내가 좋아요한 글 list
		return wtDao.selectByUserLike(user);
	}

}
