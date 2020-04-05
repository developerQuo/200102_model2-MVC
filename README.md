# 200102_model2-MVC
## 비트캠프 세번째 개인프로젝트: model2 + MVC패턴 게시판

### 시스템 아키텍처
***
<p align="center">
<img src="/img/system_architecture.JPG" width="80%" height="60%" title="시스템 아키텍처"></img>
</p>   
   
* MVC 패턴과 DAO 패턴을 적용하고, 데이터 이동을 위해 VO를 사용.
* Servlet에서 사용자의 요청에 응답하고 Dao에 데이터를 요청.   
	요청결과를 적절한 JSP에 전송.
* Dao에서는 interface와 implement로 나누어 구현.
	+ ConnProperty 클래스에는 DB로그인 정보와 JDBC드라이버 정보를 저장. connection을 닫는 함수도 함께 정의.
	+ Chaebun 클래스에는 회원번호를 생성. (구분자1자리 + 날짜8자리 + 숫자4자리)
	+ Session 클래스에는 세션 setter와 getter, 세션을 닫는 함수 정의.
	+ SqlMap 클래스에는 채번, CRUD, 로그인, 아이디 체크 쿼리를 StringBuffer로 작성.   
		파일저장 경로도 문자열로 함께 작성.
* JSP에서 클라이언트에게 요청결과와 함께 웹페이지를 보여주도록 구현.

### 메인 페이지
***
<p align="center">
<img src="/img/main.png" width="60%" height="40%" title="메인"></img>
</p>   

### 로그인 페이지
***
<p align="center">
<img src="/img/로그인.png" width="60%" height="40%" title="로그인"></img>
</p>   

### 회원목록 페이지
***
<p align="center">
<img src="/img/회원목록.png" width="60%" height="40%" title="회원목록"></img>
</p>   

### 회원검색 페이지
***
<p align="center">
<img src="/img/회원검색.png" width="60%" height="40%" title="회원검색"></img>
</p>   

### 회원등록 페이지
***
<p align="center">
<img src="/img/회원등록.png" width="60%" height="40%" title="회원등록"></img>
</p>   

### 회원 비밀번호 수정 페이지
***
<p align="center">
<img src="/img/회원비번변경.png" width="60%" height="40%" title="회원비번변경"></img>
</p>   

### 회원삭제 페이지
***
<p align="center">
<img src="/img/회원삭제.png" width="60%" height="40%" title="회원삭제"></img>
</p>   

### 게시판 글목록 페이지
***
<p align="center">
<img src="/img/게시판글목록.png" width="60%" height="40%" title="게시판글목록"></img>
</p>   

### 게시판 글쓰기 페이지
***
<p align="center">
<img src="/img/게시판글쓰기.png" width="60%" height="40%" title="게시판글쓰기"></img>
</p>   

### 게시판 글수정 페이지
***
<p align="center">
<img src="/img/게시판글수정.png" width="60%" height="40%" title="게시판글수정"></img>
</p>   

### 게시판 글삭제 페이지
***
<p align="center"> 
<img src="/img/게시판글삭제.png" width="60%" height="40%" title="게시판글삭제"></img>
</p>
