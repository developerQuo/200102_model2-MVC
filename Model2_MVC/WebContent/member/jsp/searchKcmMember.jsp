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
				<td colspan="13" align="center">회원정보</td>
			</tr>
			<tr>
				<td align="center"><B>회원번호</B></td>
				<td align="center"><B>회원사진</B></td>
				<td align="center"><B>아이디</B></td>
				<td align="center"><B>비밀번호</B></td>
				<td align="center"><B>이름</B></td>
				<td align="center"><B>이메일</B></td>
				<td align="center"><B>전화번호</B></td>
				<td align="center"><B>생년월일</B></td>
				<td align="center"><B>우편번호</B></td>
				<td align="center"><B>주소</B></td>
				<td align="center"><B>삭제여부</B></td>
				<td align="center"><B>가입일</B></td>
				<td align="center"><B>수정일</B></td>
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
				<td align="center"><img src=<%= imgPath %> alt="이미지 없음" border=0 width="100" height="100"></td>
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