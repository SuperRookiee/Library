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
	
//	@Override
//	public void payAdd(List<CartDTO> cart) {
//		// TODO Auto-generated method stub
//		log.info("pay...." + cart);
//		mapper.payAdd(cart);
//	}
	@Override
	public void payAdd(String userId) {
		// TODO Auto-generated method stub
		log.info("pay...." + userId);
		mapper.payAdd(userId);
	}

	@Override
	public void modify(String userId, String bookName, int amount) {
		log.info("modify...." + userId);
		mapper.update(userId, bookName, amount);
	}

	@Override
	public void remove(String userId, String bookName) {
		log.info("remove....Impl" + userId + bookName);
		mapper.delete(userId, bookName);
	}
	
	@Override
	public boolean removeAll(String userId) {
		// TODO Auto-generated method stub
		log.info("removeAll....Impl" + userId);
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
	public int totalPrice(String userId, String bookName) {
		// TODO Auto-generated method stub
		log.info("totalPrice....................?"+userId+ bookName);
		return mapper.totalPrice(userId, bookName);
	}
	
	@Override
	public int totalSumPrice(String userId) {
		// TODO Auto-generated method stub
		log.info("totalSumPrice....................?"+userId);
		return mapper.totalSumPrice(userId);
	}

}
