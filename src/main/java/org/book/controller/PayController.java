package org.book.controller;

import org.book.service.PayService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/pay/*")
@AllArgsConstructor
public class PayController {
	private PayService service;

	@GetMapping("/result")
	public String list(Model model, @RequestParam("userId") String userId) {
		log.info("listPay");
		model.addAttribute("payuserId", userId);
		model.addAttribute("paycount", service.getTotalCount(userId));
		model.addAttribute("paylist", service.getList(userId));
		model.addAttribute("paytotalSum", service.totalSumPrice(userId));
		model.addAttribute("date", service.date(userId));
		return "/Book/taxbill";
	}
}
