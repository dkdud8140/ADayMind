package com.callor.mind.service.impl;

import org.springframework.stereotype.Service;

import com.callor.mind.dao.ext.LikeDao;
import com.callor.mind.dao.ext.WritingDao;
import com.callor.mind.model.LikeVO;
import com.callor.mind.service.LikeService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service("likeServiceV1")
public class LikeServiceImplV1 implements LikeService {

	protected final LikeDao lDao;
	protected final WritingDao wtDao;
	
	
	@Override
	public int likeCount(LikeVO likeVO) {
		
		int check = this.check_like(likeVO);
		
		if(check < 1) {
			lDao.insert(likeVO);
			wtDao.likeCountUp(likeVO.getLi_wr_seq());
		} else {
			lDao.delete(likeVO);
			wtDao.likeCountDown(likeVO.getLi_wr_seq());
		}
		return check;
	}


	@Override
	public int check_like(LikeVO likeVO) {
		return lDao.check_like(likeVO.getLi_wr_seq(), likeVO.getLi_fan());
	}

}
