package com.marondalgram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.user.dao.UserDAO;
import com.marondalgram.user.model.User;

@Service
public class UserBO {
	// dao 연결
	@Autowired
	private UserDAO userDAO;
	
	// id 중복확인 (0이 아닌 수는 모두 true -> 중복)
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	// insert DB
	public void addUser (String loginId, String password) {
		userDAO.insertUser(loginId, password);
	}
	
	// select DB
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
}
