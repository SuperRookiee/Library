package org.book.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartDTO {

	private String userId;// (userId+bookName) : primary Key
	private String bookName;
	private int price; // 가격
	private int amount; // 수량
	private Date purchaseDate; // 구매일자
	private int sumPrice; // 가격*수량
}
