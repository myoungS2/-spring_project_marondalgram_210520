package com.marondalgram.like;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class LikeRestController {
	
	@PostMapping("/like/{postId}") // 동적으로 postId가 들어갈 예정 (레스트풀API방식으로 URL설계)
	public Map<String, Object> postLike(
			@PathVariable int postId, // 주소에서 값을 가져올 때 @PathVariable
			HttpServletRequest request){
	
		 // 글번호, 유저번호 필요
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// like BO한테 
		
		
	}
	
}
