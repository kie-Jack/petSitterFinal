package com.jcpdev.petSitter.dao;


import java.util.List;
import java.util.Map;

import com.jcpdev.petSitter.model.Q_Board;
import com.jcpdev.petSitter.model.PageDto;




public interface Q_BoardMapper { 
	int getCount();								//전체 게시글 카운트
	List<Q_Board> getAll();					//전체 게시글
	List<Q_Board> getPagelist(PageDto dto);	//한페이지 게시글
	int insert(Q_Board dto);					//insert
	int delete(int q_idx);						//delete
	Q_Board getQ_BoardOne(int q_idx);				//한개 검색
	int update(Q_Board dto);					//update
	void updateReadCnt(int q_idx);
	int searchCount(Map<String,Object> map);	//검색 카운트
	List<Q_Board> searchList(PageDto dto);		//검색 게시글
}
