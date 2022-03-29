package com.jcpdev.petSitter.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorSettingController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(ErrorSettingController.class);
	
	@GetMapping("/error404")
	public String Error404(HttpServletResponse res, Model model) {
//		LOGGER.warn("=========== ERROR 404 PAGE ==========");
		model.addAttribute("code","ERROR_404");
		return "WEB-INF/jsp/error/404page";
		
	}
	@GetMapping("/error500")
	public String Error500(HttpServletResponse res, Model model) {
//		LOGGER.warn("=========== ERROR 500 PAGE ==========");
		model.addAttribute("code","ERROR_500");
		return "WEB-INF/jsp/error/500page";
		
	}
	
}
