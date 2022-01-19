package org.book.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //여기에 필드에 쓴 모든생성자만 만들어줌
@NoArgsConstructor //기본 생성자를 만들어줌
@Data
public class UserDTO {
	
	private String id;
	private String name;
	private String email;
	private String age;
	private String mobile;
	private String profile_image;
	private String gender;
	private int birthyear; 
	private String birthday;
	
}
