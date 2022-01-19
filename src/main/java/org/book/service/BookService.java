package org.book.service;

import org.book.domain.BookDTO;
import org.springframework.stereotype.Service;

@Service
public interface BookService {
	public BookDTO searchIsbn(String isbn);
}
