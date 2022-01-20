package org.book.service;

import org.book.domain.UserDTO;

public interface UserService {
	public void signup(UserDTO dto); //가입하기
	public boolean insertCheck(String id);
	public UserDTO getUserList(String id);
	public int update(UserDTO dto); //수정하기
	public String calculateAge(int birthyear); //나이 계산하기
}
