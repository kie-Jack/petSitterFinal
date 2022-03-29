package com.jcpdev.petSitter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jcpdev.petSitter.model.Q_Comment;
import com.jcpdev.petSitter.service.Q_CommentService;



@Controller
@RequestMapping(value={"/comment"})
public class Q_CommentController {
	
	@Autowired
	Q_CommentService service;
	
	//리퀘스트핸들러매핑을 파라미터(get)로 한다.
	@RequestMapping(params="action=insert",method=RequestMethod.POST)
	public String insert(@ModelAttribute Q_Comment comt,int page, int func,Model model ) {
		if(func==1) {
			System.out.println("**insert"+comt);
			service.insert(comt);
			service.updateCountAll(comt.getQ_idx());
		}else if (func==2){
			service.update(comt.getQc_idx(),comt.getQc_content());
		}
		model.addAttribute("q_idx", comt.getQ_idx());
		model.addAttribute("page", page);
		return "redirect:q_detail";
	}
	
	//이 메소드는 ?action=delete 파라미터로만 매핑합니다. GET,POST 모두 매핑될수 있습니다.
	@RequestMapping(params="action=delete")
	public String delete(int qc_idx,int page,int q_idx,Model model) {
		service.delete(qc_idx);    //댓글 번호
		service.updateCountAll(qc_idx);
		model.addAttribute("q_idx", q_idx);    //메인글번호
		model.addAttribute("page", page);
		return "redirect:q_detail";
	}
	
}
