package com.jcpdev.petSitter.dao;

import java.util.List;
import java.util.Map;

import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.model.PageDto2;
import com.jcpdev.petSitter.model.Rboard;


public interface RboardMapper {
	List<Rboard> getList(PageDto2 dto);
	Rboard selectByIdx(int r_idx);
	int getCount();
	int update(Rboard dto);
	int delete(int r_idx);
	void readCount(int r_idx);
	int insert(Rboard rboard);
	int resultCount(String nick);
	List<Member> psByNick(PageDto2 dto);
	List<Member> getPsList(PageDto2 dto);
	int psCount();
	int searchCount(Map<String,Object>map);
}
