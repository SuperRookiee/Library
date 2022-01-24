# Library UnitProject3

Δ팀: 고현욱/김종백/정현주/조장훈

- [powerpoint] - ppt 참고해주세요

# 계획

-제목 저자 출판사 카테고리(분류/테마) ISBN….. 각각의 GetMapping 함수 만들기

-홈페이지 디자인 및 계획

-HTML CSS 가져오기 / 만들기

-각자의 파트 정하기

-SQL

-정보나루 API 신청하기

++++++부가적인 계획 추가 

-Plan A / Plan B / Plan C 정하기

## 사용기술
### Spring Framework, MySQL, Jsoup, Naver API, 국립중앙 도서관 API, 도서관 정보나루 API

## 기간

2021.12.24 ~ 2021.12.31 주제 및 API 선정
2022.01.03 ~ 2022.01.05 API 데이터 불러오기, MySQL DB 생성
2022.01.06 ~ 2022.01.10 html, css 초기 제작
2022.01.11 ~ 2022.01.15 controller 작성
2022.01.16 ~ 2022.01.17 Naver Login API 구현
2022.01.18 ~ 2022.01.21 각각의 페이지 완성, 버그수정
2022.01.22 ~ 2022.01.23 버그 수정 및 ppt 제작

| 이름 | 역할 |
| ------ | ------ |
| 김종백 | comment, cart, paybill, db |
| 고현욱 | FE개발 + 다크모드 구현,  |
| 정현주 | Naver Login API연동 및 마이페이지 |
| 조장훈 | 도서관 API 연동, 파싱 |


![Slide1](https://user-images.githubusercontent.com/96603039/150729741-4f6f2873-273c-4161-a920-b8e4d6d7187a.jpg)
# 소개
![Slide2](https://user-images.githubusercontent.com/96603039/150729745-92b5a039-b089-426e-9dd4-8c17fba7627d.jpg)
#### 네이버 로그인 API, 국립중앙 도서관 API, 도서관 정보나루 API를 활용했기 때문에 다양한 정보를 제공합니다.

# 사용한 툴 & API
![Slide3](https://user-images.githubusercontent.com/96603039/150729753-5c9d48d0-e618-4fd7-bc95-ad8c122e4d53.jpg)
#### API에서 크롤링하는 Jsoup(Java에서 사용가능)를 활용하여 도서관 정보나루, 국립중앙도서관API를 Json형태로 받아왔습니다.
# DB 테이블 관계도
![Slide4](https://user-images.githubusercontent.com/96603039/150729759-ade8a808-af42-4c3c-85a7-1b235d39d5dc.jpg)
### 테이블은 총 4개
#### users -회원정보
#### cart - 장바구니에 담긴 상품
#### comments - 댓글
#### pay - 구매내역
#### bookDTO는 Library API에서 받아온 정보임  
#
# 주요기능 - 홈화면(검색기능)
![Slide5](https://user-images.githubusercontent.com/96603039/150729762-13258b91-37b1-4412-afc4-7a9027c18bff.jpg)
![Slide6](https://user-images.githubusercontent.com/96603039/150729773-58f4009e-658f-4b6f-acdd-b0c11940d020.jpg)
#### 키워드 검색, 최근 리뷰순으로 정렬되는 리뷰를 볼 수 있도록 구현  
#
# 주요기능- 로그인(네이버 로그인 API)
![Slide7](https://user-images.githubusercontent.com/96603039/150729779-dab0a459-d2ba-49a9-bb1d-65d768c5f1b6.jpg)
![Slide8](https://user-images.githubusercontent.com/96603039/150729783-66a35acb-8bdf-4700-8764-3f06b1b26ade.jpg)
#### 네이버에서 암호화된 id값을 입력받아 로그인시 자동 회원가입
#### 로그인 성공하면 username을 읽어와 welcome message 띄우기
#### 마이페이지 수정시 생년월일을 입력하면 자동으로 나이계산하여 수정하도록 설정,
#### 마이페이지에 파일업로드 기능 추가  
#
# 주요기능 - 조건검색
![Slide9](https://user-images.githubusercontent.com/96603039/150729792-6920720c-53b8-4f3a-935e-013135f8d1cf.jpg)
# 주요기능 - 추천목록(나이, 성별, 주제 구분)
![Slide10](https://user-images.githubusercontent.com/96603039/150729798-f154a5d3-7492-4aa6-9536-b38eda0d3561.jpg)
#### 도서관 정보나루 API에서 제공되는 조건별 추천 데이터를 바탕으로 클릭시 해당 책 검색됨  
#
# 책 상세페이지
![Slide11](https://user-images.githubusercontent.com/96603039/150729803-f47a32ae-7fe7-4bf3-a518-2b44386ad42d.jpg)
#### 카트기능, comments(댓글 리뷰) 기능 구현  
#
# 주요기능 - 장바구니 & 결제페이지
![Slide12](https://user-images.githubusercontent.com/96603039/150729805-1eaf61b6-9cbe-45f9-8649-beddbdc00ff8.jpg)
#### cart는 결제하기를 누르면 구매내역에 stack이 쌓이게 되며 동시에 카트는 비워짐  
![Slide13](https://user-images.githubusercontent.com/96603039/150729811-e0753ff7-60a1-4f85-b5f0-59d91e14e452.jpg)

# 배운 것
### image를 절대경로로 보여주는것은 보안상 불가하며, 반드시 업로드 폴더를 uploadFolder로 지정해 준 후, display 할 수 있는 것
### Json을 파싱할 때에 타입을 잘 보고 log를 찍어가며 디버깅 하기 - 데이터는 같은 값을 가지고 가더라도 따옴표가 붙을 수 있음에 주의
### 디버깅을 진행하며 springFramework의 구조에 대한 이해를 했다.
### 자바에도 파이썬처럼 크롤링하게 편리한 도구가 있다는 것을 알았음 (Jsoup)
### 
 [powerpoint]: <https://inuackr-my.sharepoint.com/:p:/g/personal/jk0837_inu_ac_kr/ETNFSBF5jslAmvE-WG6JNEIB7SV1P42hmpTz8bSnzF6FWA?e=m4kGsO>
