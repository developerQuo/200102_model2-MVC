<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.SessionUtil" %>
<%
	SessionUtil.setNoCache(request, response);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>게시판 글쓰기</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
	</head>
	<body>
		
<%
	
			int nCnt = (int)request.getAttribute("nCnt");
			
			if (nCnt == 1){
%>
				<script type="text/javascript">
					alert("글쓰기 성공!");
					$(document).ready(function(){
						$("#selectFunc").prop("value", "SA");
						$("#boardForm").prop("method", "POST")
						.prop("action", "/Model2_MVC/KcmHelloBoardServlet")
						.prop("enctype", "application/x-www-form-urlencoded")
						.submit();
					});
				</script>
<%
			}else{
%>
				<script type="text/javascript">
					alert("글쓰기 실패ㅜㅜ");
					//http://localhost:8088/babyWeb/board/kcmHelloBoard.html
					location.href="./insertKcmBoard.jsp";
				</script>
<%
			}
%>
		<form id="boardForm">
			<input type="hidden" name="selectFunc" id="selectFunc">
		</form>
	</body>
</html>