package com.jcpdev.petSitter.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class smsController {
	

	  @RequestMapping(value = "sendsms/{to}", method = RequestMethod.POST)
	     public String sendSms(@PathVariable String to, Model model, HttpServletRequest request) throws Exception {

		  String api_key = "NCSBSXUSP1GWUFY4";
		  String api_secret = "F2SDOX70CWJRXXBQV33ZBFZJLLXR9CAK";

	       Coolsms coolsms = new Coolsms(api_key, api_secret);
	       
	       HashMap<String, String> set = new HashMap<String, String>();	    
	       set.put("to", to); // 수신번호

	       set.put("from", "01065351822"); // 발신번호
	       set.put("text", "[개잘돌봄] 인증번호를 입력해주세요 : " + (String)request.getParameter("text")); // 문자내용
	       set.put("type", "sms"); // 문자 타입

	       System.out.println(set);
	     
	       JSONObject result = coolsms.send(set);
	       System.out.println();

	       if ((boolean)result.get("status") == true) {
	         // 메시지 보내기 성공 및 전송결과 출력
	         System.out.println("성공");
	         System.out.println(result.get("result_code")); // 결과코드
	         System.out.println(result.get("result_message")); // 결과 메시지
	         System.out.println(result.get("success_count")); // 메시지아이디
	       } else {
	         // 메시지 보내기 실패
	         System.out.println("실패");
	         System.out.println(result.get("code")); // REST API 에러코드
	         System.out.println(result.get("message")); // 에러메시지
	       }

	       return "member/join";
	     }
	
	
}
