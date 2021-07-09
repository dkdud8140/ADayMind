package com.callor.mind.dao.ext;

import org.apache.ibatis.annotations.Param;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.LikeVO;

public interface LikeDao extends GenericDao<LikeVO, Long> {
	
	public int check_like( @Param("li_wr_seq") Long seq, @Param("li_fan")Long user); 

}
