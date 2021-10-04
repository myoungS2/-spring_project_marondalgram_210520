package com.marondalgram.post.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.common.FileManagerService;
import com.marondalgram.post.dao.PostDAO;
import com.marondalgram.post.model.Post;

@Service
public class PostBO {
	// dao 연결
	@Autowired
	private PostDAO postDAO;
	
	// FMS 연결
	@Autowired
	private FileManagerService fileManagerService;
	
	// select DB
	public List<Post> getPostListByUserId(int userId){
		return postDAO.selectPostListByUserId(userId);
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
}
