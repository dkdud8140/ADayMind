package com.callor.mind.service;

import java.util.List;

import org.springframework.ui.Model;

import com.callor.mind.model.UserVO;
import com.callor.mind.model.WritingVO;

public interface UserService {
	
	// 관리자용 리스트출력 
	public List<UserVO> selectAll();
	
	//페이징 추가한 selectAll
	public List<UserVO> selectAllPage(int pageNum, Model model);
	
	public UserVO findById(String u_id);
	public UserVO findByPw(String u_pw, String u_id); // 비밀번호 확인
	public UserVO findByNick(String u_nick);
	public UserVO findByMail(String u_mail); 
	public UserVO findBySeq(Long u_seq); 
	
	
	public UserVO login(UserVO userVO);
	
	public UserVO join(UserVO userVO);	// 회원가입 
	public int update(UserVO userVO); // 회원정보 수정 
	public int updatePw(String u_pw, String us_pw, String u_id); // 비밀번호 수정
	public int expire(UserVO userVO); // 회원탈퇴 
	
	// 유저경고 업데이트 횟수 
	public int updateWarning(UserVO userVO);
	public int ban(Long seq);
	
	//0716 admim 페이지에서 목록검색하기
	public List<UserVO> search(int pageNum, String category, String search, Model model) throws Exception;
	
	public int delete(UserVO userVO);
	
	public int banOrLevelUp(UserVO userVO);
}