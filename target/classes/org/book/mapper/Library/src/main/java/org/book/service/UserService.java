package org.book.service;

import org.book.domain.UserDTO;

public interface UserService {
	public void signup(UserDTO dto); //가입하기
	public boolean insertCheck(String id);
}
