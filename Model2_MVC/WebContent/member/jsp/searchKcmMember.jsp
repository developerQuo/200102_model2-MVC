<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch6.kcmjf.vo.KcmMemberVO" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.dao.KcmMemberDAO" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.dao.KcmMemberDAOImpl" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.SessionUtil" %>
<%
	SessionUtil.setNoCache(request, response);
%>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	
		<%
			KcmMemberVO kvo = null;
			List<KcmMemberVO> aList = (List<KcmMemberVO>)request.getAttribute("aList");
		%>
		<table align="center" border="1">
			<tr>
				<td colspan="13" align="center">ȸ������</td>
			</tr>
			<tr>
				<td align="center"><B>ȸ����ȣ</B></td>
				<td align="center"><B>ȸ������</B></td>
				<td align="center"><B>���̵�</B></td>
				<td align="center"><B>��й�ȣ</B></td>
				<td align="center"><B>�̸�</B></td>
				<td align="center"><B>�̸���</B></td>
				<td align="center"><B>��ȭ��ȣ</B></td>
				<td align="center"><B>�������</B></td>
				<td align="center"><B>�����ȣ</B></td>
				<td align="center"><B>�ּ�</B></td>
				<td align="center"><B>��������</B></td>
				<td align="center"><B>������</B></td>
				<td align="center"><B>������</B></td>
			</tr>
			
			<%
				Iterator<KcmMemberVO> iter = aList.iterator();
				if (iter != null){
					while (iter.hasNext()){
						kvo = iter.next();
						String imgPath = kvo.getKimg_path();
			%>
			<tr>
				<td align="center"><%= kvo.getKmem() %></td>
				<td align="center"><img src=<%= imgPath %> alt="�̹��� ����" border=0 width="100" height="100"></td>
				<td align="center"><%= kvo.getKid() %></td>
				<td align="center"><%= kvo.getKpw() %></td>
				<td align="center"><%= kvo.getKname() %></td>
				<td align="center"><%= kvo.getKemail() %></td>
				<td align="center"><%= kvo.getKhp() %></td>
				<td align="center"><%= kvo.getKbirth() %></td>
				<td align="center"><%= kvo.getKpostno() %></td>
				<td align="center"><%= kvo.getKjuso() %></td>
				<td align="center"><%= kvo.getKdeleteYN() %></td>
				<td align="center"><%= kvo.getKinsertdate() %></td>
				<td align="center"><%= kvo.getKupdatedate() %></td>
			</tr>
		<%
				}
			}
		%>
			
		</table>
	</body>
</html>