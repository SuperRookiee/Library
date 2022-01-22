package org.book.service;

import java.util.List;

import org.book.domain.CartDTO;
import org.springframework.stereotype.Service;
@Service
public interface CartService {

	public void register(CartDTO cart);//장바구니 추가

	public void modify(String userId, String bookName, int amount);

	public void remove(String userId, String bookName);

	public boolean removeAll(String userId);

	public List<CartDTO> getList(String userId);

	public int getTotalCount(String userId);

	public int totalPrice(String userId, String bookName);
	
	public int totalSumPrice(String userId);
	
//	public void payAdd(List<CartDTO> pay);//구매목록 추가
	public void payAdd(String userId);//구매목록 추가
	

}
