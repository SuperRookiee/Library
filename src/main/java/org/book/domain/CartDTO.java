package org.book.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartDTO {

	private String userId;
	private String bookName;
	private Date borrowDate;
	private Date limitDate;
}
