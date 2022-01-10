package org.book.mapper;

import java.util.List;

import org.book.domain.CartDTO;

public interface CartMapper {
	
	public List<CartDTO> getList(String userId);
	
	public void insert(CartDTO cart);
}
