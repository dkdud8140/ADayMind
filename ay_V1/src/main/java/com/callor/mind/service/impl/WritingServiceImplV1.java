package com.callor.mind.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.callor.mind.dao.ext.WritingDao;
import com.callor.mind.dao.ext.WritingViewDao;
import com.callor.mind.model.dto.LikeListDTO;
import com.callor.mind.model.dto.WriteListDTO;
import com.callor.mind.model.vo.WritingVO;
import com.callor.mind.service.WritingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("writeServiceV1")
public class WritingServiceImplV1 implements WritingService {

	protected final WritingViewDao wtVDao;
	protected final WritingDao wtDao;
	
	@Override
	public WriteListDTO selectByRandom() {
		// TODO 메인화면에 나타내는 랜덤 메시지
		
		List<WriteListDTO> rndList =  wtVDao.selectAll();
		
		int wSize = rndList.size();
		List<String> seqList = new ArrayList<String>(); 
		for(int i = 0 ; i < wSize ; i ++) {	
			
			WriteListDTO wrtDTO = rndList.get(i);
			
			String rndNum = wrtDTO.getVw_seq();
			
			seqList.add(rndNum);
		}
		
		Random rnd = new Random();
		int sSize =seqList.size();
		int index = rnd.nextInt(sSize); 
		
		String seq = seqList.get(index);
		log.debug("seq {} ", seq);
		
		WriteListDTO randomWrite = wtVDao.selectById(seq);
		
		return randomWrite;
	}
	
	
	@Override
	public int insert(WritingVO wtVO) {
		// TODO 글 입력하기
		int ret = wtDao.delete(wtVO);  
		return 0;
	}

	
	@Override
	public List<WriteListDTO> selectOrderByLike() {
		// TODO 좋아요순으로 출력하기
		return wtVDao.selectOderByLike();
	}

	
	@Override
	public List<WriteListDTO> selectMyWriting(String user) {
		// TODO 내가 쓴 글 목록 리스트
		return wtVDao.selectMyWriting(user);
	}

	
	@Override
	public List<LikeListDTO> selectByUserLike(String user) {
		// TODO 내가 좋아요한 글 list
		return wtVDao.selectByUserLike(user);
	}


}
