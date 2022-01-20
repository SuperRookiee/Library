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

	@PostMapping("/register") //
	public String register(CommentDTO comment, RedirectAttributes rttr) {
		log.info("register :" + comment);
		service.register(comment);
		String isbn = comment.getIsbn();
		rttr.addAttribute("isbn", isbn);
		return "redirect:/Book/bookDetail";
	}

	@GetMapping("/register")
	public void register() {
	}

	@GetMapping("/remove")
	public String remove(@RequestParam("rno") int rno, @RequestParam("isbn") String isbn, RedirectAttributes rttr) {
		log.info("remove.........:" + rno + isbn);
		service.remove(rno);
		log.info("remove.........:" + rno + "," + isbn);
		rttr.addAttribute("isbn", isbn);
		return "redirect:/Book/bookDetail";
	}

	@GetMapping("/modify")
	public String modify(CommentDTO comment, RedirectAttributes rttr) {
		log.info("modify.........:" + comment);
		service.modify(comment);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/comment/list?isbn=" + comment.getIsbn();
	}
}
