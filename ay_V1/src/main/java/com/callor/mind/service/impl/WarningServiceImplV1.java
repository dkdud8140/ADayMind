package com.callor.mind.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.mind.dao.ext.WarningDao;
import com.callor.mind.model.WarningVO;
import com.callor.mind.service.WarningService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("warningServiceV1")
public class WarningServiceImplV1 implements WarningService {

	protected final WarningDao wDao;
	
	@Override
	public List<WarningVO> selectAll() {
		return wDao.selectAll();
	}

	@Override
	public WarningVO findById(Long wa_seq) {
		return wDao.findById(wa_seq);
	}

}
