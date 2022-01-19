package org.book.service;

import java.util.List;

import org.book.domain.CartDTO;
import org.book.mapper.PayMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PayServiceImpl implements PayService {
	private PayMapper mapper;

	@Override
	public List<CartDTO> getList(String userId) {
		log.info("PaygetList....................?");
		return mapper.getList(userId);
	}

	@Override
	public int getTotalCount(String userId) {
		log.info("PaygetTotalCount....................?" + userId);
		return mapper.getTotalCount(userId);
	}

	@Override
	public int totalSumPrice(String userId) {
		log.info("PaytotalSumPrice....................?" + userId);
		return mapper.totalSumPrice(userId);
	}
	
	@Override
	public String date(String userId) {
		log.info("date....................?" + userId);
		return mapper.date(userId);
	}

}
