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

	@Override
	public UserVO findById(Long seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO login(UserVO userVO) {
		return userDao.login(userVO);
	}

	@Override
	public int join(UserVO userVO) {
		return userDao.insert(userVO);
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
	
