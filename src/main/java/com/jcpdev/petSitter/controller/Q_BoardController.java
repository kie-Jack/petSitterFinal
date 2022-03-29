package  com.jcpdev.petSitter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.jcpdev.petSitter.model.Q_Board;
import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.model.PageDto;
import com.jcpdev.petSitter.service.Q_CommentService;
import com.jcpdev.petSitter.service.Q_BoardService;

@Controller
//@RequestMapping("/qna_community")    //-> view 폴더명 동일할때 생략, 리다이렉트 community 생략
public class Q_BoardController {
	private static final Logger logger = LoggerFactory.getLogger(Q_BoardController.class);
	
	@Autowired
	Q_BoardService service;
	
	@Autowired
	Q_CommentService  cmtservice;
	
	
	@RequestMapping(value={"/q_list"})   
	public String pageList(@RequestParam Map<String, Object> param,Model model) { //String page,String field,String findText,Model model) {
		logger.info("**q_board list 출력합니다.");
		
		int currentPage;//현재 페이지
		List<Q_Board> list;
		int totalCount; int pageSize=10;
		String page=(String) param.get("page");
		if(page==null || page.trim().length()==0) currentPage = 1;
		else currentPage = Integer.parseInt(page);   //page파라미터가 숫자로 넘어온경우만 실행. 
		
		//page를 사용자 맘대로 문자 대입하면 NumberFormatExceptrion 발생 -> ExceptionHandler 로 처리합니다.
		
		PageDto pageDto;
		//검색 기능사용할 때 검색필드와 검색키워드 뷰에 전달한다.

		String findText = (String) param.get("findText");
		String field=(String) param.get("field");
		
		totalCount=service.searchCount(param);   //서비스 메소드 타입 변경예정
		pageDto=new PageDto(currentPage, pageSize, totalCount, field, findText);
		list=service.searchList(pageDto);  //주석처리 예정
		Map<String,Object> map = new HashMap<String,Object>();    
		map.put("field",field);
		map.put("findText",findText);
		map.put("page", pageDto);			//view에게 전달할 모델객체 설정
		map.put("list",list);				//          "
		model.addAllAttributes(map);	//위에 4개의 put 실행한 map객체를 애트리뷰트에 저장한다.
		
		return "qna_community/list";
		
	}
	
	//상세보기 : 
	@RequestMapping("/q_detail")
	public String detail(int q_idx, int page,String field, String findText, Model model
			,HttpServletResponse response
			,@CookieValue(name="read",defaultValue = "abcde") String readidx) {
		if(!readidx.contains(String.valueOf(q_idx))) {
			readidx += "/" + q_idx;
			service.updateReadCnt(q_idx);
		}
		
		Cookie cookie = new Cookie("read", readidx);
		//쿠키 유효시간 설정, 
		cookie.setMaxAge(30*60);    //초 단위, 30분
		cookie.setPath("/board");   //쿠키 경로 설정
		response.addCookie(cookie);		//기존 쿠키 정보에 쿠기 항목 추가  //쿠키는 자바스크립트에서 접근 가능합니다. document.cookie -> 보안상 취약
					//쿠키가 HttpOnly 속성을 true -> 클라이언트 단에서는 쓰기 안됩니다. secure 속성은 암호화해서 전송 https 프로트콜 통신으로만 사용
		cmtservice.updateCountAll(q_idx);
		
		model.addAttribute("bean",service.getQ_BoardOne(q_idx) );
		model.addAttribute("q_commentlist",cmtservice.q_commentList(q_idx) );
		model.addAttribute("cr","\n" );
		model.addAttribute("page",page);
		model.addAttribute("field",field);
		model.addAttribute("findText",findText);
		
		return "qna_community/detail";
	}
	
	//글쓰기 - view  : insert() 메소드 
	@RequestMapping(value="/q_insert")
	public String insert(int page,Model model, 
			@SessionAttribute("member") Member member) {
		
		model.addAttribute("member", member);
		model.addAttribute("page", page);
		return "qna_community/insert";
	}  //view이름은 insert
	
	
	
	//글쓰기 - 저장   : save()메소드  리다이렉트 list로.
	@RequestMapping(value="/q_save")
	public String save(@ModelAttribute Q_Board dto) {   
		service.insert(dto);
		
		return "redirect:q_list";
	}
	
	@RequestMapping(value = "q_update", method = RequestMethod.GET)
	public String update(@RequestParam Map<String, String> param,Model model) {
		//로그인 되었을때만
		model.addAttribute("bean", service.getQ_BoardOne(Integer.parseInt(param.get("idx"))));
		model.addAllAttributes(param);
		logger.info(param.toString());			//파라미터 이름 확인하세요.-idx,page,field,findText
		//model.addAttribute("page", param.get("page"));
		return "qna_community/update";
	}
	
	
	//수정 내용 저장
	@RequestMapping(value = "q_update", method = RequestMethod.POST)
	public String save2(Q_Board q_board, int q_idx, int page,String field,String findText,Model model) {
		service.update(q_board);
		
		model.addAttribute("q_idx", q_board.getQ_idx());
		model.addAttribute("page", page);
		model.addAttribute("field",field);
		model.addAttribute("findText", findText);
		return "redirect:q_detail";   //수정
	}
	
	//삭제 
	@RequestMapping(value="q_delete")
	public String delete(@RequestParam Map<String,Object> param,Model model) {
		service.delete(Integer.parseInt((String)param.get("q_idx")));
		model.addAllAttributes(param);
		return "redirect:q_list";
	}
	
	@ExceptionHandler(NumberFormatException.class)
	public ModelAndView handleErr(HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", request.getRequestURL());   //애트리뷰트 저장
		mav.setViewName("/error/error");
		return mav;
	}
	
	
	
}
