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
		<title>게시판 글쓰기</title>
		<style>
			.tt{
				text-align : center;
			}
		</style>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
		<script language="javaScript">
			$(document).ready(function(){
				$("#I").click(function(){
					//alert("(log) 'I' clicked");
					
					if( !$("#ksubject").val() ){
						alert("제목을 입력하세요!");
						$("#ksubject").focus();
						return;
					}
					if( !$("#kname").val() ){
						alert("이름을 입력하세요!");
						$("#kname").focus();
						return;
					}
					if( !$("#kpw").val() ){
						alert("비밀번호를 입력하세요!");
						$("#kpw").focus();
						return;
					}
					if( !$("#kmemo").val() ){
						alert("내용을 입력하세요!");
						$("#kmemo").focus();
						return;
					}
					$("#selectFunc").prop("value", "I");
					$("#boardWrite").prop("method", "POST")
					.prop("action", "../../KcmHelloBoardServlet")
					.prop("enctype", "multipart/form-data")
					.submit();	
				});
				
				$("#kmemo").keyup(function(){
					charBytes(this);
				});
				
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
		</script>
	</head>
	<body>
		<form id="boardWrite">
			<table border="1" align="center">
				<tr><td colspan="2" align="center">게시판 글쓰기</td></tr>
				<tr>
					<td class="tt">글번호</td>
					<td><input type="text" name="kno" id="kno" size="20" disabled></td>
				</tr>
				<tr>
					<td class="tt">제목</td>
					<td><input type="text" name="ksubject" id="ksubject" size="33" ></td>
				</tr>
				<tr>
					<td class="tt">이름</td>
					<td><input type="text" name="kname" id="kname" size="33" ></td>
				</tr>
				<tr>
					<td class="tt">비밀번호</td>
					<td><input type="password" name="kpw" id="kpw" size="20" ></td>
				</tr>
				<tr>
					<td class="tt">입력일</td>
					<td><input type="text" name="kinsertdate" id="kinsertdate" size="20"  disabled></td>
				</tr>
				<tr>
					<td class="tt">수정일</td>
					<td><input type="text" name="kupdatedate" id="kupdatedate" size="20"  disabled></td>
				</tr>
				<tr>
					<td align="center">사진 올리기</td>
					<td><input type="file" name="boardImg" id="boardImg"></td>
				</tr>
				<tr>
					<td class="tt">내용</td>
					<td>
						<textarea name="kmemo" id="kmemo" rows="10" cols="50"></textarea>
						<br><div align="right"><span id="printBytes">0</span>bytes</div>	
					</td>
				</tr>
				<tr>
					<td class="tt" colspan="3">
						<input type="hidden" id="selectFunc" name="selectFunc">
						<input type="button" value="보내기" id="I">
						<input type="reset" value="다시">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>