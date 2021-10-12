package com.marondalgram.post.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.common.FileManagerService;
import com.marondalgram.post.dao.PostDAO;
import com.marondalgram.post.model.Post;

@Service
public class PostBO {
	
	// logger
	private Logger logger = LoggerFactory.getLogger(PostBO.class);
	
	// dao 연결
	@Autowired
	private PostDAO postDAO;
	
	// FMS 연결
	@Autowired
	private FileManagerService fileManagerService;
	
	// select DB
	public List<Post> getPostList(){
		return postDAO.selectPostList();
	}
	
	// insert DB
	public int createPost(int userId, String loginId, String content, MultipartFile file) {
		String imgUrl = null;
		
		if (file != null) {
			try {
				imgUrl = fileManagerService.saveFile(loginId, file);
			} catch (IOException e) {
				imgUrl = null;  // null값 넣어주기..! (에러나도 큰 문제x)
			}
		} 
		
		return postDAO.insertPost(userId, content, imgUrl);
	}
	
	// delete DB
	public void deletePost(int postId) {
		// postId로 post를 가져온다.
		Post post = postDAO.selectPost(postId);
		
		if (post == null) {
			logger.error("[delete post] no post to delete.");
			return;
		}
		
		// delete post
		postDAO.deletePost(postId);
		
		// 댓글도 삭제
		// 좋아요도 삭제
		
		// 그림도 삭제
		String imgUrl = post.getImgUrl();
		if (imgUrl != null) {
			try {
				fileManagerService.deleteFile(imgUrl);
			} catch (IOException e) {
				logger.error("[delete post] 그림 삭제 실패 postId: {}, path: {}", postId, imgUrl); // 그림 삭제를 실패하더라도, post는 지울 것..! (return x)
			}
		}
	}
	
	// select DB
	public List<Post> getPostImg(int userId) {
		return postDAO.selectPostImg(userId);
	}
	
}










