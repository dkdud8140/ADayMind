package com.callor.mind.service.impl;

import org.springframework.stereotype.Service;

import com.callor.mind.dao.ext.WritingDao;
import com.callor.mind.model.WritingVO;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class WritingServiceImplV1 implements WritingService {

	protected final WritingDao wtDao;
	
	@Override
	public int insert(WritingVO wtVO) {
		// TODO 글 입력하기
		
		int ret = wtDao.delete(wtVO);  
		
		return 0;
	}

}
