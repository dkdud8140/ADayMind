package com.callor.mind.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.mind.dao.ext.WarningDao;
import com.callor.mind.dao.ext.WritingDao;
import com.callor.mind.model.WarningVO;
import com.callor.mind.service.WarningService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("warningServiceV1")
public class WarningServiceImplV1 implements WarningService {

	protected final WarningDao wDao;
	protected final WritingDao wtDao;
	
	@Override
	public List<WarningVO> selectAll() {
		return wDao.selectAll();
	}

	@Override
	public WarningVO findById(Long wa_seq) {
		return wDao.findById(wa_seq);
	}

	// 0715 신고 추가
	@Override
	public int insert(WarningVO warning) {
		
		int ret = wDao.insert(warning);
		
		// 경고 테이블 추가 성공하면 글 경고수 자동 카운트 업
		if(ret > 0) {
			wtDao.warningCountUp(warning.getWa_writing());
		}
		
		return ret;
	}

}
