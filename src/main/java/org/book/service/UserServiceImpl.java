package org.book.service;

import java.util.Calendar;

import org.book.domain.UserDTO;
import org.book.mapper.UserMapper;
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
	@Override
	public int update(UserDTO dto) {
		// TODO Auto-generated method stub
		log.info("update...........");
		return mapper.updateInfo(dto);
	}
	@Override
	public String calculateAge(int birthyear) { 
		// 나이 계산하기
		log.info("calculateAge..........");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get ( cal.YEAR );
		
		int x=(year-birthyear+1)/10;
		String age="";
		
		switch(year-birthyear+1) {
		case 0:
			age="1-9";
		case 1:
			age="10-19";
		case 2:
			age="20-29";
		case 3:
			age="30-39";
		case 4:
			age="40-49";
		case 5:
			age="50-59";
		case 6:
			age="60-69";
		case 7:
			age="70-79";
		case 8:
			age="80-89";
		case 9:
			age="90-99";
		default:
			age="100~";
		}
		
		return age;
		
	}

}
