package com.callor.mind.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.callor.mind.dao.ext.WritingDao;
import com.callor.mind.model.LikeVO;
import com.callor.mind.model.WarningVO;
import com.callor.mind.model.WritingVO;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("writeServiceV1")
public class WritingServiceImplV1 implements WritingService {

	protected final WritingDao wtDao;
	

	@Override
	public List<WritingVO> selectAll() {
		return wtDao.selectAll();
	}

	
	@Override
	public WritingVO selectByRandom() {
		// TODO 메인화면에 나타내는 랜덤 메시지
		return wtDao.selectByRandom();
	}
	

	@Override
	public WritingVO findById(Long wr_seq) {
		return wtDao.findById(wr_seq);
	}
	
	
	
	// 07.13 유저 id로 글 찾기
	@Override
	public List<WritingVO> findByUser(Long wr_user) {
		return wtDao.findByUser(wr_user);
	}

	
	
	@Override
	public int insert(WritingVO wtVO) {
		// TODO 글 입력하기
		int ret = wtDao.delete(wtVO);  
		return ret;
	}

	
	@Override
	public List<WritingVO> selectOrderByLike() {
		// TODO 좋아요순으로 출력하기
		return wtDao.selectOrderByLike();
	}

	
	@Override
	public List<WritingVO> selectMyWriting(Long user) {
		// TODO 내가 쓴 글 목록 리스트
		return wtDao.selectMyWriting(user);
	}

	
	@Override
	public List<WritingVO> selectByUserLike(Long user) {
		// TODO 내가 좋아요한 글 list
		return wtDao.selectByUserLike(user);
	}


	@Override
	public List<WarningVO> selectByWarning() {
		return null;
	}


	@Override
	public int delete(WritingVO wtVO) {
		return wtDao.delete(wtVO);
	}

	@Override
	public int update(WritingVO wtVO) {
		return wtDao.update(wtVO);
	}

	@Override
	public int like(LikeVO likeVO) {
		return 0;
	}


	@Override
	public int warning(WarningVO wrVO) {
		return 0;
	}

	// 0716 검색메소드 : 글번호, 유저번호, 글내용으로 검색
	@Override
	public List<WritingVO> search(String category, String search, Model model) throws Exception {

		List<WritingVO> writing = new ArrayList<WritingVO>();
		
		if(category.equalsIgnoreCase("seq")) {
			Long wr_seq = null;
			try {
				wr_seq = Long.valueOf(search);
			} catch (Exception e) {
				return null;
			}
			WritingVO write = wtDao.findById(wr_seq);
			writing.add(write);
		} else if(category.equalsIgnoreCase("user")) {
			writing = wtDao.findByUserSeqOrNick(search);
		} else if(category.equalsIgnoreCase("content")) {
			writing = wtDao.findByContent(search);
		} 
		log.debug("검색결과 : {}", writing.toString());
		
		return writing;
	}

	// 0716 검색메소드 : 날짜별 검색
	@Override
	public List<WritingVO> searchDate(String stDate, String edDate) {
		
		stDate +=" 00:00:00";
		edDate +=" 23:59:59";
		
		log.debug("%%검색날짜 , {} , {} ", stDate, edDate);
		
		return wtDao.findByDate(stDate, edDate);
	}


	


}
