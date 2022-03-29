package com.jcpdev.petSitter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcpdev.petSitter.dao.Q_CommentMapper;
import com.jcpdev.petSitter.model.Q_Comment;



@Service
public class Q_CommentServiceImpl implements Q_CommentService{
	@Autowired
	Q_CommentMapper cdao;
	
	@Override
	public int insert(Q_Comment dto) {
		return cdao.insert(dto);
	}

	@Override
	public List<Q_Comment> q_commentList(int qc_idx) {
		return cdao.q_commentList(qc_idx);
	}

	@Override
	public int q_commentCount(int qc_idx) {
		return cdao.q_commentCount(qc_idx);
	}

	@Override
	public int update(int qc_idx,String qc_content) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("qc_idx", qc_idx);
		map.put("qc_content", qc_content);
		return cdao.update(map);
	}

	@Override
	public int delete(int qc_idx) {
		return cdao.delete(qc_idx);
	}
	
	@Override
	public void updateCountAll(int qc_idx) {
		// TODO Auto-generated method stub
		cdao.updateCountAll(qc_idx);
	}
	
}
