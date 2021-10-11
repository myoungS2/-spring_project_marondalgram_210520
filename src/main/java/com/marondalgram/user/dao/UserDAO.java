package com.marondalgram.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondalgram.user.model.User;

@Repository
public interface UserDAO {
	// id 중복확인
	public boolean existLoginId(String loginId);
	
	// insert DB
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	// select DB
	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	// select DB
	public User selectUser(int id);
	
	//update DB
	public void updateUser(
			@Param("id") int id,
			@Param("name") String name, 
			@Param("website") String website, 
			@Param("introduce") String introduce);
	
	// select DB(list)
	public User selectUserInfo(int id);
}
