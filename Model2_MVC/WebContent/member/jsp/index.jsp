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
		<title>â�������̵�</title>
	</head>
	<!-- 
		CSS style �Ӽ���
		background : colr : 
					16���� �� : #RRGGBB
					           RR : red, GG : green, BB : blue
					           16���� 00 ~ ff �� ǥ��					           
					           #000000 : rgb(0,0,0) : ����
					           #ff0000 : rgb(255,0,0) : ����
					           #ffffff : rgb(255,255,255) : ���
					RGB �� : rgb(red, green, blue)
					               �� ���� 0 ~ 255 �� ǥ��  
		display : table : ���̺� ���·� ���
		width : ���� ������Ʈ�� ���� ũ�� : px �Ǵ� % ������ ���ڷ� ǥ��
		height : ���� ������Ʈ�� ���� ũ�� : px �Ǵ� % ������ ���ڷ� ǥ��
		text-align : center : ���� ������Ʈ�� �����͸� ������ �߾����� ��ġ�Ѵ�.
		vertical-align : middle : ���� ������Ʈ�� �����͸� ������ �߾����� ��ġ�Ѵ�.
	 -->
	<!-- 		
		body ������Ʈ�� ���� �Ӽ� ���ϱ�  
		bgcolor="lightgrey" 
	-->
	<body bgcolor="#18FD27">
	<section>
		<!-- ���  -->
		<!-- 
			inline style
			<�±� style="�Ӽ�1: �Ӽ���; �Ӽ�2: �Ӽ���;"
		 -->
		<header style="display: table; /* ǥ������ */
		               width: 100%;/* �ʺ� */
		               height: 50px;/* ���� */
		               background: #18FD27;/* ����  */
		               color: white;/* ���ڻ� */
		               text-align: center;/* ������ ������ġ */
		               vertical-align: middle; /* ������ ������ġ */ ">
			<h1>â�������̵�</h1>
		</header>
		<!-- ����  -->
		<section>
			<h2 align="center"> ���� ������ </h2>
			<p align="right">
				<!-- http://localhost:8088/Model2_MVC/member/jsp/login.jsp -->
				<a href="/Model2_MVC/member/jsp/login.jsp">�α���</a>
				<!-- http://localhost:8088/Model2_MVC/member/jsp/registerKCMMember.jsp -->
				<a href="/Model2_MVC/member/jsp/registerKCMMember.jsp">ȸ������</a>
				<!-- http://localhost:8088/babyWeb/board/kcmHelloBoardInsert.html -->
				<a href="/Model2_MVC/board/jsp/insertKcmBoard.jsp">�Խ��� �۾���</a>
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
		<!-- Ǫ��  -->
		<footer style="display: table;
		               width: 100%;
		               height: 40px;
		               background: red;
		               color: white;
		               text-align: center;
		               vertical-align: middle;">
			<h3> �ൿ���� : �̻��� </h3>
		</footer>
	</section>			
	</body>
</html>