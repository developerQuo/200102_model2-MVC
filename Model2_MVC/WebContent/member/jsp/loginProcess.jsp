<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch6.kcmjf.vo.KcmMemberVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.SessionUtil" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.BabySession" %>
<%
	SessionUtil.setNoCache(request, response);
%>
<% 
	request.setCharacterEncoding("EUC-KR");
%>

<%
	List<KcmMemberVO> aList = (List<KcmMemberVO>)request.getAttribute("aList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			if (aList.size() == 1){
				KcmMemberVO kmvo = null;
				kmvo = aList.get(0);
				//System.out.println(" id >>> " + kmvo.getKid());
				boolean sBool = BabySession.setSession(request, kmvo.getKid());
				if (sBool){
					System.out.println(" ���� �ο� ����!!");
				}else{
					System.out.println(" ���� �ο� ����..");
				}
		%>
				<script>
					alert("�α��� ����!");
					//http://localhost:8088/Model2_MVC/member/jsp/index.jsp
					location.href = "/Model2_MVC/member/jsp/index.jsp";
				</script>
		<%
			}else{
		%>
				<script>
					alert("�α��� ���� �̤�");
					//http://localhost:8088/Model2_MVC/member/jsp/index.jsp
					location.href = "/Model2_MVC/member/jsp/login.jsp";
				</script>
		<%
			}
		%>
	</body>
</html>