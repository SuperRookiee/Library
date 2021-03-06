package org.book.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.book.domain.UserDTO;
import org.book.service.UserService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.login.api.NaverLoginBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//@AllArgsConstructor 
@Controller
@Log4j
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	// UserDTO
	@Setter(onMethod_ = @Autowired)
	private UserService service;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/*
		 * 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);

		return "login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model)
			throws IOException, ParseException {
		System.out.println("여기는 callback state 호출해보겟다" + state);

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state); // return accessTocken
		log.info("state 호출해봄 from callback " + state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		System.out.println("혹시 이거???" + apiResult);
		log.info("oauthToken이 이거임!!!!!!!!!" + oauthToken);
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29",
		 * "gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		System.out.println("obj는????" + obj);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		String access_token = oauthToken.getAccessToken(); // 토큰

		log.info("getAccessTocken 의 타입이 뭐냐???????????????" + oauthToken.getAccessToken().getClass().getName());
		log.info("access_token 의 타입이 뭐냐???????????????" + access_token.getClass().getName());
		log.info("access_token값?????????" + access_token); // 따옴표 안붙고 잘나옴
		System.out.println("response_obj??????????" + response_obj);
		// response의 nickname값 파싱
		String id = (String) response_obj.get("id");
		String name = (String) response_obj.get("name");
		String email = (String) response_obj.get("email");
		String age = (String) response_obj.get("age");
		String mobile = (String) response_obj.get("mobile");

		String profile_image2 = (String) response_obj.get("profile_image");
		String profile_image = null;
		String gender = (String) response_obj.get("gender");
		Integer birthyear = Integer.valueOf((String) response_obj.get("birthyear"));
		String birthday = (String) response_obj.get("birthday");

		session.setAttribute("memberId", id);
		session.setAttribute("image2", profile_image2);
		
		// 4.파싱 user네임 세션으로 저장
		session.setAttribute("sessionId", name);
		// 세션 생성
		session.setAttribute("result", response_obj);
		String str_result = access_token.replaceAll("\\\"", "");
		// String encodeResult = URLEncoder.encode(access_token, "UTF-8");
		session.setAttribute("access_token", str_result);
		// log.info("encodeResult값?????????"+encodeResult); //따옴표 없이 잘나옴

		UserDTO dto = new UserDTO(id, name, email, age, mobile, profile_image,  gender, birthyear, birthday);
		System.out.println("dto 니놈은뭐니???????" + dto.getName());
		System.out.println("==============dto 타입==================");
		System.out.println(dto instanceof UserDTO);
		System.out.println("================================");

		// userId가 db에 있는지 만들기
		if (!(service.insertCheck(id))) {
			service.signup(dto);
		}

		return "login";

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();

		return "redirect:Book/home";
	}

	@GetMapping("/remove") // token = access_token임
	public String remove(@RequestParam String token, HttpSession session, HttpServletRequest request, Model model) {
		log.info("토큰 삭제중...");

		String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=" + NaverLoginBO.CLIENT_ID
				+ "&client_secret=" + NaverLoginBO.CLIENT_SECRET + "&access_token=" + token.replaceAll("'", "")
				+ "&service_provider=NAVER";

		log.info("apiUrl=====" + apiUrl);
		try {
			String res = requestToServer(apiUrl);
			model.addAttribute("res", res); // 결과값 찍어주는용
			session.invalidate();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/Book/home";
	}

	private String requestToServer(String apiURL) throws IOException {
		return requestToServer(apiURL, null);
	}

	private String requestToServer(String apiURL, String headerStr) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		System.out.println("header Str: " + headerStr);
		if (headerStr != null && !headerStr.equals("")) {
			con.setRequestProperty("Authorization", headerStr);
		}
		int responseCode = con.getResponseCode();
		BufferedReader br;
		System.out.println("responseCode=" + responseCode);
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if (responseCode == 200) {
			String new_res = res.toString().replaceAll("&#39;", "");
			return new_res;
		} else {
			return null;
		}
	}

	@GetMapping("/update")
	public String update(@RequestParam String id, Model model) {
		log.info("updateForm으로 이동...");
		model.addAttribute("list", service.getUserList(id));

		return "/Book/mypageUpdateFrm";
	}

	@PostMapping("/update")
	public String updateProc(MultipartFile[] uploadFile, UserDTO dto, Model model) {
		// profile_image 업로드
		String uploadFolder = "c:/upload/";
		MultipartFile multipartFile = uploadFile[0]; // 단일파일 하기 위해
		
		UUID uuid = UUID.randomUUID();
		String uploadFileName = multipartFile.getOriginalFilename(); // 파일이름 설정
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		
		log.info("dbUploadFileName 뭔데?????????"+uploadFileName);
		
		dto.setProfile_image(uploadFileName); // dto에 파일 경로를 setting
		File saveFile = new File(uploadFolder, uploadFileName);// uploadFolder는 부모폴더, uploadFileName은 파일이름
		//그니까 uploadFolder 폴더에다가 파일이름으로 저장ㅎㅏ겠다
		try {
			multipartFile.transferTo(saveFile);

		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		log.info("post update/............" + dto);

		// update 전에 생년을 읽어와서 나이를 계산해서 setting
		dto.setAge(service.calculateAge(dto.getBirthyear()));
		service.update(dto);

		model.addAttribute("id", dto.getId());
		return "redirect:/update";
	}
	
	@GetMapping("/display")// display?fileName=파일ㄴㅔ임 으로 들어감
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName : "+fileName);
		File file = new File("c:/upload/"+fileName);
		log.info("file : "+file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			//적당한 MIME 타입(미디어 타입)을 헤더에 추가함 probeContentType은 파일의 확장자 알려주는애
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), //파일의 크기
					header, HttpStatus.OK);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
