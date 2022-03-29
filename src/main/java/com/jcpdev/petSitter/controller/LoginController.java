package com.jcpdev.petSitter.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.service.MemberService;

@Controller
@SessionAttributes("member")
public class LoginController {
	
	private final MemberService service;
	
	public LoginController(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(String alert,Model model) {
		if(alert !=null && alert.equals("y")) {
		model.addAttribute("message","로그인이 필요합니다.");  
		model.addAttribute("url","login");
		return "alert";	
		}
		
		return "login";  
	}
	
	// -> 로그인 정보를 Model 객체로 전달받습니다.
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginOk(String id,String password,Model model) {  //customer 가 모델객체입니다.(로그인정보 저장된상태)
		//로그인 정보 일치하는지 확인.
		Member result = service.login(Member.builder().id(id).password(password).build());
		if(result != null) {
			//로그인 성공- session에 result 저장합니다.
			model.addAttribute("member", result);
			return "home";   //정상 로그인 후 -> home.jsp(뷰)
		}else { 
			//로그인 실패
			String message="로그인 정보가 틀립니다.";
			model.addAttribute("message",message );  
			model.addAttribute("url","login");
			return "alert";
		}
	}
	
	@RequestMapping(value = "logout")  
	public String logout(SessionStatus status) { 
		status.setComplete();
		return "redirect:/";
	}
	
}
