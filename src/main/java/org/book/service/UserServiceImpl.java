package org.book.service;

import org.book.domain.UserDTO;
import org.book.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	private UserMapper mapper;
	@Override
	public void signup(UserDTO dto) {
		// TODO Auto-generated method stub
		log.info("signup...."+dto);
		mapper.insert(dto);
	}
	@Override
	public boolean insertCheck(String id) {
		// TODO Auto-generated method stub
		log.info("insertCheck............");
		
		return mapper.checkId(id);
	}
	@Override
	public UserDTO getUserList(String id) {
		// TODO Auto-generated method stub
		log.info("getUserList............");
		return mapper.getList(id);
	}

}
