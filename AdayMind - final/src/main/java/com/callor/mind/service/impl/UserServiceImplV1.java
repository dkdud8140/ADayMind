package com.callor.mind.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.callor.mind.dao.ext.UserDao;
import com.callor.mind.model.PageDTO;
import com.callor.mind.model.UserVO;
import com.callor.mind.service.PageService;
import com.callor.mind.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service("userServiceV1")
public class UserServiceImplV1 implements UserService {

	protected final UserDao userDao;
	protected final PageService pSer;

	@Override
	public List<UserVO> selectAll() {
		// TODO Auto-generated method stub
		return userDao.selectAll();
	}

	// 아이디 중복검사
	@Override
	public UserVO findById(String u_id) {
		UserVO userVO = userDao.findById(u_id);
		if (userVO == null) {
			log.debug("사용할 수 있는 아이디 : {}", u_id);
		} else {
			log.debug("사용할 수 없는 아이디 : {}", userVO.toString());
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

		if (uList == null || uList.size() < 1) {
			userVO.setU_level(0);
		} else {
			userVO.setU_level(6);
		}
		userDao.insertOrUpdate(userVO);
		return userVO;
	}

	@Override
	public int expire(UserVO userVO) {
		return userDao.delete(userVO);
	}

	@Override
	public int updateWarning(UserVO userVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserVO findByPw(String u_pw, String u_id) {
		UserVO userVO = userDao.findByPw(u_pw, u_id);
		if (userVO == null) {
			log.debug("사용할 수 있는 패스워드: {}", u_pw);
		} else {
			log.debug("사용할 수 없는 패스워드: {}", u_pw);
		}
		return userVO;
	}

	@Override
	public int update(UserVO userVO) {
		return userDao.update(userVO);
	}

	@Override
	public int updatePw(String u_pw, String us_pw, String u_id) {
		return userDao.updatePw(u_pw, us_pw, u_id);
	}

	@Override
	public UserVO findByNick(String u_nick) {
		return userDao.findByNick(u_nick);
	}

	@Override
	public UserVO findByMail(String u_mail) {
		return userDao.findByMail(u_mail);
	}

	@Override
	public UserVO findBySeq(Long u_seq) {
		return userDao.findBySeq(u_seq);
	}

	@Override
	public int ban(Long seq) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//0716 조아영 - 검색메소드
	@Override
	public List<UserVO> search(String category, String search, Model model) throws Exception {
		List<UserVO> users = new ArrayList<UserVO>();
		
		if(category.equalsIgnoreCase("seq")) {
			Long u_seq = null;
			try {
				u_seq = Long.valueOf(search);
			} catch (Exception e) {
				return null;
			}
			UserVO user = userDao.findBySeq(u_seq);
			users.add(user);
		} else if(category.equalsIgnoreCase("id")) {
			users = userDao.searchById(search);
		} else if(category.equalsIgnoreCase("nick")) {
			users = userDao.serchByNick(search);
		}  else if(category.equalsIgnoreCase("mail")) {
			users = userDao.serchByMail(search);
		} 
		
		return users;
	}

	@Override
	public int delete(UserVO userVO) {
		return userDao.deleteByAdmin(userVO);
	}

	@Override
	public int banOrLevelUp(UserVO userVO) {
		
		int retBan = userDao.ban(userVO);
		
		return 0;
	}

	@Override
	public List<UserVO> selectAllPage(int pageNum, Model model) {
		List<UserVO> userList = userDao.selectAll();
		int totalList = userList.size();
		
		PageDTO pageDTO = pSer.makePage(totalList, pageNum);
		
		List<UserVO> pageList = new ArrayList<UserVO>();
		
		for(int i = pageDTO.getOffset() ; i <pageDTO.getLimit() ; i ++) {
			pageList.add(userList.get(i));
		}
		
		model.addAttribute("PAGE_NAV", pageDTO);
		model.addAttribute("USERS", pageList);
		
		return null;
	}
}