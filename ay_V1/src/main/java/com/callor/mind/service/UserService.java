package com.callor.mind.service;

import java.util.List;

import com.callor.mind.model.vo.UserVO;

public interface UserService {

	// 관리자용 리스트출력
	public List<UserVO> selectAll();
	
	public UserVO findById(String seq);
	
	public UserVO login(String id, String pw);
	
	public int join(UserVO uservo);
	public int update(UserVO uservo);	// 회원정보 수정
	
	public int expire(String seq);		// 탈퇴

	//일단 보류
	// 정보는 그대로 두고 접근제한만. 
//	public int ban(String seq);
	
}
