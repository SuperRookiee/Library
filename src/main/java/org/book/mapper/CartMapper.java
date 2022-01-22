package org.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.book.domain.CartDTO;

public interface CartMapper {
	// 개인 장바구니 목록 출력
	public List<CartDTO> getList(String userId);

	// 개인 장바구니 목록 수 카운트
	public int getTotalCount(String userId);

	// 장바구니 목록 추가
	public void insert(CartDTO cart);
	
	// 구매 목록 추가
//	public void payAdd(List<CartDTO> cart);
	public void payAdd(String userId);

	// 장바구니 목록 삭제
	public int delete(@Param("userId") String userId,@Param("bookName") String bookName);

	// 장바구니 전체 비우기
	public int deleteAll(String userId);

	// 도서수량 업데이트
	public int update(@Param("userId") String userId,@Param("bookName") String bookName,@Param("amount") int amount);

	// 도서 가격
	public int totalPrice(@Param("userId") String userId,@Param("bookName") String bookName);
	
	// 도서총액 합산
	public int totalSumPrice(@Param("userId") String userId);
}
