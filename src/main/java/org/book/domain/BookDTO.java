package org.book.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookDTO {
	private String bookName;
	private String category;
	private String writer;
	private String publisher;
	private String bookPublishYear;
	private int bookPrice;
	private String bookIsbn;
	private String bookImageURL;
	private String description;
	
}
