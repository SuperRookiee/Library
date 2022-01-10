package org.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
@AllArgsConstructor
public class CartController {

	@GetMapping("/cart")
	public String cart() {
		return "/Book/cart";
	}
	
	@GetMapping("/taxbill")
	public String taxbill() {
		return "/Book/taxbill";
	}
}
