<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch6.board.dao.KcmHelloBoardDAO" %>
<%@ page import="bitcamp.java142.ch6.board.dao.KcmHelloBoardDAOImpl" %>
<%@ page import="bitcamp.java142.ch6.board.vo.KcmHelloBoardVO" %>

<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.SessionUtil" %>
<%
	SessionUtil.setNoCache(request, response);
%>

<%
	List<KcmHelloBoardVO> aListAll = (List<KcmHelloBoardVO>)request.getAttribute("aList");
	int nCnt = aListAll.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>게시판 목록</title>
		<style type="text/css">
			.tt{
				text-align : center;
				font-weight : bold;
			}
		</style>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
		<script type="text/javascript">
			$(document).ready(function(){
				//alert("(log) jQuery executed");
				$(".I").click(function(){
					//alert("(log) 'I' clicked");
					location.href = "/Model2_MVC/board/jsp/insertKcmBoard.jsp";
				});
				
				$(".SA").click(function(){
					$("#selectFunc").prop("value", "SA");
					executeFunc();
				});

				$(".U").click(function(){
					$("#selectFunc").prop("value", "LIU");
					executeFunc();
				});

				$(".D").click(function(){
					$("#selectFunc").prop("value", "LID");
					executeFunc();
				});
				
				$(":checkbox").click(function(index){
					//alert("this " + $(this).val());
					$(":checkbox").each(function(){
						$(this).prop("checked", false);
					});
					$(this).prop("checked", true);
				});
				
				function executeFunc(){
					//http://localhost:8088/Model2_MVC/KcmHelloBoardServlet
					$("#boardForm").prop("method", "POST")
					.prop("action", "/Model2_MVC/KcmHelloBoardServlet")
					.prop("enctype", "application/x-www-form-urlencoded")
					.submit();
				}
			});
		</script>
	</head>
	<body>
		<center>
			<form id="boardForm">
				<table border="1" align="center">
					<thead>
						<tr>
							<td colspan="10" align="center">
								<h2>게시판</h2>
							</td>
						</tr>
						<tr>
							<td colspan="10" align="right">
								<input type="button" value="글쓰기" class="I">
								<input type="button" value="글목록" class="SA">
								<input type="button" value="글수정" class="U">
								<input type="button" value="글삭제" class="D">
							</td>
						</tr>
						<tr>
							<td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
							<td class="tt">글번호</td>
							<td class="tt">제목</td>
							<td class="tt">이름</td>
							<td class="tt">내용</td>
							<td class="tt">사진</td>
							<td class="tt">입력일</td>
							<td class="tt">수정일</td>
						</tr>
					</thead>
<%
					for (int i=0; i < nCnt; i++){
						KcmHelloBoardVO khbvo = aListAll.get(i);
						System.out.println("khbvo.getkImgPath() >>>>>> " + khbvo.getkImgPath());
%>					
						<tbody>
						<tr>
							<td align="center">
								<input type="checkbox" name="chkInKno"
										id="chkInKno"  value=<%= khbvo.getKno() %>>
							</td>
							<td align="center"><%= khbvo.getKno() %></td>
							<td align="center"><%= khbvo.getKsubject() %></td>
							<td align="center"><%= khbvo.getKname() %></td>
							<td align="center"><%= khbvo.getKmemo() %></td>
							<td align="center"><img src=<%= khbvo.getkImgPath() %> alt="이미지 없음" border=0 width="100" height="100"></td>
							<td align="center"><%= khbvo.getKinsertdate() %></td>
							<td align="center"><%= khbvo.getKupdatedate() %></td>						
						</tr>
<%
					}
%>						
						<tr>
							<td colspan="10" align="right">
								<input type="hidden" id="selectFunc" name="selectFunc">
								
								<input type="button" value="글쓰기" class="I">
								<input type="button" value="글목록" class="SA">
								<input type="button" value="글수정" class="U">
								<input type="button" value="글삭제" class="D">
							</td>
						</tr>
						</tbody>
				</table>
			</form>
		</center>
	</body>
</html>