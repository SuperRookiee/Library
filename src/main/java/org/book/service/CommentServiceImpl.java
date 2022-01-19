package org.book.service;

import java.util.ArrayList;

import org.book.domain.CommentDTO;
import org.book.mapper.CommentMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CommentServiceImpl implements CommentService{
	private CommentMapper mapper;
	
	@Override
	public int register(CommentDTO comment) {
		// TODO Auto-generated method stub
		log.info("commentregister............"+comment);
		return mapper.insert(comment);
	}

	@Override
	public int modify(CommentDTO comment) {
		// TODO Auto-generated method stub
		log.info("commentmodify..................."+comment);
		return mapper.update(comment);
	}

	@Override
	public int remove(String name, String isbn) {
		// TODO Auto-generated method stub
		log.info("commentremove................."+name+", "+isbn);
		return mapper.delete(name, isbn);
	}

	@Override
	public ArrayList<CommentDTO> getList(String isbn) {
		// TODO Auto-generated method stub
		log.info("commentgetList.............."+isbn);
		return mapper.getList(isbn);
	}

	@Override
	public int totalCount(String isbn) {
		// TODO Auto-generated method stub
		log.info("commenttotalcount.............."+isbn);
		return mapper.getTotalCount(isbn);
	}

}
