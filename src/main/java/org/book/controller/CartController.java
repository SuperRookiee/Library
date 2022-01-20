package org.book.controller;

import java.util.List;

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
		log.info("list.......userId : " + userId);
		if(service.getTotalCount(userId)==0) {
			model.addAttribute("count",service.getTotalCount(userId));
			log.info(service.getTotalCount(userId));
			model.addAttribute("userId",userId);
			return "/Book/cart";
		}
		model.addAttribute("count",service.getTotalCount(userId));
		model.addAttribute("list", service.getList(userId));
		model.addAttribute("totalSum", service.totalSumPrice(userId));
		return "/Book/cart";
	}

	@PostMapping("/register") // 장바구니 저장
	public String register(CartDTO cart, RedirectAttributes rttr) {
		log.info("register :" + cart);
		service.register(cart);
		String userId = cart.getUserId();
		log.info("userId = "+userId+"....., cart.getUserId = "+cart.getUserId());
		rttr.addAttribute("userId", userId);
		return "redirect:/cart/cart"; // redirect를 하지않는 경우, 새로 고침시 도배
	}

	@GetMapping("/register")
	public void register() {
	}

	@GetMapping("/remove")
	public String remove(@RequestParam("userId") String userId, @RequestParam("bookName") String bookName,
			RedirectAttributes rttr) {
		log.info("remove.........:" + userId + bookName);
		service.remove(userId, bookName);
		log.info("remove.........:" + userId + "," + bookName);
		rttr.addAttribute("userId", userId);
		return "redirect:/cart/cart";
	}

	@GetMapping("/removeAll")
	public String removeAll(@RequestParam("userId") String userId, RedirectAttributes rttr) {
		log.info("removeAll.........:" + userId);
		if (service.removeAll(userId)) {
			rttr.addAttribute("userId", userId);
		}
		return "redirect:/cart/cart";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("userId") String userId, @RequestParam("bookName") String bookName,
			@RequestParam("amount") int amount, RedirectAttributes rttr) {
		log.info("modify.........:" + userId + bookName + amount);
		service.modify(userId, bookName, amount);
		rttr.addAttribute("userId", userId);
		return "redirect:/cart/cart";
	}
	
	@GetMapping("/pay")
	public String pay(@RequestParam("userId") String userId,RedirectAttributes rttr) {
		log.info("pay....userId:"+userId);
		service.payAdd(userId);
		log.info("pay 결제정보 입력 완료");
		service.removeAll(userId);
		log.info("결제로 넘어간 카트데이터들 삭제");
		rttr.addAttribute("userId", userId);
		return "redirect:/pay/result";
	}
}
