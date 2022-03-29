package com.jcpdev.petSitter.service;

import java.util.List;

import com.jcpdev.petSitter.model.Member;

public interface MemberService {
	Member login(Member user);
	Member selectOne(int idx);
	int insert(Member member);
	int update(Member member);
	int delete(int idx, String password);	
	List<Member> selectAll();
	int updatepoint(Member member);
	int IdCheck(String id);
	int NickCheck(String nick);
}
