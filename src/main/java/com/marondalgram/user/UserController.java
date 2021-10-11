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
import com.marondalgram.timeline.bo.ContentBO;
import com.marondalgram.timeline.model.ContentView;
import com.marondalgram.user.bo.UserBO;
import com.marondalgram.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// user BO 연결
	@Autowired
	private UserBO userBO;
	
	// post BO 연결
	@Autowired
	private PostBO postBO;
	
	// content BO 연결
	@Autowired
	private ContentBO contentBO;
	
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
		
		User userInfo = userBO.getUserInfo(userId);
  		model.addAttribute("userInfo", userInfo);
		
		if (userId == userInfo.getId()) {
			List<ContentView> contentViewList = contentBO.generateContentViewList(userId); 
			model.addAttribute("contentViewList", contentViewList);
		}
//		List<Post> postList = postBO.getPostList(); //  DB에 가까운 객체 -> Entity
//		model.addAttribute("postList", postList);
		
		
		
		model.addAttribute("viewName", "user/profile_view");
		return "template/layout_profile";
	}
	
	// profile update view 연결
	@RequestMapping("/profile_update")
	public String profileUpdate(Model model) {
		model.addAttribute("viewName", "user/profile_update");
		return "template/layout_profile";
	}
	
	/**
	 * Sign Out
	 * @param request
	 * @return
	 */
	@RequestMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userLoginId");
		session.removeAttribute("userId");
		
		return "redirect:/user/sign_in_view";
	}
	

}
