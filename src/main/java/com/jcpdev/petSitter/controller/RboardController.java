package com.jcpdev.petSitter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.model.PageDto2;
import com.jcpdev.petSitter.model.Rboard;
import com.jcpdev.petSitter.service.RboardService;



@Controller
//@RequestMapping("/community")
public class RboardController {
	@Autowired
	RboardService service;

	@RequestMapping(value = "/rblist")
	public String getList(@RequestParam Map<String, Object> param, Model model) {
		int currentPage;
		List<Rboard> list;
		int totalCount;
		int pageSize = 10;
		String page = (String) param.get("page");
		if (page == null || page.trim().length() == 0)
			currentPage = 1;
		else
			currentPage = Integer.parseInt(page);
		PageDto2 pageDto;
		
		String findText = (String) param.get("findText");
		String field=(String) param.get("field");
		totalCount = service.searchCount(param);
		pageDto = new PageDto2(currentPage, totalCount, pageSize,field, findText);
		list = service.getList(pageDto);
		Map<String, Object> map = new HashMap<>();
		map.put("field",field);
		map.put("findText",findText);
		map.put("list", list);
		map.put("page", pageDto);
		model.addAllAttributes(map);

		return "community/rblist";
	}

	@RequestMapping(value = "/rbdetail")
	public String getOne(int r_idx, int page, Model model, HttpServletResponse response,
			@CookieValue(name = "read", defaultValue = "abcde") String readidx,String field,String findText, 
			@SessionAttribute("member") Member member) {
		if (!readidx.contains(String.valueOf(r_idx))) {
			readidx += "/" + r_idx;
			service.readCount(r_idx);
		}
		Cookie cookie = new Cookie("read", readidx);

		cookie.setMaxAge(30 * 60);
		cookie.setPath("/petsitter");
		response.addCookie(cookie);

		model.addAttribute("bean", service.selectByIdx(r_idx));
		model.addAttribute("cr", "\n");
		model.addAttribute("page", page);
		model.addAttribute("field",field);
		model.addAttribute("findText",findText);
		
		System.out.println("gd : "+ member);
		model.addAttribute("member", member);
		
		return "community/rbdetail";
	}
	
	
	// by 최영재 - 21.11.24. 비로그인시(세션 없을경우) 추가
	@RequestMapping(value = "/rbdetailNotlogin")
	public String getOneL(int r_idx, int page, Model model, HttpServletResponse response,
			@CookieValue(name = "read", defaultValue = "abcde") String readidx,String field,String findText) {
		if (!readidx.contains(String.valueOf(r_idx))) {
			readidx += "/" + r_idx;
			service.readCount(r_idx);
		}
		Cookie cookie = new Cookie("read", readidx);
		
		cookie.setMaxAge(30 * 60);
		cookie.setPath("/petsitter");
		response.addCookie(cookie);
		
		model.addAttribute("bean", service.selectByIdx(r_idx));
		model.addAttribute("cr", "\n");
		model.addAttribute("page", page);
		model.addAttribute("field",field);
		model.addAttribute("findText",findText);
		
		return "community/rbdetail";
	}

	@RequestMapping(value = "/rbinsert")
	public String insert(@SessionAttribute("member") Member member , int page, Model model) {
		model.addAttribute("page", page);
		model.addAttribute("member", member);
		
		return "community/rbinsert";
	}

	@RequestMapping(value="/rbsave")
	public String save(@ModelAttribute Rboard rboard) {
		service.insert(rboard);
		
		return "redirect:rblist";
	}
	
	@RequestMapping(value="rbdelete")
	public String delete(@RequestParam Map<String,Object>param, Model model)
	{
		service.delete(Integer.parseInt((String)param.get("r_idx")));
		model.addAllAttributes(param);
		return "redirect:rblist";
	}
	
	@RequestMapping(value="rbupdate",method = RequestMethod.GET)
	public String update (@RequestParam Map<String, String> param, Model model) {
		model.addAttribute("bean", service.selectByIdx(Integer.parseInt(param.get("r_idx"))));
		model.addAllAttributes(param);
		
		return "community/rbupdate";
	}
	
	@RequestMapping(value="rbupdate", method = RequestMethod.POST)
	public String updatesave(Rboard rboard, int r_idx, int page,Model model,String field,String findText) {
		service.update(rboard);
		model.addAttribute("r_idx", rboard.getR_idx());
		model.addAttribute("field",field);
		model.addAttribute("findText", findText);
		model.addAttribute("page", page);
		
		return "redirect:rbdetail";
		
	}
	
	
	@RequestMapping(value="rbpopup")
	public String psByNick(@RequestParam Map<String, Object>param, Model model) {
		int currentPage;
		List<Member> list;
		int totalCount;
		int pageSize = 10;
		PageDto2 pageDto;
		
		String page = (String) param.get("page");
		if (page == null || page.trim().length() == 0)
			currentPage = 1;
		else
			currentPage = Integer.parseInt(page);

		String nick = (String) param.get("nick");
		totalCount = service.resultCount(nick);
		pageDto = new PageDto2(currentPage,totalCount,pageSize,nick);
		Map<String, Object> map = new HashMap<>();
		list = service.psByNick(pageDto);
		map.put("nick", nick);
		map.put("list", list);
		map.put("page", pageDto);
		model.addAllAttributes(map);
		
		return "community/rbpopup";
	}
}
