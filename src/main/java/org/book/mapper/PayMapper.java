package org.book.mapper;

import java.util.List;

import org.book.domain.CartDTO;

public interface PayMapper {
	// 개인 장바구니 목록 출력
	public List<CartDTO> getList(String userId);

	// 개인 장바구니 목록 수 카운트
	public int getTotalCount(String userId);

	// 도서총액 합산
	public int totalSumPrice(String userId);
	
	public String date(String userId);
}
