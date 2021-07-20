package com.callor.mind.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		
		//경고 카운트 20이상인 게시물이 20이상일 때 자동으로 유저 ban
		
		
		return ret;
	}

	
	// 0716 검색 메소드 추가
	
	@Override
	public List<WarningVO> search(String category, String search, Model model) throws Exception {
		
		List<WarningVO> warning = new ArrayList<WarningVO>();
		
		if(category.equalsIgnoreCase("seq")) {
			Long wa_seq = null;
			try {
				wa_seq = Long.valueOf(search);
			} catch (Exception e) {
				return null;
			}
			WarningVO write = wDao.findById(wa_seq);
			warning.add(write);
		} else if(category.equalsIgnoreCase("user")) {
			warning = wDao.findByUserSeq(search);
		} else if(category.equalsIgnoreCase("content")) {
			warning = wDao.findByContent(search);
		}  else if(category.equalsIgnoreCase("write")) {
			warning = wDao.findByWrite(search);
		}
		
		
		log.debug("검색결과 : {}", warning.toString());
		
		return warning;
	}

	@Override
	public List<WarningVO> searchDate(String stDate, String edDate) {
		stDate +=" 00:00:00";
		edDate +=" 23:59:59";
		
		log.debug("%%검색날짜 , {} , {} ", stDate, edDate);
		
		return wDao.findByDate(stDate, edDate);
	}

	@Override
	public int delete(WarningVO warningVO) {
		
		int ret = wDao.delete(warningVO);
		
		//삭제된 신고 글 카운트 다운
		wtDao.warningCountDown(warningVO.getWa_writing());
		
		return ret;
	}
	
	// 0716 검색 메소드 추가 끝

}