package org.book.service;

//import java.util.List;

import org.book.domain.UserDTO;

public interface UserService {
	public void signup(UserDTO dto); //가입하기
	public boolean insertCheck(String id);
	//public List<UserDTO> getUserList(String id);
}
