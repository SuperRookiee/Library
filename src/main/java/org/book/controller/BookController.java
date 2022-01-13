package org.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.book.domain.BookDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Book/*")
@AllArgsConstructor
public class BookController {
	
	@GetMapping("/home")
	public String home(Model model) {
		Document doc_naru;
		String url = "http://data4library.kr/api/loanItemSrch?authKey=98f61069b118242705dcd27c2fa00bf1c2ecfa258eeca760214c31dad2c234cb&startDt=2022-01-01&endDt=2022-01-12&pageSize=5";
		List<BookDTO> bestlist=new ArrayList<BookDTO>();
		
		try {
			doc_naru=Jsoup.connect(url).get();
			
			Elements title = doc_naru.getElementsByTag("bookname");
			Elements writer = doc_naru.getElementsByTag("authors");
			Elements category = doc_naru.getElementsByTag("class_nm");
			Elements publisher = doc_naru.getElementsByTag("publisher");
			Elements bookPublishYear = doc_naru.getElementsByTag("publication_year");
			Elements bookIsbn = doc_naru.getElementsByTag("isbn13");
			Elements image = doc_naru.getElementsByTag("bookImageURL");
			
			for(int i=0;i<title.size();i++) {
				
				String tit=title.get(i).text();
				String wri=writer.get(i).text();
				String cate=category.get(i).text();
				String pub=publisher.get(i).text();
				String pubYear=bookPublishYear.get(i).text();
				String[] isbn_list=bookIsbn.get(i).text().split(" ");
				String img=image.get(i).text();
				String isbn="";
				
				int bookPrice = 10000;
				String des ="";
				
				BookDTO book=new BookDTO(tit,cate,wri,pub,pubYear,bookPrice,isbn,img,des);
				bestlist.add(book);
			}
			
		}
		catch(IOException e) {e.printStackTrace();}
		model.addAttribute("bestlist",bestlist);
		return "/Book/home";
	}
	
	
	@GetMapping("/myPage")
	public String myPage() {
		return "/Book/myPage";
	}
	@GetMapping("/cart")
	public String cart() {
		return "/Book/cart";
	}
	@GetMapping("/taxbill")
	public String taxbill() {
		return "/Book/taxbill";
	}
	

	@GetMapping("/bookDetail")
	public void DetailView(@RequestParam("isbn") String isbn,Model model){
		
	}
	
	
	
	@GetMapping("/bookList")
	public void ListView(@RequestParam("key") String key,@RequestParam("pageNum") String pageNum,Model model)
	{
		Document doc;
		Document doc_naru;
		
		List<BookDTO> booklist=new ArrayList<BookDTO>();
		log.info("bookList...");
		String url="https://www.nl.go.kr/NL/search/openApi/search.do?key=11d02e96170b0f22dcabf71d0443089a7b104ebc9ab04749291c3e659cb3111f"
				+ "&category=도서&kwd=";
		url+=key;
		url+="&pageNum="+pageNum;
		
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
					String[] isbn_list=bookIsbn.get(i).text().split(" ");
					String isbn="";
					
					/*
					 * if(isbn_list.length==0) { continue; } //isbn이 없으면 그냥 넘어가기(isbn이 없어도 그냥 진행이 되는거보니 null을 가져오는건 아닌거같음)
					 */
					if(isbn_list.length>1)		//책이 세트인 경우(isbn이 여러개인 경우 첫번째 isbn은 set_isbn이므로 두번째것 부터 봐야함
					{
						isbn=isbn_list[1];
					}
					else
					{
						isbn=isbn_list[0];
					}
					isbn=isbn.replaceAll("\\((.*?)\\)", "");	//정규식을 이용해서 괄호 패턴이 있으면 그부분만 지워주기
					
					
					url_naru+=isbn;	//도서나루 api 연결
					doc_naru=Jsoup.connect(url_naru).get();
					
					Elements naruImage=doc_naru.getElementsByTag("bookImageURL");
					String bookImageURL="";
					if(naruImage.size()!=0)		//이미지가 있으면 넣어주고 없으면 빈채로 놔두기(이하 동일패턴)
					{
						bookImageURL=naruImage.get(0).text();
					}
					
					int bookPrice=0;
					if(isbn.isEmpty())	//isbn이 없으면 10000원 고정
					{
						bookPrice=10000;
					}
					else	//있으면 끝자리 숫자에 따라서 달라짐
					{
						bookPrice=(Character.getNumericValue(isbn.charAt(isbn.length()-1))+1)*20000/4;
					}
					
					Elements naruDes=doc_naru.getElementsByTag("description");
					String des="";
					if(naruDes.size()!=0)
					{
						des=naruDes.get(0).text();
					}
					
					Elements naruCate=doc_naru.getElementsByTag("class_nm");
					String category="";
					if(naruCate.size()!=0)
					{
						category=naruCate.get(0).text();
					}
					
					BookDTO book=new BookDTO(tit,category,wri,pub,pubYear,bookPrice,isbn,bookImageURL,des);
					booklist.add(book);
				}
			}
		}
		catch(IOException e) {e.printStackTrace();}
		model.addAttribute("list",booklist);
	}
}
