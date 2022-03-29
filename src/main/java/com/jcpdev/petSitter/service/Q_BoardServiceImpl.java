package com.jcpdev.petSitter.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcpdev.petSitter.dao.Q_BoardMapper;
import com.jcpdev.petSitter.model.Q_Board;
import com.jcpdev.petSitter.model.PageDto;



@Service
public class Q_BoardServiceImpl implements Q_BoardService{
	private static final Logger logger = LoggerFactory.getLogger(Q_BoardServiceImpl.class);
	
	@Autowired
	Q_BoardMapper dao;
	
	@Override
	public int insert(Q_Board dto) {
		logger.info("insert.............");
		return dao.insert(dto);
	}

	@Override
	public int getCount() {
		return dao.getCount();
	}

	@Override
	public List<Q_Board> getPagelist(PageDto dto) {
		return dao.getPagelist(dto);
	}

	@Override
	public int delete(int idx) {
		return dao.delete(idx);
	}

	@Override
	public Q_Board getQ_BoardOne(int q_idx) {
		return dao.getQ_BoardOne(q_idx);
	}

	@Override
	public int update(Q_Board dto) {
		return dao.update(dto);
	}

	@Override
	public void updateReadCnt(int q_idx) {
		dao.updateReadCnt(q_idx);
		
	}
	@Override
	public int searchCount(Map<String,Object> map) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.searchCount(map);
	}
	
	@Override
	public List<Q_Board> searchList(PageDto dto) {
		//paging에 검색을 위한 필드와 검색어 속성 포함
		return dao.searchList(dto);
	}
	
	@Override
	public Map<String,Object> searchList2(Map<String,Object> param){
		List<Q_Board> list;
		int totalCount;
		PageDto pageDto;
		
		int currentPage;//현재 페이지
		int pageSize=10;
		String page=(String) param.get("page");
		if(page==null || page.trim().length()==0) currentPage = 1;
		else currentPage = Integer.parseInt(page);   //page파라미터가 숫자로 넘어온경우만 실행. 
		param.put("currentPage", currentPage);
		param.put("pageSize", pageSize);
		
		String findText = (String) param.get("findText");
		String field = (String) param.get("field");
		totalCount = searchCount(param);
		
		pageDto=new PageDto(currentPage, pageSize, totalCount, field, findText);
		list = dao.searchList(pageDto);
		param.put("page", pageDto);
		param.put("list", list);
		return param;
		
	}
	

}
