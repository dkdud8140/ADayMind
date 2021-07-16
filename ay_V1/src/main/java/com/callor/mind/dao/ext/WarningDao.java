package com.callor.mind.dao.ext;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.WarningVO;

public interface WarningDao extends GenericDao<WarningVO, Long> {

	// 0716 검색 메소드 추가 4개
	public List<WarningVO> findByWrite(String search);
	public List<WarningVO> findByUserSeq(String search);
	public List<WarningVO> findByContent(String search);
	public List<WarningVO> findByDate( @Param("stDate") String stDate, @Param("edDate")String edDate);
}
