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
		<title>로그인</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
		<script type="text/javascript">
			$(document).ready(function(){
				$("#loginBtn").click(function(){
					if (!$("#id").val()){
						alert("[아이디]를 입력하세요.");
						$("#id").focus();
						return;
					}
					if (!$("#pw").val()){
						alert("[비밀번호]를 입력하세요.");
						$("#pw").focus();
						return;
					}
					$("#selectFunc").prop("value", "LOGIN");

					//http://localhost:8088/Model2_MVC/KcmMemberServlet
					$("#loginForm").prop("method", "POST")
					.prop("action", "../../KcmMemberServlet")
					.prop("enctype", "application/x-www-form-urlencoded")
					.submit();
				});
				
				$("#registerKcmMemberBtn").click(function(){
					//http://localhost:8088/Model2_MVC/member/jsp/registerKCMMember.jsp
					location.href = "/Model2_MVC/member/jsp/registerKCMMember.jsp";
				});
			});
		</script>
	</head>
	<body>	
		<form id="loginForm">
			<table align="center" border="1">
				<tr>
					<td colspan="2" align="center"><label> 로그인 </label></td>
				</tr>
				<tr>
					<td align="center"><label for="id"> 아이디 </label></td>
					<td align="center"><input type = "text" name = "id" id="id"></td>
				</tr>
				<tr>
					<td align="center"><label for="pw"> 비밀번호 </label></td>
					<td align="center"><input type = "password" name = "pw" id="pw"></td>
				</tr>
				<!-- <input type = "submit" value = "submit"> -->
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" id="selectFunc" name="selectFunc">
						<input type="button" value="회원가입" id="registerKcmMemberBtn">
						<input type="button" value="확인" id="loginBtn">
						<input type="reset" value="되돌리기">
					</td>
				</tr>
				
			</table>
			
		</form>
	</body>
</html>