package org.book.mapper;

import org.book.domain.UserDTO;

public interface UserMapper {
	public void insert(UserDTO dto);
	public boolean checkId(String id);
}
