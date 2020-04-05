<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bitcamp.java142.ch6.board.vo.KcmHelloBoardVO" %>

<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="bitcamp.java142.ch6.kcmjf.common.utils.SessionUtil" %>
<%
	SessionUtil.setNoCache(request, response);
%>
<%			
			System.out.println(" (log) updateKcmBoard entered");
			List<KcmHelloBoardVO> aList = (List<KcmHelloBoardVO>)request.getAttribute("aList");
			System.out.println(" aList >>> " + aList);
			System.out.println(" aList.size() >>> " + aList.size());
			int nCnt = aList.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>게시판 글수정</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
		<script type="text/javascript">
			$(document).ready(function(){
				
				loadCharBytes();
				
				$("#U").click(function(){
					//alert("(log) 'U' clicked");
					$("#selectFunc").prop("value", "U");
					if ($("#updateOK").val() != "1"){
						alert("비밀번호를 인증하세요.");
						$("#kpwBtn").focus();
						return;
					}
					executeFunc();
				});
				
				$("#SA").click(function(){
					alert("(log) 'SA' clicked");
					$("#selectFunc").prop("value", "SA");
					executeFunc();
				});
				
				$("#kpwBtn").click(function(){
					//alert("(log) 'kpwBtn' clicked");
					pwChck();
				});

				$("#kmemo").keyup(function(){
					charBytes(this);
				});
				
				$("#boardImg").change(function(){
					//alert("changed");
					//alert("val >>> " + $("#memberImg").val());
					//alert("files >>> " + $("#memberImg").prop("files"))
					$("#imgWindow").html(function(){
						return "<img src=" + $("#boardImg").val() + " alt='이미지 없음' border=0 width='100' height='100'>";
					});
				})
				
				function loadCharBytes(){
					//alert("loadCharBytes");
					var cVal = $("#kmemo").val();
					$("#printBytes").text(getCharLen(cVal));
				}
				
				function charBytes(obj){
					//alert("" + obj);
					var cVal = $(obj).val();
					var cLen = cVal.length;

					//alert("currentBytes >>> " + currentBytes);
					while (getCharLen(cVal) > 500){
						cLen--;
						cVal = cVal.substring(0, cLen);
					}
					$(obj).val(cVal);
					$("#printBytes").text(getCharLen(cVal));
				}
				
				function getCharLen(str){
					//alert("str >>> " + str);
					var len = 0;
					for (var i=0; i<str.length; i++){
						if (escape(str.charAt(i)).length == 6){
							len++;
						}
						len++;
					}
					return len;
				}
			});
			function pwChck(){
				var noVal = $("#kno").val();
				var pwVal = $("#kpw").val();
				//alert("pwVal >>> " + pwVal);
				$.ajax({
					type		: "POST",
					url			: "/Model2_MVC/KcmHelloBoardServlet",
					contentType	: "application/x-www-form-urlencoded",
					data		: {
						kno			: noVal,
						kpw			: pwVal,
						selectFunc	: "pwChck",
					},
					success		: whenSuccess,
					error		: whenError
				});
				function whenSuccess(data){
					var bool = $(data).find("result").text();
					var result = eval(bool);
					if (result){
						alert(" 비밀번호 확인! ");
						$("#updateOK").prop("value", "1");
						$("#kpw").prop("disabled", true);
						$("#ksubject").prop("readonly", true);
						$("#kname").prop("readonly", true);
						$("#boardImg").prop("readonly", true);
						$("#kmemo").prop("readonly", true);
						$("#U").focus();
					}else{
						alert(" 비밀번호가 틀렸습니다. ");
						$("#kpw").val("").focus();
						return;
					}
				}
				function whenError(err){
					alert("err >>> " + err);
				}
			}
			function executeFunc(){
				$("#boardUpdate").prop("method", "POST")
				.prop("action", "/Model2_MVC/KcmHelloBoardServlet")
				.prop("enctype", "multipart/form-data")
				.submit();
			}
		</script>
	</head>
	<body>
		<center>
			<form id="boardUpdate">
				<table border="1" align="center">
<%
					if(nCnt <= 1){
						for (int i=0; i<nCnt; i++){
							KcmHelloBoardVO khbvo_2 = aList.get(i);
%>
					<tr>
						<td colspan="3" align="center">게시판 글 수정하기</td>
					</tr>
					<tr>
						<td align="center" rowspan="7" id="imgWindow">
							<img src=<%= khbvo_2.getkImgPath() %> alt="이미지 없음" border=0 width="100" height="100">
						</td>
					</tr>
					<tr>
						<td align="center">글번호</td>
						<td><input type="text" name="kno" id="kno" size="20" readonly value=<%= khbvo_2.getKno() %>></td>
					</tr>
					<tr>
						<td align="center">제목</td>
						<td><input type="text" name="ksubject" id="ksubject" size="43" value=<%= khbvo_2.getKsubject() %>></td>
					</tr>
					<tr>
						<td align="center">이름</td>
						<td><input type="text" name="kname" id="kname" size="43" value=<%= khbvo_2.getKname() %>></td>
					</tr>
					<tr>
						<td align="center">입력일</td>
						<td><input type="text" name="kinsertdate" size="20" disabled value=<%= khbvo_2.getKinsertdate() %>></td>
					</tr>
					<tr>
						<td align="center">수정일</td>
						<td><input type="text" name="kupdatedate" size="20" disabled value=<%= khbvo_2.getKupdatedate() %>></td>
					</tr>
					<tr>
					<td align="center">사진 올리기</td>
						<td><input type="file" name="boardImg" id="boardImg"></td>
					</tr>
					<tr>
						<td align="center">내용</td>
						<td colspan="2">
							<textarea name="kmemo" id="kmemo" cols="50" rows="10"><%= khbvo_2.getKmemo() %></textarea>
							<br><div align="right"><span id="printBytes"></span>bytes</div>
						</td>
					</tr>
					<tr>
						<td class="tt">비밀번호</td>
						<td colspan="2">
							<input type="password" name="kpw" id="kpw" size="40" >
							<input type="button" name="kpwBtn" id="kpwBtn" value="비밀번호 확인">
						</td>
					</tr>
<%
						}
					}else{
%>			
						<script type="text/javascript">
							alert(" 수정할 데이터가 없습니다. ");
						</script>
<%
					}
					
		
%>
					<tr>
						<td colspan="3" align="center">
							<input type="hidden" id="updateOK" value="0">
							<input type="hidden" name="selectFunc" id="selectFunc">
							<input type="button" value="글수정" id="U">
							<input type="button" value="글목록" id="SA">
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>
