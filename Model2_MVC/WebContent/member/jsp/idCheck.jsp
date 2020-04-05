<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.SessionUtil" %>
<%
	SessionUtil.setNoCache(request, response);
%>
<%
	Boolean flag = (Boolean)request.getAttribute("flag");
	if(flag.booleanValue()){
		System.out.println(" 중복된 아이디가 없습니다. ");
	}else{
		System.out.println(" 아이디 중복!! ") ;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<?xml version='1.0' encoding='UTF-8'?>
		<loginCheck>aa
			<result><%= flag.booleanValue() %></result>
		</loginCheck>
	</body>
</html>