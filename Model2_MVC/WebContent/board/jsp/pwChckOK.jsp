<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch6.board.vo.KcmHelloBoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.SessionUtil" %>
<%
	SessionUtil.setNoCache(request, response);
%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	boolean pBool = (boolean)request.getAttribute("pBool");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<?xml version='1.0' encoding='UTF-8'?>
		<pwChck>
			<result><%= pBool %></result>
		</pwChck>
	</body>
</html>