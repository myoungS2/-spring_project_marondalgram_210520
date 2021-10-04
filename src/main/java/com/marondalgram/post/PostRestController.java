package com.marondalgram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.post.bo.PostBO;

@RequestMapping("/post")
@RestController
public class PostRestController {
	// bo 연결
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("content") String content,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		
		// session에서 userId를 가져온다.
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String loginId = (String) session.getAttribute("loginId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error"); // 기본값으로 error를 넣고, 성공 시 바꿔줄 것!
		
		// insert DB(BO가 할 것!) -> userId, loginId, content, file
		int row = postBO.createPost(userId, loginId, content, file);
		if (row > 0) {
			// 성공
			result.put("result", "success");
		}
		
		// 결과값 response
		return result;
		
	
	
	}
}
