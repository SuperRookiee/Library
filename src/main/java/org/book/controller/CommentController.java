package org.book.controller;

import org.book.domain.CommentDTO;
import org.book.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/comment/*")
@AllArgsConstructor
public class CommentController {
	private CommentService service;

	@GetMapping("/list")
	public String list(Model model, @RequestParam("isbn") String isbn) {
		log.info("list");
		model.addAttribute("count", service.totalCount(isbn));
		model.addAttribute("commentList", service.getList(isbn));
		return "/Book/bookDetail";
	}

	@PostMapping("/register") // 장바구니 저장
	public String register(CommentDTO comment, RedirectAttributes rttr) {
		log.info("register :" + comment);
		service.register(comment);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/comment/list?isbn=" + comment.getIsbn(); // redirect를 하지않는 경우, 새로 고침시 도배
	}

	@GetMapping("/register")
	public void register() {
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("userId") String userId, @RequestParam("isbn") String isbn,
			RedirectAttributes rttr) {
		log.info("remove.........:" + userId + isbn);
		service.remove(userId, isbn);
		log.info("remove.........:" + userId + "," + isbn);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/comment/list?isbn=" + comment.getIsbn();
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("userId") String userId, @RequestParam("isbn") String isbn,
			@RequestParam("content") int content, RedirectAttributes rttr,CommentDTO comment) {
		log.info("modify.........:" + userId + bookName + amount);
		service.modify(userId, bookName, amount);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/comment/list?isbn=" + comment.getIsbn();
	}
}
