package com.jcpdev.petSitter.service;

import java.util.List;

import com.jcpdev.petSitter.model.Q_Comment;



public interface Q_CommentService {
	int insert(Q_Comment dto); //댓글 입력
	List<Q_Comment> q_commentList(int q_idx); //게시글 전체 댓글
	int q_commentCount(int qc_idx); //게시글 전체 댓글 개수
	int update(int qc_idx,String qc_content); //댓글 수정
	int delete(int qc_idx); //댓글 삭제
	void updateCountAll(int qc_idx);
}
