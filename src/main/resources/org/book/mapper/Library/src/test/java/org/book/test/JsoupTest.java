package org.book.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.book.domain.BookDTO;
import org.book.mapper.CartMapper;
import org.book.service.CartService;
import org.book.service.CartServiceImpl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JsoupTest {
	@Test
	public void jstest()
	{
		Document doc;
		String tit="";
		String url="https://www.nl.go.kr/NL/search/openApi/search.do?key=11d02e96170b0f22dcabf71d0443089a7b104ebc9ab04749291c3e659cb3111f&kwd=";
		String key="해리포터";
		
		try {
			doc = Jsoup.connect(url+key)
					.get();
			Elements title=doc.getElementsByTag("title_info");
			if(title.size()>0)
			{
				for(int i=0; i<title.size();i++) {
					tit=title.get(i).text();
					log.info(tit);
				}
				log.info("test : 김종백 테스트");
				
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

	
	@Test
	public void ListTest()
	{
		Document doc;
		Document doc_naru;
		
		List<BookDTO> booklist=new ArrayList<BookDTO>();
		log.info("bookList...");
		String url="https://www.nl.go.kr/NL/search/openApi/search.do?key=11d02e96170b0f22dcabf71d0443089a7b104ebc9ab04749291c3e659cb3111f"
				+ "&category=도서&kwd=";
		url+="나미야잡화점";
		url+="&pageNum="+"1";
		
		try
		{
			doc=Jsoup.connect(url).get();
			
			Elements title=doc.getElementsByTag("title_info");
			Elements writer=doc.getElementsByTag("author_info");
			Elements publisher=doc.getElementsByTag("pub_info");
			Elements bookPublishYear=doc.getElementsByTag("pub_year_info");
			Elements bookIsbn=doc.getElementsByTag("isbn");

			
			if(title.size()>0)
			{
				for(int i=0;i<title.size();i++)
				{
					String url_naru="http://data4library.kr/api/usageAnalysisList?authKey=516d6057acf9b3415283b1b6459355d04fdc09061bb8b2aad43f086301d5c6dd"
							+ "&isbn13=";
					String tit=title.get(i).text();
					String wri=writer.get(i).text();
					String pub=publisher.get(i).text();
					String pubYear=bookPublishYear.get(i).text();
					String isbn=bookIsbn.get(i).text().split(" ")[0];
					
					url_naru+=isbn;
					doc_naru=Jsoup.connect(url_naru).get();
					String bookImageURL=doc_naru.getElementsByTag("bookImageURL").get(0).text();
					int bookPrice=(Character.getNumericValue(isbn.charAt(isbn.length()-1))+1)*10000/4;
					String des=doc_naru.getElementsByTag("description").get(0).text();
					String category=doc_naru.getElementsByTag("class_nm").get(0).text();
					
					BookDTO book=new BookDTO(tit,category,wri,pub,pubYear,bookPrice,isbn,bookImageURL,des);
					log.info(book);
				}
			}
		}
		catch(IOException e) {e.printStackTrace();}
	}
	
}
