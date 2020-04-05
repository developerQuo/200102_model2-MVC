<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.SessionUtil" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.BabySession" %>
<%
	SessionUtil.setNoCache(request, response);
%>
<%
	String sessionID = BabySession.getSession(request);
	System.out.println(sessionID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" name = "viewport"  content="text/html; charset=EUC-KR, width=device-width, initial-scale=1">
		<title>창슐랭가이드</title>
	</head>
	<!-- 
		CSS style 속성값
		background : colr : 
					16진수 색 : #RRGGBB
					           RR : red, GG : green, BB : blue
					           16진수 00 ~ ff 로 표현					           
					           #000000 : rgb(0,0,0) : 검정
					           #ff0000 : rgb(255,0,0) : 적색
					           #ffffff : rgb(255,255,255) : 흰색
					RGB 색 : rgb(red, green, blue)
					               각 색을 0 ~ 255 로 표현  
		display : table : 테이블 형태로 출력
		width : 적용 엘리먼트의 가로 크기 : px 또는 % 단위의 숫자로 표시
		height : 적용 엘리먼트의 세로 크기 : px 또는 % 단위의 숫자로 표시
		text-align : center : 적용 엘리먼트의 데이터를 가로의 중앙으로 배치한다.
		vertical-align : middle : 적용 엘리먼트의 데이터를 세로의 중앙으로 배치한다.
	 -->
	<!-- 		
		body 엘리먼트에 배경색 속성 정하기  
		bgcolor="lightgrey" 
	-->
	<body bgcolor="#18FD27">
	<section>
		<!-- 헤더  -->
		<!-- 
			inline style
			<태그 style="속성1: 속성값; 속성2: 속성값;"
		 -->
		<header style="display: table; /* 표시형태 */
		               width: 100%;/* 너비 */
		               height: 50px;/* 높이 */
		               background: #18FD27;/* 배경색  */
		               color: white;/* 글자색 */
		               text-align: center;/* 글자의 수평위치 */
		               vertical-align: middle; /* 글자의 수직위치 */ ">
			<h1>창슐랭가이드</h1>
		</header>
		<!-- 본문  -->
		<section>
			<h2 align="center"> 맛의 본고장 </h2>
			<p align="right">
				<!-- http://localhost:8088/Model2_MVC/member/jsp/login.jsp -->
				<a href="/Model2_MVC/member/jsp/login.jsp">로그인</a>
				<!-- http://localhost:8088/Model2_MVC/member/jsp/registerKCMMember.jsp -->
				<a href="/Model2_MVC/member/jsp/registerKCMMember.jsp">회원가입</a>
				<!-- http://localhost:8088/babyWeb/board/kcmHelloBoardInsert.html -->
				<a href="/Model2_MVC/board/jsp/insertKcmBoard.jsp">게시판 글쓰기</a>
			</p>
		</section>
		<p align="center">
    		<iframe align="middle" 
    				width="1024" 
    				height="512" 
    				src="https://www.youtube.com/embed/SR8znu7Ptjk" 
    				frameborder="0" 
    				allowfullscreen></iframe>
  		</p>
  		<table>
  			<tr>
  				<td></td>
  			</tr>
  		</table>
		<!-- 푸터  -->
		<footer style="display: table;
		               width: 100%;
		               height: 40px;
		               background: red;
		               color: white;
		               text-align: center;
		               vertical-align: middle;">
			<h3> 행동대장 : 이상훈 </h3>
		</footer>
	</section>			
	</body>
</html>