package org.book.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartDTO {

	private String userId;// (userId+bookName) : primary Key
	private String bookName;
	private String category;
	private String imgUrl;
	private String bookIsbn;
	private int price; // 가격
	private int amount; // 수량
	private Date purchaseDate; // 구매일자
//	
//	public CartDTO(String userId, String bookName) {
//		this.userId=userId;
//		this.bookName=bookName;
//	}
}
