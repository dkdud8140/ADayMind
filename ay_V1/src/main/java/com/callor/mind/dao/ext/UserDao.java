package com.callor.mind.dao.ext;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.UserVO;

public interface UserDao extends GenericDao<UserVO, String>{

	// 2021.07.13
	// 유저 seq으로 검색해야해서 추가했음다
	public UserVO findBySeq(Long u_seq);
	
	public int insertOrUpdate(UserVO userVO);
	public UserVO login(UserVO userVO);
	public int updatePw(@Param("u_pw") String u_pw,@Param("us_pw") String us_pw);
	
	public UserVO findByPw(String u_pw);
	public UserVO findByNick(String u_nick);
	public UserVO findByMail(String u_mail);
	
	// 0716 조아영 - search메소드 추가
	public List<UserVO> searchById(String search);
	public List<UserVO> serchByNick(String search);	
	public List<UserVO> serchByMail(String search);	
	
}