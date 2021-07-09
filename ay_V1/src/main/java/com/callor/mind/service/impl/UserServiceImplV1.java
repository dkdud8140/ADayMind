package com.callor.mind.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.mind.dao.ext.UserDao;
import com.callor.mind.model.UserVO;
import com.callor.mind.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service("userServiceV1")
public class UserServiceImplV1 implements UserService{

	protected final UserDao userDao;
	
	@Override
	public List<UserVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	// 아이디 중복검사 
	@Override
	public UserVO findById(String u_id) {
		UserVO userVO = userDao.findById(u_id);
		if(userVO == null) {
			log.debug("사용할 수 있는 아이디 : {}", u_id);
		}else {
			log.debug("사용할 수 없는 아이디 : {}",userVO.toString());
		}
		return userVO;
	}

	@Override
	public UserVO login(UserVO userVO) {
		return userDao.login(userVO);
	}

	// 회원가입 
	@Override
	public UserVO join(UserVO userVO) {
		List<UserVO> uList = userDao.selectAll();
		
		
		if(uList == null || uList.size() < 1) {
			userVO.setU_level(0);
		}else {
			userVO.setU_level(9);
		}
		userDao.insertOrUpdate(userVO);
		return userVO;
	}

	@Override
	public int update(UserVO userVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int expire(Long seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateWarning(UserVO userVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}