/*
	작성자 : 최영재
	날짜 : 21.11.16
	내용 : ps_board.xml의 sql문을 참고하여 변수선언
 */
package com.jcpdev.petSitter.dao;


import java.util.List;
import java.util.Map;

import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.model.Pet;
import com.jcpdev.petSitter.model.Ps_board;
import com.jcpdev.petSitter.model.R_board;
import com.jcpdev.petSitter.model.Reservation;

public interface Ps_boardMapper {
	int psb_insert(Ps_board ps_board);			// 펫시터 게시글저장
	Ps_board psb_getList(int psb_idx);			// 게시글 불러오기
	List<Pet> p_getList(int idx);				// 펫 리스트 불러오기 
	Member m_getList(int idx);					// 회원정보 불러오기(로그인유저)
	double rate(String ps_nick);				// 평점 불러오기
	String rateCnt(String ps_nick);				// 평점 갯수
	int psr_insert(Reservation reservation);	// 예약내역 저장
	int plusPoint(Map<String, Object> map);		// 포인트 증가 
	int minusPoint(Map<String, Object> map);	// 포인트 감소 
	int plusIncome(Map<String, Object> map);	// 수익 증가 
	List<R_board> r_getList(String ps_nick);	// 후기 리스트 불러오기 
	int psb_update(Ps_board ps_board);			// 게시글 수정 
	int psb_delete(int psb_idx);				// 게시글 삭제 
	String checkIncome();						// 수익 불러오기
	Member ps_getList(int psb_idx);				// 펫시터 정보 불러오기
}
