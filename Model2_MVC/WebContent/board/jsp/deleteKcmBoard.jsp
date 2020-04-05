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
			List<KcmHelloBoardVO> aList = (List<KcmHelloBoardVO>)request.getAttribute("aList");
			int nCnt = aList.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>���� ���� Ȯ��</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
		<script type="text/javascript">
			$(document).ready(function(){
				
				loadCharBytes();
				
				$("#D").click(function(){
					//alert(" 'D' clicked " );
					$("#selectFunc").prop("value", "D");
					if ($("#deleteOK").val() != "1"){
						alert("��й�ȣ�� �����ϼ���.");
						$("#kpwBtn").focus();
						return;
					}
					executeFunc();
				});
				
				$("#SA").click(function(){
					//alert(" 'SA' clicked " );
					$("#selectFunc").prop("value", "SA");
					executeFunc();
				});
				
				$("#kpwBtn").click(function(){
					//alert("(log) 'kpwBtn' clicked");
					pwChck();
				});
				
				function loadCharBytes(){
					//alert("loadCharBytes");
					var cVal = $("#kmemo").val();
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
				
				function executeFunc(){
					$("#boardDelete").prop("method", "POST")
					.prop("action", "/Model2_MVC/KcmHelloBoardServlet")
					.prop("enctype", "application/x-www-form-urlencoded")
					.submit();
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
						alert(" ��й�ȣ Ȯ��! ");
						$("#deleteOK").prop("value", "1");
						$("#kpw").prop("disabled", true);
						$("#D").focus();
					}else{
						alert(" ��й�ȣ�� Ʋ�Ƚ��ϴ�. ");
						$("#kpw").val("").focus();
						return;
					}
				}
				function whenError(err){
					alert("err >>> " + err);
				}
			}
		</script>
	</head>
	<body>
		<center>
		<form id="boardDelete">
			<table border="1" align="center">
				<tr>
					<td colspan="3" align="center">�Խ��� �� �����ϱ�</td>
				</tr>
<%				
				if (nCnt <= 1){
					Iterator<KcmHelloBoardVO> iter = aList.iterator();
					while(iter.hasNext()){
						KcmHelloBoardVO khbvo_2 = iter.next();
%>
				<tr>
					<td align="center" rowspan="6"><img src=<%= khbvo_2.getkImgPath() %> alt="�̹��� ����" border=0 width="100" height="100"></td>
				</tr>
				<tr>
					<td align="center">�۹�ȣ</td>
					<td><input type="text" name="kno" id="kno" size="20" readonly value=<%= khbvo_2.getKno() %>></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td><input type="text" name="ksubject" id="ksubject" size="43" disabled value=<%= khbvo_2.getKsubject() %>></td>
				</tr>
				<tr>
					<td align="center">�̸�</td>
					<td><input type="text" name="kname" id="kname" size="43" disabled value=<%= khbvo_2.getKname() %>></td>
				</tr>
				<tr>
					<td align="center">�Է���</td>
					<td><input type="text" name="kinsertdate" size="20" disabled value=<%= khbvo_2.getKinsertdate() %>></td>
				</tr>
				<tr>
					<td align="center">������</td>
					<td><input type="text" name="kupdatedate" size="20" disabled value=<%= khbvo_2.getKupdatedate() %>></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td colspan="2">
						<textarea name="kmemo" id="kmemo" cols="50" rows="10" disabled><%= khbvo_2.getKmemo() %></textarea>
						<br><div align="right"><span id="printBytes"></span>bytes</div>
					</td>
				</tr>
				<tr>
					<td class="tt">��й�ȣ</td>
					<td colspan="2">
						<input type="password" name="kpw" id="kpw" size="40" >
						<input type="button" name="kpwBtn" id="kpwBtn" value="��й�ȣ Ȯ��">
					</td>
				</tr>
<%
					}
%>
				<tr>
					<td colspan="3" align="center">
						<input type="hidden" id="deleteOK" value="0">
						<input type="hidden" name="selectFunc" id="selectFunc">
						<input type="button" value="�ۻ���" id="D">
						<input type="button" value="�۸��" id="SA">
					</td>
				</tr>
			</table>
		</form>
<%
				}else{
%>
		<script>
			alert(" ������ �����Ͱ� �����ϴ�. ");
		</script>
<%
				}
%>
	</center>
	</body>
</html>