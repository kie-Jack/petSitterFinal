package com.jcpdev.petSitter.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.model.PetProfile;
import com.jcpdev.petSitter.service.PetProfileService;


@Controller
@SessionAttributes(names= {"petprofile"})

public class PetProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(PetProfileController.class);
	

	@Autowired
	PetProfileService service;
	
	@RequestMapping(value="pet_insert", method = RequestMethod.GET)
	public String insert_page(@SessionAttribute("member") Member member, Model model) {
		model.addAttribute("member", member);
		return "/pet_insert";
	}
	
	@RequestMapping(value="petinsertMulti", method = RequestMethod.POST)
	public String insertMulti(@SessionAttribute("member") Member member, Model model, 
			@ModelAttribute("petinsert") PetProfile pet) {
		
		System.out.println("펫 : "+pet);
		
		int result = service.p_check(pet);
		try {
			if(result == 1) {
				System.out.println("1");
				String msg = "이미 등록된 아이입니다.";
				model.addAttribute("member", member);
				model.addAttribute("msg", msg);
				model.addAttribute("url", "pet_insert");
				return "/alert_pet";
				
			}else if (result ==0) {
				System.out.println("2");
				service.insert(pet);
			}
		}catch (Exception e ) {
			throw new RuntimeException();
		}
		System.out.println("3"); 
		
		model.addAttribute("member", member);
		
		return "/pet_insert";
	}
	
	@ModelAttribute(name="petinsert")
	public PetProfile petinsert() {
		return new PetProfile();
	}
	
	@RequestMapping(value="petinsert",method=RequestMethod.POST)
	public String insert(@ModelAttribute("petinsert") PetProfile pet, Model model) {
		int result = service.p_check(pet);
		try {
			if(result == 1) {
				System.out.println("1");
				String msg = "이미 등록된 아이입니다.";
				model.addAttribute("msg", msg);
				model.addAttribute("url", "pet_insert");
				return "/alert_pet";
				
			}else if (result ==0) {
				System.out.println("2");
				service.insert(pet);
			}
		}catch (Exception e ) {
			throw new RuntimeException();
		}
		System.out.println("3"); 
		return "redirect:/";
	
	}
	@ResponseBody
	@RequestMapping(value="/p_check",method=RequestMethod.POST)
	public int p_check(PetProfile pet, Model model) {
		
		int result = service.p_check(pet);
		
		
		return result;
	}
}
