package org.book.service;

import java.util.List;

import org.book.domain.CartDTO;
import org.springframework.stereotype.Service;
@Service
public interface PayService {
	public List<CartDTO> getList(String userId);

	public int getTotalCount(String userId);
	
	public int totalSumPrice(String userId);
	
	public String date(String userId);

}
