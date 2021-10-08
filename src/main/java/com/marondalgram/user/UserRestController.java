package com.marondalgram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marondalgram.common.EncryptUtils;
import com.marondalgram.user.bo.UserBO;
import com.marondalgram.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	// logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	/**
	 * 회원가입
	 * @param loginId
	 * @param password
	 * @return
	 */
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
	
	/**
	 * 로그인
	 * @param loginId
	 * @param password
	 * @param request
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> SignIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request){
		
		// 파라미터로 받은 비밀번호를 해싱한다.
		String encryptPassword = EncryptUtils.md5(password);
		
		// select DB (id와 해싱 된 pw로)
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		// 일치하는 값 있으면 -> sign in success
		if (user != null) {
			result.put("result", "success");
		// 세션 (로그인 상태 유지)
			HttpSession session = request.getSession();
		// 담고싶은 정보 담기
			session.setAttribute("loginId", user.getLoginId());
			session.setAttribute("userId", user.getId());
			
		
		} else {
			// 일치하는 값 없으면 -> sign in fail
			result.put("result", "error");
		}
		
		
		// 결과 리턴
		return result;
	}
	
	// 사용자 정보 수정
	@PostMapping("/profile_update")
	public Map<String, Object> profileUpdate(
			@RequestParam("userId") int userId,
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="website", required=false) String website,
			@RequestParam(value="introduce", required=false) String introduce,
			HttpServletRequest request){
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			result.put("result", "error");
			logger.error("[update user] No loginId to update info.");
		}
		
		// updateBO
		userBO.updateUserByUserId(userId, name, website, introduce);
		result.put("result", "success");
		
		// 결과 리턴
		return result;
	}
	
}	
	
	
	
	
	
	
	
	