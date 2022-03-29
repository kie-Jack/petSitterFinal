package com.jcpdev.petSitter.controller;

import java.util.HashMap;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.jcpdev.petSitter.service.MemberService;


@RestController
public class CheckController {
	private static final Logger logger = LoggerFactory.getLogger(CheckController.class);
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="IdCheck/{id}", method = { RequestMethod.GET})
	public @ResponseBody Map<String,Object> IdCheck(@PathVariable String id, Model model) {
		System.out.println(id);
		boolean result = true;
		if( service.IdCheck(id)==1) result=false;
		else result=true;
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("data", result);
		return data;
	}
	
	@RequestMapping(value="NickCheck/{nick}", method = { RequestMethod.GET})
	public @ResponseBody Map<String,Object> NickCheck(@PathVariable String nick, Model model) {
		System.out.println(nick);
		boolean result = true;
		if( service.NickCheck(nick)==1) result=false;
		else result=true;
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("data", result);
		return data;
	}

}