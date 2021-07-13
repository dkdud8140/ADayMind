package com.callor.mind.dao.ext;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.UserVO;

public interface UserDao extends GenericDao<UserVO, String>{

	// 2021.07.13
	// 유저 seq으로 검색해야해서 추가했음다
	public UserVO findBySeq(Long u_seq);
	
	public int insertOrUpdate(UserVO userVO);
	public UserVO login(UserVO userVO);
	
	public int delete(String seq);
	public UserVO findByPw(String u_pw);
	public int updatePw(UserVO userVO);
	
	
}