package org.book.service;

import java.util.List;

import org.book.domain.CommentDTO;

public interface CommentService {
	//리뷰 등록
	public int register(CommentDTO comment);
	//리뷰 수정
	public int modify(CommentDTO comment);
	//리뷰 삭제
	public int remove(String name, String isbn);
	//리뷰 불러오기
	public List<CommentDTO> getList(String isbn);
	//리뷰 숫자
	public int totalCount(String isbn);
	
}