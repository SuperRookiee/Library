package org.book.service;

import java.util.List;

import org.book.domain.CartDTO;
import org.book.mapper.CartMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	private CartMapper mapper;

	@Override
	public void register(CartDTO cart) {
		// TODO Auto-generated method stub
		log.info("register...." + cart);
		mapper.insert(cart);
	}

	@Override
	public boolean modify(String userId, String bookName, int amount) {
		log.info("modify...." + userId);
		return mapper.update(userId, bookName, amount) == 1;
	}

	@Override
	public boolean remove(String userId, String bookName) {
		log.info("remove...." + userId + bookName);
		return mapper.delete(userId, bookName) == 1;
	}
	
	@Override
	public boolean removeAll(String userId) {
		// TODO Auto-generated method stub
		log.info("remove...." + userId);
		return mapper.deleteAll(userId) == 1;
	}

	@Override
	public List<CartDTO> getList(String userId) {
		log.info("getList....................?");
		return mapper.getList(userId);
	}

	@Override
	public int getTotalCount(String userId) {
		// TODO Auto-generated method stub
		log.info("getTotalCount....................?"+userId);
		return mapper.getTotalCount(userId);
	}

	@Override
	public int totalPrice(CartDTO cart) {
		// TODO Auto-generated method stub
		log.info("totalPrice....................?"+cart);
		return mapper.totalPrice(cart);
	}

}
