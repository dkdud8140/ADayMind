package com.callor.mind.service.impl;

import org.springframework.stereotype.Service;

import com.callor.mind.dao.ext.LikeDao;
import com.callor.mind.model.LikeVO;
import com.callor.mind.service.LikeService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service("likeServiceV1")
public class LikeServiceImplV1 implements LikeService {

	protected final LikeDao lDao;
	
	
	@Override
	public void likeCountUp() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void likeCountDown() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LikeVO check_like() {
		return lDao.check_like();
	}

}
