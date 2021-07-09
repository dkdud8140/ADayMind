package com.callor.mind.service;

import com.callor.mind.model.LikeVO;

public interface LikeService {

	public int likeCount(LikeVO likeVO);
	
	public int check_like(LikeVO likeVO);
	
}
