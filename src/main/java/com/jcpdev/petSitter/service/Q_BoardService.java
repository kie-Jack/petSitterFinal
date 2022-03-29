package com.jcpdev.petSitter.service;

import java.util.List;
import java.util.Map;

import com.jcpdev.petSitter.model.Q_Board;
import com.jcpdev.petSitter.model.PageDto;



public interface Q_BoardService {
	//서비스 인터페이스에서는 dao의 메소드들을 구현하고 session,request등을 제어하는 메소드 설계 작성
	int insert(Q_Board dto);
	int getCount();
	List<Q_Board> getPagelist(PageDto dto);
	int delete(int q_idx);
	Q_Board getQ_BoardOne(int q_idx);
	int update(Q_Board dto);
	void updateReadCnt(int q_idx);
	int searchCount(Map<String,Object> map);
	List<Q_Board> searchList(PageDto dto);
	Map<String,Object> searchList2(Map<String,Object> param);
}
