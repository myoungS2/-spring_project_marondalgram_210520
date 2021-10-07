package com.marondalgram.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
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
	public String profileView(Model model) {
		model.addAttribute("viewName", "user/profile_view");
		return "template/layout_profile";
	}
	
	// profile update view 연결
	@RequestMapping("/profile_update")
	public String profileUpdate(Model model) {
		model.addAttribute("viewName", "user/profile_view");
		return "template/layout_profile";
	}
}
