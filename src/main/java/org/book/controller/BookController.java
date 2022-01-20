package org.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.book.domain.BookDTO;
import org.book.domain.CommentDTO;
import org.book.service.CommentService;
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
	private CommentService service;
	
	@GetMapping("/home")
	public String home(Model model) {
		//도서관 정보나루 API
		Document doc_naru;
//		String url = "http://data4library.kr/api/loanItemSrch?authKey=98f61069b118242705dcd27c2fa00bf1c2ecfa258eeca760214c31dad2c234cb&startDt=2022-01-01&endDt=2022-01-12&pageSize=5";
		String url = "http://data4library.kr/api/loanItemSrch?authKey=252d4cf1dc317d82e5929ae1d837b812fa0bfd72bc773e25f1d4a8a061f82ef1&startDt=2022-01-01&endDt=2022-01-12&pageSize=5";
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

				if(isbn_list.length>1)		//책이 세트인 경우(isbn이 여러개인 경우 첫번째 isbn은 set_isbn이므로 두번째것 부터 봐야함
				{
					isbn=isbn_list[1];
				}
				else
				{
					isbn=isbn_list[0];
				}
				isbn=isbn.replaceAll("\\((.*?)\\)", "");	//정규식을 이용해서 괄호 패턴이 있으면 그부분만 지워주기
				
				int bookPrice = 10000;
				String des ="";
				
				BookDTO book=new BookDTO(tit,cate,wri,pub,pubYear,bookPrice,isbn,img,des);
				bestlist.add(book);
			}
			
		}
		catch(IOException e) {e.printStackTrace();}
		
		//책 API 정보
		model.addAttribute("bestlist",bestlist);
		
		//최근 댓글
		model.addAttribute("RC",service.getRecentComments());
		
		return "/Book/home";
	}
	
	
	@GetMapping("/myPage")
	public void myPage() {
	}
	@GetMapping("/findBook")
	public void findBook() {
	}
	@GetMapping("/cart")
	public void cart() {
	}
	@GetMapping("/taxbill")
	public void taxbill() {
	}
	@GetMapping("/recommend")
	public String recommend() {
		return "/Book/recommend";
	}

	
	
	
	@GetMapping("/bookDetail")
	public void bookDetail(@RequestParam("isbn") String isbn, Model model){
		String url_naru="http://data4library.kr/api/srchDtlList?authKey=516d6057acf9b3415283b1b6459355d04fdc09061bb8b2aad43f086301d5c6dd"
				+ "&isbn13=";
		Document doc_naru;
		
		
		
		log.info("bookDetail...");
		url_naru+=isbn;
		BookDTO book=new BookDTO();
		
		try
		{
			doc_naru=Jsoup.connect(url_naru).get();
			Elements bookname=doc_naru.getElementsByTag("bookname");
			Elements authors=doc_naru.getElementsByTag("authors");
			Elements publisher=doc_naru.getElementsByTag("publisher");
			Elements class_nm=doc_naru.getElementsByTag("class_nm");
			Elements publication_year=doc_naru.getElementsByTag("publication_year");
			Elements bookImageURL=doc_naru.getElementsByTag("bookImageURL");
			Elements isbn13=doc_naru.getElementsByTag("isbn13");
			Elements description=doc_naru.getElementsByTag("description");
			
			if(bookname.size()>0)
			{
				String tit=bookname.get(0).text();
				String wri=authors.get(0).text();
				String pub=publisher.get(0).text();
				String pubYear=publication_year.get(0).text();
					
				String isbn_real=isbn13.get(0).text();
				String imgURL="";
				if(bookImageURL.size()!=0)		//이미지가 있으면 넣어주고 없으면 빈채로 놔두기(이하 동일패턴)
				{
					imgURL=bookImageURL.get(0).text();
				}
					
				int bookPrice=(Character.getNumericValue(isbn.charAt(isbn.length()-1))+1)*20000/4;
					
				String des="";
				if(description.size()!=0)
				{
					des=description.get(0).text();
				}
					
				String category="";
				if(class_nm.size()!=0)
				{
					category=class_nm.get(0).text();
				}
					
				book=new BookDTO(tit,category,wri,pub,pubYear,bookPrice,isbn_real,imgURL,des);
			}
		}
		catch(IOException e) {e.printStackTrace();}
		model.addAttribute("book",book);
		model.addAttribute("commentList",service.getList(isbn));
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
					String url_naru="http://data4library.kr/api/usageAnalysisList?authKey=98f61069b118242705dcd27c2fa00bf1c2ecfa258eeca760214c31dad2c234cb"
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