package org.book.service;

import org.book.domain.UserDTO;
import org.springframework.stereotype.Service;
@Service
public interface UserService {
	public void signup(UserDTO dto); //가입하기
	public boolean insertCheck(String id);
	public UserDTO getUserList(String id);
}
