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
		<title>index page</title>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
			//�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
			function sample4_execDaumPostcode() {
				new daum.Postcode({
					oncomplete: function(data) {
						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

						// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
						var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

						// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
						// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
						if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
							extraRoadAddr += data.bname;
						}
						// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
						if(data.buildingName !== '' && data.apartment === 'Y'){
						   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
						if(extraRoadAddr !== ''){
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
						if(fullRoadAddr !== ''){
							fullRoadAddr += extraRoadAddr;
						}

						// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						document.getElementById('postno').value = data.zonecode; //5�ڸ� �������ȣ ���
						document.getElementById('juso').value = fullRoadAddr;
					}
				}).open();
			}
		</script>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- <script type="text/javascript"
				src="../js/jquery-1.11.0.min.js"></script> -->
		<script type="text/javascript">
			$(document).ready(function(){
				//alert("(log) jQuery executed");
				var enctype = 'application/x-www-form-urlencoded';
				$("#SA").click(function(){
					//alert("(log) select all clicked");
					$("#selectFunc").prop("value", "SA");
					executeFunc(enctype);
				});

				$("#SN").click(function(){
					//alert("(log) search clicked")
					if (!$("#mem").val()){
						alert("ȸ����ȣ�� �Է��ϼ���!!!");
						$("#mem").focus();
						return;
					}
					$("#selectFunc").prop("value", "SN");
					executeFunc(enctype);
				});

				$("#I").click(function(){
					//alert("(log) insert clicked");
					var checker = isValidateRegisterMember();
					if (checker){
						$("#selectFunc").prop("value", "I");
						var domain = $("#emailDomainSlctr").val();
						if (domain == 'bySelf'){
							domain = $("#emailDomain").val();
						}
						var email = $("#emailId").val() + '@' + domain;
						$("#email").prop("value", email);
						//alert(" email >>> " + $("#email").val());
						enctype = "multipart/form-data";
						executeFunc(enctype);
					}
					
				});

				$("#U").click(function(){
					//alert("(log) update clicked");
					if (!$("#mem").val()){
						alert("ȸ����ȣ�� �Է��ϼ���!!!");
						$("#mem").focus();
						return;
					}
					if (!$("#pw").val()){
						alert("��й�ȣ�� �Է��ϼ���!!!");
						$("#pw").focus();
						return;
					}
					$("#selectFunc").prop("value", "U");
					executeFunc(enctype);
				});

				$("#D").click(function(){
					//alert("(log) delete clicked");
					if (!$("#mem").val()){
						alert("ȸ����ȣ�� �Է��ϼ���!!!");
						$("#mem").focus();
						return;
					}
					$("#selectFunc").prop("value", "D");
					executeFunc(enctype);
				});
				
				$("#pwChckBtn").click(function(){
					var pw = $("#pw").val();
					var pwChck = $("#pwChck").val();
					if (!pw){
						alert("��й�ȣ�� �Է��ϼ���!!!");
						$("#pw").focus();
						return;
					}
					if (!pwChck){
						alert("��й�ȣ Ȯ���� �Է��ϼ���!!!");
						$("#pwChck").focus();
						return;
					}
					if (pw == pwChck){
						alert("��й�ȣ Ȯ�� �Ϸ�!");
						$(".pwSet").prop("readonly", true);
						return;
					}else{
						alert("��й�ȣ�� Ȯ���ϼ���.");
						$("#pw").val("");
						$("#pwChck").val("");
						$("#pw").focus();
						return;
					}
				});
				$("#emailDomainSlctr").change(function(){
					//alert("changed");
					//alert($("#rgstEmailDomainSlctr").val());
					var domain = $("#emailDomainSlctr").val();
					if (domain == 'bySelf'){
						$("#emailDomain").val('');
						$("#emailDomain").prop("disabled", false);
					}else{
						$("#emailDomain").val($("#emailDomainSlctr").val());
						$("#emailDomain").prop("disabled", true);
					}
				})
				$("#idChckBtn").click(function(){
					var idVal = $("#id").val();

					if (!idVal){
						alert("���̵� �Է��ϼ���.");
						$("#id").focus();
						return;
					}
					
					callIdCheck();
				});
				$("#memberImg").change(function(){
					//alert("changed");
					//alert("val >>> " + $("#memberImg").val());
					//alert("files >>> " + $("#memberImg").prop("files"))
					$("#imgWindow").html(function(){
						return "<img src=" + $("#memberImg").val() + " width='152' height='192' align='center'>";
					});
				})

				function callIdCheck(){
					$.ajax({
						type		: "POST",
						//http://localhost:8088/Model2_MVC/IdCheckServle
						url			: "../../KcmMemberServlet",
						contentType	: "application/x-www-form-urlencoded",
						data		: {
							id			: $("#id").val(),
							selectFunc	: "idChck",
						},
						success		: whenSuccess,
						error		: whenError
					});
					
					function whenSuccess(data){
						//alert("$(data).find('result') >>> " + $(data).find("result"));
						//alert("$(data).find('result').text() >>> " + $(data).find("result").text());
						var boolVal = $(data).find("result").text();
						//alert("loginCheck.text >>> "+$(data).find("loginCheck").text());
						//alert("loginCheck.html >>> "+$(data).find("loginCheck").html());
						//alert("result.text >>> "+$(data).find("result").text());
						//alert("result.html >>> "+$(data).find("result").html());
						console.log("boolVal >>> " + boolVal);
						var result = eval(boolVal);
						console.log("result >>> " + result);
						if (result){
							alert(" ��� ������ ���̵� �Դϴ�. ");''
							$("#id").prop("readonly", true).css("color", "blue");
							console.log("result >>> " + result);
						}else{
							alert(" �ߺ��� ���̵��Դϴ�. ");
							console.log("result >>> " + result);
							$("#id").val('').focus();
							return;
						}
					}
					
					function whenError(e){
						alert(" ���̵� �ߺ� üũ error >>> " + e.responseText);
					}
				}
			});
			
			function isValidateRegisterMember(){
				if (!$("#id").val()){
					alert("���̵� �Է��ϼ���!!!");
					$("#id").focus();
					return;
				}

				var pw = $("#pw").val();
				var pwChck = $("#pwChck").val();
				if (!pw){
					alert("��й�ȣ�� �Է��ϼ���!!!");
					$("#pw").focus();
					return;
				}
				if (!pwChck){
					alert("��й�ȣ Ȯ���� �Է��ϼ���!!!");
					$("#pwChck").focus();
					return;
				}
				if (!$("#emailId").val()){
					alert("�̸��� �ּҸ� �Է��ϼ���!!!");
					$("#emailId").focus();
					return;
				}
				return true;
			}
			
			function executeFunc(enctype){
				//http://localhost:8088/Model2_MVC/KcmMemberServlet
				$("#registerForm").prop("method", "POST")
				.prop("action", "../../KcmMemberServlet")
				.prop("enctype", enctype)
				.submit();
			}
			
		</script>
	</head>
	<body>
		<form id="registerForm">
			<table align="center" border="1">
				<tr><td colspan="3" align="center">ȸ������</td></tr>
				<tr>
					<td rowspan="5" id="imgWindow" align="center"></td>
					<td align="center" width="100" align="center">ȸ����ȣ</td>
					<td width="250">
						&nbsp;<input type="text" name="mem" id="mem"><br>
						<font size="2">* ����/����/��ȸ �� ȸ����ȣ ���</font>
					</td>
				</tr>
				<tr>
					<td align="center">���̵�</td>
					<td colspan="2">
						<input type="text" name="id" id="id">
						<input type="button" id="idChckBtn" value="���̵��ߺ�üũ">
					</td>
				</tr>
				<tr>
					<td align="center">��й�ȣ</td>
					<td><input type="password" name="pw" id="pw" class="pwSet"></td>
				</tr>
				<tr>
					<td align="center"> ��й�ȣȮ�� </td>
					<td>
						<input type="password" name="pwChck" id="pwChck" class="pwSet size="20">
						<input type="button" id="pwChckBtn" value="��й�ȣȮ��">
					</td>
				</tr>
				<tr>
					<td align="center">ȸ�� ����</td>
					<td><input type="file" name="memberImg" id="memberImg"></td>
				</tr>
				<tr>
					<td align="center">�̸�</td>
					<td colspan="2"><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td align="center">�̸���</td>
					<td colspan="2"><input type="text" name="emailId" id="emailId"> @
						<input type="text" name="emailDomain" id="emailDomain" size="10">
						<select name="emailDomainSlctr" id="emailDomainSlctr">
							<option value="bySelf">�����Է�</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center">��ȭ��ȣ</td>
					<td colspan="2"><input type="text" name="hp" id="hp"></td>
				</tr>
				<tr>
					<td align="center">������� (yyyy.mm.dd)</td>
					<td colspan="2"><input type="text" name="birth" id="birth"></td>
				</tr>
				<tr>
					<td align="center">���θ� �����ȣ</td>
					<td colspan="2">
						<input type="text" name="postno" id="postno">
						<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��">
					</td>
				</tr>
				<tr>
					<td align="center">���θ� �ּ�</td>
					<td colspan="2"><input type="text" name="juso" id="juso" size="50"></td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<input type="hidden" id="selectFunc" name="selectFunc">
						<input type="hidden" id="email" name="email">
						<input type="button" value="��ȸ" id="SA">
						<input type="button" value="ȸ����ȣ �˻�" id="SN">
						<input type="button" value="ȸ������" id="I">
						<input type="button" value="��й�ȣ ����" id="U">
						<input type="button" value="����" id="D">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="�ʱ�ȭ">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>