package org.book.controller;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/book/*")
@AllArgsConstructor
public class BookController {
	
	@GetMapping("/home")
	public String home() {
		return "/Book/home";
	}

	@GetMapping("/searchTitle")
	public String searchTitle(String key) {
		Document doc;
		String tit = "";
		String url = "https://www.nl.go.kr/NL/search/openApi/search.do?key=11d02e96170b0f22dcabf71d0443089a7b104ebc9ab04749291c3e659cb3111f&kwd=";

		try {
			doc = Jsoup.connect(url + key).get();
			Elements title = doc.getElementsByTag("title_info");
			if (title.size() > 0) {
				for (int i = 0; i < title.size(); i++) {
					tit = title.get(i).text();
					log.info(tit);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return tit;
	}

}
