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
		<title>��й�ȣ ����</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
		<%
			Boolean flag = (Boolean)request.getAttribute("flag");

			if (flag.booleanValue()){
		%>
			<script>
				alert("���������� ����Ǿ����ϴ�.");
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
			<script>
				alert("������ �߻��߽��ϴ�.");
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

<!-- 
<script>
			function checkPw(){
				alert("(log) checkPw entered");
				//var pw1 = document.getElementById("pwVal").value;
				//var pw2 = document.getElementById("checkPwVal").value;
				
				//alert(pw1);
				//alert(pw2);
			}
		</script>

<form name="pwUpdateForm" 
			  method = "POST">
			<table align="center" border="1">
				<tr><td colspan="2" align="center"><label> ��й�ȣ ���� </label></td></tr>
				<tr>
					<td align="center"><label for="pw"> ��й�ȣ </label></td>
					<td align="center"><input type = "text" name = "pw" id="pwVal"></td>
				</tr>
				<tr>
					<td align="center"><label for="checkPw"> ��й�ȣ Ȯ�� </label></td>
					<td align="center"><input type = "text" name = "checkPw" id="checkPwVal"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="Ȯ��" onclick="checkPw()">
						<input type="reset" value="�ǵ�����">
					</td>
				</tr>
				
			</table>
			
		</form> 
		-->