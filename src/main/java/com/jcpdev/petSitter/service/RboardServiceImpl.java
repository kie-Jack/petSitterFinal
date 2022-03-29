package com.jcpdev.petSitter.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcpdev.petSitter.dao.RboardMapper;
import com.jcpdev.petSitter.model.Member;
import com.jcpdev.petSitter.model.PageDto2;
import com.jcpdev.petSitter.model.Rboard;
@Service
public class RboardServiceImpl implements RboardService {

	@Autowired
	RboardMapper dao;
	
	@Override
	public List<Rboard> getList(PageDto2 dto) {
		return dao.getList(dto);
	}

	@Override
	public Rboard selectByIdx(int r_idx) {
		return dao.selectByIdx(r_idx);
	}

	@Override
	public int getCount() {
		return dao.getCount();
	}

	@Override
	public int update(Rboard dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int r_idx) {
		return dao.delete(r_idx);
	}

	@Override
	public void readCount(int r_idx) {
		dao.readCount(r_idx);
	}

	@Override
	public int insert(Rboard rboard) {
		return dao.insert(rboard);
		
	}

	@Override
	public int resultCount(String nick) {
		return dao.resultCount(nick);
	}

	@Override
	public List<Member> psByNick(PageDto2 dto) {
		return dao.psByNick(dto);
	}

	@Override
	public List<Member> getPsList(PageDto2 dto) {
		return dao.getPsList(dto);
	}

	@Override
	public int psCount() {
		return dao.psCount();
	}

	@Override
	public int searchCount(Map<String, Object> map) {
		return dao.searchCount(map);
	}


	
}
