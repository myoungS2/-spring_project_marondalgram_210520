package com.marondalgram.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondalgram.post.bo.PostBO;
import com.marondalgram.post.model.Post;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// post BO 연결
	@Autowired
	private PostBO postBO;
	
	// sign in view 연결
	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout_login";
	}
	
	// sign up view 연결
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/sign_up");
		return "template/layout_login";
	}
	
	// profile view 연결
	@RequestMapping("/profile_view")
	public String profileView(Model model, HttpServletRequest request) {
		// 글 목록을 가져온다. (로그인 된 아이디가 쓴 글만 test1/0000 /userId=1)
		 HttpSession session = request.getSession();
	
		 // session 검증
		 Integer userId = (Integer) session.getAttribute("userId");
		
		List<Post> postList = postBO.getPostList(); //  DB에 가까운 객체 -> Entity
		model.addAttribute("postList", postList);
		
		model.addAttribute("viewName", "user/profile_view");
		return "template/layout_profile";
	}
	
	// profile update view 연결
	@RequestMapping("/profile_update")
	public String profileUpdate(Model model) {
		model.addAttribute("viewName", "user/profile_update");
		return "template/layout_profile";
	}
}
