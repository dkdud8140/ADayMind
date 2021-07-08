package com.callor.mind.dao.ext;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.LikeVO;

public interface LikeDao extends GenericDao<LikeVO, Long> {
	
	public LikeVO check_like(); 

}
