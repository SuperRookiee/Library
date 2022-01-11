package org.book.mapper;

import java.util.List;

import org.book.domain.CartDTO;

public interface CartMapper {
	// 개인 장바구니 목록 출력
	public List<CartDTO> getList(String userId);

	// 개인 장바구니 목록 수 카운트
	public int getTotalCount(String userId);

	// 장바구니 목록 추가
	public void insert(CartDTO cart);

	// 장바구니 목록 삭제
	public void delete(String userId, String bookName);

	// 장바구니 전체 비우기
	public void deleteAll(String userId);

	// 도서수량 업데이트
	public int update(String userId, String bookName, int amount);

	// 도서총액 합산
	public int totalPrice(CartDTO cart);
}
