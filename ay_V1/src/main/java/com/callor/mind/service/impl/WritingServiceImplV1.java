package com.callor.mind.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

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
		
		/* 	List<WritingVO> rndList =  wtDao.selectAll();
			int wSize = rndList.size();
			List<Long> seqList = new ArrayList<Long>(); 
			for(int i = 0 ; i < wSize ; i ++) {	
				WritingVO wtVO = rndList.get(i);
				Long rndNum = wtVO.getWr_seq();
				seqList.add(rndNum);		}
			Random rnd = new Random();
			int sSize =seqList.size();
			int index = rnd.nextInt(sSize); 
			Long seq = seqList.get(index);
			log.debug("seq {} ", seq);
			WritingVO randomWrite = wtDao.selectById(seq);
			return randomWrite; */
		return wtDao.selectByRandom();
	}
	

	@Override
	public WritingVO findById(Long wr_seq) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int update(WritingVO wtVO) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int like(LikeVO likeVO) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int warning(WarningVO wrVO) {
		// TODO Auto-generated method stub
		return 0;
	}





}
