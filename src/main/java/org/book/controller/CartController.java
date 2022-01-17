package org.book.controller;

import org.book.domain.CartDTO;
import org.book.service.CartService;
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
@RequestMapping("/cart/*")
@AllArgsConstructor
public class CartController {
	private CartService service;

	@GetMapping("/cart")
	public String list(Model model, @RequestParam("userId") String userId) {
		log.info("list");
		model.addAttribute("list", service.getList(userId));
		return "/Book/cart";
	}

	@PostMapping("/register") // 장바구니 저장
	public String register(CartDTO cart, RedirectAttributes rttr) {
		log.info("register :" + cart);
		service.register(cart);
		rttr.addFlashAttribute("result", cart.getUserId());
		return "redirect:/cart/list"; // redirect를 하지않는 경우, 새로 고침시 도배
	}
	
	@GetMapping("/register")
	public void register() {
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("userId") String userId, @RequestParam("bookName") String bookName, RedirectAttributes rttr) {
		log.info("remove.........:" + userId);
		if (service.remove(userId, bookName)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/cart/list";
	}
	
	@PostMapping("/removeAll")
	public String removeAll(@RequestParam("userId") String userId, RedirectAttributes rttr) {
		log.info("removeAll.........:" + userId);
		if (service.removeAll(userId)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/cart/list";
	}
	
	@PostMapping("/modify")
	public String modify(@RequestParam("userId") String userId, @RequestParam("bookName") String bookName, @RequestParam("amount") int amount, RedirectAttributes rttr) {
		log.info("modify.........:" + userId + bookName + amount);
		if (service.modify(userId, bookName, amount)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/cart/list";
	}
}
