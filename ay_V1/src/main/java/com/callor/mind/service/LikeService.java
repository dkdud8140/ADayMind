package com.callor.mind.service;

import com.callor.mind.model.LikeVO;

public interface LikeService {

	public void likeCountUp();
	public void likeCountDown();
	public LikeVO check_like();
}
