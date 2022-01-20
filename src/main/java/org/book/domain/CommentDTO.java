package org.book.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	private String name;
	private String isbn;
	private String content;
	private String pic;
	private String img_Url;
	private Date regdate;
}
