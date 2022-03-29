package com.jcpdev.petSitter.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jcpdev.petSitter.model.AdopttimeDto;
import com.jcpdev.petSitter.model.AdopttimeDto_second;
import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.model.Pet;
import com.jcpdev.petSitter.model.PetsitterDto;
import com.jcpdev.petSitter.model.Petsitter_Select_PageDto;
import com.jcpdev.petSitter.model.Ps_board;
import com.jcpdev.petSitter.model.R_board;
import com.jcpdev.petSitter.service.PetSitterSelectService;
import com.jcpdev.petSitter.service.Ps_boardService;


@Controller
//@RequestMapping("/petsitter")
public class PetsitterSelectController {
	private static final Logger logger = LoggerFactory.getLogger(PetsitterSelectController.class);
	
	@Autowired
	PetSitterSelectService service;
	
	@Autowired
	Ps_boardService service2;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String login() {
		return "petsitter_view/petsitter_select"; 
	}
	
	@RequestMapping(value = "/pet_board_join", method = RequestMethod.GET)
	public String pet_board_join() {
		return "ps_board/ps_boardRead"; 
	}
	
	@RequestMapping(value="/petsitter_select")		//★★★★★★★ 수정 밑에 매개변수 수정 ★★★★★★★
	public String petList(String page,String m_addr,String wdate_start,String wdate_final,String[] terms2,String field,String findText,Model model) { 
		logger.info("**PetSitter list 출력합니다.");
		int pageNo;
		if(page==null) {			//수정
			pageNo=1;
		}else { 
		pageNo = Integer.parseInt(page);			//수정
		System.out.println(pageNo);
		}
		int pageSize =3;
		
		String terms = Arrays.toString(terms2);
		terms = terms.substring(1, terms.length()-1);
	 	
	 	System.out.println(findText);
	 	System.out.println(field);
	 	System.out.println(m_addr);
	 	System.out.println(wdate_start);
	 	System.out.println(wdate_final);
	 	System.out.println(terms);
	 
	 	AdopttimeDto adopt = new AdopttimeDto(m_addr,wdate_start,wdate_final,terms,findText,field);
		if(m_addr=="" && wdate_start=="" && wdate_final=="" && terms.equals("ul")  && findText==null && field==null ){ //전체 조회후 밑에 조회 하지않았을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_All(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_All(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr=="" && wdate_start=="" && wdate_final=="" && terms.equals("ul") && findText!=null && field!=null ) { //전체 조회후 밑에 조회하였을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_All(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			System.out.println(pageDto);
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			System.out.println(adopt_second);
			List<PetsitterDto> cmts = service.PetSitter_Select_All(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr=="" && wdate_start!="" && wdate_final!="" && terms.equals("ul") && findText==null && field==null){ //날짜만 조회하고 밑에 조회 안했을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Date(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Date(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr=="" && wdate_start!="" && wdate_final!="" && terms.equals("ul") && findText!=null && field!=null) {	//날짜만 조회하고 밑에 조회 했을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Date(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Date(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
		
		}else if(m_addr=="" && wdate_start!="" && wdate_final!="" && terms!=null && findText==null && field==null) { //날짜, 조건만입력하고 조회 밑에 조회 x
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Date_terms(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Date_terms(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
		
		}else if(m_addr=="" && wdate_start!="" && wdate_final!="" && terms!=null && findText!=null && field!=null) { //날짜, 조건만입력하고 조회 밑에 조회 O
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Date_terms(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Date_terms(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
		
		}else if(m_addr!="" && wdate_start=="" && wdate_final=="" && terms.equals("ul") && findText==null && field==null ){ //주소만 입력하고 밑에 조회를 하지않았을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Adrr(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Addr(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr!="" && wdate_start=="" && wdate_final=="" && terms.equals("ul")  && findText!=null && field!=null ) { //주소 조회후 밑에 조회하였을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Adrr(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Addr(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
		
		}else if(m_addr=="" && wdate_start=="" && wdate_final=="" && terms!=null && findText==null && field==null){ //체크박스 체크만 하고 조회하고 아래 조회 안했을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_terms(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_terms(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr=="" && wdate_start=="" && wdate_final=="" && terms!=null && findText!=null && field!=null) {	//체크박스 체크만 하고 조회하고 아래 조회 했을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_terms(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_terms(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr!="" && wdate_start!="" && wdate_final!="" && terms.equals("ul") && findText==null && field==null) { //주소와 날짜만 기입했을때 조회후 밑에 조회를 하지않았을경우
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Add_Date(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Addr_date(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
		
		}else if(m_addr!="" && wdate_start!="" && wdate_final!="" && terms.equals("ul") && findText!=null && field!=null) {//주소와 날짜만 기입했을때 조회후 밑에 조회를 했을경우
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Add_Date(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Addr_date(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr!="" && wdate_start=="" && wdate_final=="" && terms!=null && findText==null && field==null) { //주소와 체크박스 입력하고 밑에 조회를 하지 않았을 경우
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Adrr_terms(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.select_Adrr_terms(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr!="" && wdate_start=="" && wdate_final=="" && terms!=null && findText!=null && field!=null) { //주소와 체크박스만 입력하고 밑에 조회를 했을경우
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Adrr_terms(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.select_Adrr_terms(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr!="" && wdate_start!="" && wdate_final!="" && terms!=null && findText==null && field==null) { //다 입력하고 조회하고 밑에는 입력안했을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Add_Date_Terms(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			List<PetsitterDto> cmts = service.PetSitter_Select_Add_Date_Terms(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
			
		}else if(m_addr!="" && wdate_start!="" && wdate_final!="" && terms!=null && findText!=null && field!=null) { //다 입력하고 조회하고 밑에는 입력했을때
			Petsitter_Select_PageDto pageDto = new Petsitter_Select_PageDto(pageNo,service.getCount_Add_Date_Terms(adopt),pageSize,m_addr,wdate_start,wdate_final,terms,findText,field);
			
			int StartNo = pageDto.getStartNo();
			AdopttimeDto_second adopt_second = new AdopttimeDto_second(m_addr,wdate_start,wdate_final,terms,pageSize,StartNo,findText,field);
			
			List<PetsitterDto> cmts = service.PetSitter_Select_Add_Date_Terms(adopt_second);
			model.addAttribute("pageDto",pageDto);
			model.addAttribute("cmtlist", cmts);
		}
		
		return "petsitter_view/petsitter_select";
	}  
	 
	
	
	
}