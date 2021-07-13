package com.callor.mind.service;

import java.util.List;

import com.callor.mind.model.WarningVO;

public interface WarningService {
	
	public List<WarningVO> selectAll();
	public WarningVO findById(Long wa_seq);
}
