package com.marondalgram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.like.bo.LikeBO;
import com.marondalgram.post.bo.PostBO;

@RequestMapping("/post")
@RestController
public class PostRestController {
	
	// logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// postBO 연결
	@Autowired
	private PostBO postBO;
	
	// likeBO 연결
	@Autowired
	private LikeBO likeBO;
	
	/**
	 * Create Post
	 * @param content
	 * @param file
	 * @param request
	 * @return
	 */
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
	
	/**
	 * Delete Post
	 * @param postId
	 * @return
	 */
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId){
		
		// delete DB
		// 2. postBO를 불러서 postId를 가져와서 삭제..! => 좋은 구조 (BO에서 처리를 하게 하는것!)
		postBO.deletePost(postId);//
		
		// 글, 사진, 댓글, 좋아요 -> 모두 삭제해야함..! 
		// 방법 1. 컨트롤러가 각각의 BO를 불러서..!
		
//		comment -> postId로 삭제
//		like -> postId로 삭제
//		그림 ->
		
		// 결과 return
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
	@RequestMapping("/like")
	public Map<String, Object> like(
			@RequestParam("postId") int postId,
			HttpServletRequest request){
		
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			result.put("result", "error");
			logger.error("[like] No userId");
			return result;
		}
		
		likeBO.LikeYn(postId, userId);
		result.put("result", "success");
		return result;
	}
}
