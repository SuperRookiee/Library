package org.book.service;

import java.util.List;

import org.book.domain.CartDTO;

public interface CartService {

	public void register(CartDTO cart);

	public boolean modify(String userId, String bookName, int amount);

	public boolean remove(String userId, String bookName);

	public boolean removeAll(String userId);

	public List<CartDTO> getList(String userId);

	public int getTotalCount(String userId);

	public int totalPrice(CartDTO cart);

}
