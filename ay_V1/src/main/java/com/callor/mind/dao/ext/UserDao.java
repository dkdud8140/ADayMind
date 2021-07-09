package com.callor.mind.dao.ext;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.UserVO;

public interface UserDao extends GenericDao<UserVO, String>{
	
	public int insertOrUpdate(UserVO userVO);
	public UserVO login(UserVO userVO);
}