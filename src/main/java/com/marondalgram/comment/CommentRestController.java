package com.marondalgram.comment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	
	@PostMapping("/create")
	public Map<String, Object> commentCreate(
			@RequestParam("postId") int postId,
			HttpServletRequest request){
		
		// 로그인 확인
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// insert DB
		commentBO.;
		
		// return
		
		return result;
	}
	
	
}
