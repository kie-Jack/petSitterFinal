package com.jcpdev.petSitter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.service.MemberService;
import com.jcpdev.petSitter.service.Ps_boardService;




/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes(names={"join"})
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@Autowired
	MemberService service;
	
	@Autowired
	Ps_boardService psService;
	
	@ModelAttribute(name="join")
	public Member setJoin() {
		return new Member();
	}
	
	
	@RequestMapping(value={"/","/list"})   //(value={"/","/list"})
	public String list(Model model) {
		logger.info("고객 리스트 요청입니다.");
		List<Member> list = service.selectAll();
		model.addAttribute("list", list);
		return "admin/list";
	}
	
	@RequestMapping(value="/join",params="start=1")
	public String join() {
			return "/member/auth";
	}
	
	@RequestMapping(value="/join",params = "step=1")
	public String join1(@ModelAttribute("join") Member member) {
		logger.info("--" + member.getTo());
		return "/member/service_terms";
	}
	
	@RequestMapping(value="/join",params = "step=2")
	public String join2(@ModelAttribute("join") Member member) {
		logger.info("--" + member.getTo());

		return "/member/join";
	}

	@RequestMapping(value="/join",params="save", method=RequestMethod.POST)
	public String registration(@ModelAttribute("join")Member join,SessionStatus status,Model model) {
		
		service.insert(join);
		logger.info("고객등록 완료 idx =" + join.getIdx());
		status.setComplete();
		return "/login";
	}
	
	@RequestMapping(value="detail")
	public String detail(@SessionAttribute("member") Member member, Model model) {
		String income = psService.checkIncome();
		model.addAttribute("income", income);
		
		return "/member/detail";
	}
	
	@RequestMapping(value="/update")
	public String update(@SessionAttribute("member") Member member){
			return "/member/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public ModelAndView save(@ModelAttribute Member mod_cus,Model model, HttpSession session){
		
		session.removeAttribute("member");
		service.update(mod_cus);
		mod_cus = service.selectOne(mod_cus.getIdx());
		session.setAttribute("member", mod_cus);
		ModelAndView mv = new ModelAndView();
		mv.addObject("alert", "");
		mv.addObject("member", mod_cus);   
		mv.setViewName("redirect:detail");		//경로 안하면 오류. default 전달할 때와 다르니 주의
		return mv;
	}
	@RequestMapping(value="updatepoint")
	public String updatepoint(@SessionAttribute("member") Member member){
			return "/member/updatepoint";
	}
	
	@RequestMapping(value="updatepoint", method = RequestMethod.POST)
	public ModelAndView updatepoint(@ModelAttribute Member point, Model model, HttpSession session){
		session.removeAttribute("member");
		service.updatepoint(point);
		point = service.selectOne(point.getIdx());
		session.setAttribute("member", point);
		ModelAndView mv = new ModelAndView();
		mv.addObject("alert", "");
	    mv.addObject("member", point);
	    mv.setViewName("redirect:/"); 
	    return mv;
	}

	
	@RequestMapping(value="delete")
	public String delete(int idx,String password,HttpSession session) {
		service.delete(idx, password);
		session.invalidate();
		return "redirect:/";
	}
	

}