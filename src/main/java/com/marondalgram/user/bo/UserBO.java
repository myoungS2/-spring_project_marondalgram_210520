package com.marondalgram.user.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.user.dao.UserDAO;
import com.marondalgram.user.model.User;

@Service
public class UserBO {
	
	// logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// dao 연결
	@Autowired
	private UserDAO userDAO;
	
	/**
	 * id 중복확인
	 * @param loginId
	 * @return
	 */
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	/**
	 * 회원가입
	 * @param loginId
	 * @param password
	 */
	public void addUser (String loginId, String password) {
		userDAO.insertUser(loginId, password);
	}
	
	/**
	 * 로그인
	 * @param loginId
	 * @param password
	 * @return
	 */
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
	
	private User getUser(int userId) {
		return userDAO.selectUser(userId);
	}
	
	// update DB
	public void updateUser(int userId,String name, String website, String introduce) {
		User user = getUser(userId);
		if (user == null) {
			logger.error("[update user] No userId");
		}
		userDAO.updateUser(userId, name, website, introduce);
	}

	// select DB
	public User getUserInfo(int userId){
		return userDAO.selectUserInfo(userId);
	}
	
}
