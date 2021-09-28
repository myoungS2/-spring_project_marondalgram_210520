package com.marondalgram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	// id 중복확인
	public boolean existLoginId(String loginId);
	
	// insert DB
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password);
}
