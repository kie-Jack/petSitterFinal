package com.jcpdev.petSitter.dao;

import java.util.List;
import java.util.Map;

import com.jcpdev.petSitter.model.Q_Comment;

public interface Q_CommentMapper {
	int insert(Q_Comment dto); //댓글 입력
	List<Q_Comment> q_commentList(int q_idx); //게시글 전체 댓글
	int q_commentCount(int qc_idx); //게시글 전체 댓글 개수
	int update(Map<String,Object> map); //댓글 수정
	int delete(int qc_idx); //댓글 삭제
	void updateCountAll(int qc_idx);
}
