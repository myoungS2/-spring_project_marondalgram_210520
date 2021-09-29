package com.marondalgram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marondalgram.common.EncryptUtils;
import com.marondalgram.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	// bo 연결
	@Autowired
	private UserBO userBO;
	
	/**
	 * 아이디 중복확인 체크
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is_duplicated_id")
	public Map<String, Boolean> isDubplicatedId(
			@RequestParam("loginId") String loginId) {
		
		// 로그인 아이디 중복 여부 -> DB 조회
		
		// 중복 여부에 대한 결과 Map 생성
		// ajax 동작여부 체크용
		Map<String, Boolean> result = new HashMap<>();
		result.put("result", userBO.existLoginId(loginId));
		
		// return Map
		return result;
	}
	
	// insert DB
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		
		// 비밀번호 -> 해싱
		String encryptPassword = EncryptUtils.md5(password);
		
		// insert DB
		userBO.addUser(loginId, encryptPassword);
		
		// 응답값 생성 후 리턴
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}

	
	
	
	
}	
	
	
	
	
	
	
	
	