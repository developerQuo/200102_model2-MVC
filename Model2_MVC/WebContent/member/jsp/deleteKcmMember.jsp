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
		<title>회원정보 삭제</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
		<%
			Boolean flag = (Boolean)request.getAttribute("flag");
			if (flag.booleanValue()){
		%>
			<script type="text/javascript">
				alert("성공적으로 삭제되었습니다.");
				$(document).ready(function(){
					$("#selectFunc").prop("value", "SA");
					//http://localhost:8088/Model2_MVC/KcmMemberServlet
					$("#registerForm").prop("method", "POST")
					.prop("action", "/Model2_MVC/KcmMemberServlet")
					.prop("enctype", "application/x-www-form-urlencoded")
					.submit();
				});
			</script>
		<%
			}else{
		%>
			<script type="text/javascript">
				alert("오류가 발생했습니다.");
				//http://localhost:8088/Model2_MVC/member/jsp/registerKCMMember.jsp
				location.href = "/Model2_MVC/member/jsp/registerKCMMember.jsp";
			</script>
		<%
			}
		%>
	</head>
	<body>
		<form id="registerForm">
			<input type="hidden" id="selectFunc" name="selectFunc">
		</form>
	</body>
</html>