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
			//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
			function sample4_execDaumPostcode() {
				new daum.Postcode({
					oncomplete: function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if(data.buildingName !== '' && data.apartment === 'Y'){
						   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if(extraRoadAddr !== ''){
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if(fullRoadAddr !== ''){
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postno').value = data.zonecode; //5자리 새우편번호 사용
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
						alert("회원번호를 입력하세요!!!");
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
						alert("회원번호를 입력하세요!!!");
						$("#mem").focus();
						return;
					}
					if (!$("#pw").val()){
						alert("비밀번호를 입력하세요!!!");
						$("#pw").focus();
						return;
					}
					$("#selectFunc").prop("value", "U");
					executeFunc(enctype);
				});

				$("#D").click(function(){
					//alert("(log) delete clicked");
					if (!$("#mem").val()){
						alert("회원번호를 입력하세요!!!");
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
						alert("비밀번호를 입력하세요!!!");
						$("#pw").focus();
						return;
					}
					if (!pwChck){
						alert("비밀번호 확인을 입력하세요!!!");
						$("#pwChck").focus();
						return;
					}
					if (pw == pwChck){
						alert("비밀번호 확인 완료!");
						$(".pwSet").prop("readonly", true);
						return;
					}else{
						alert("비밀번호를 확인하세요.");
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
						alert("아이디를 입력하세요.");
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
							alert(" 사용 가능한 아이디 입니다. ");''
							$("#id").prop("readonly", true).css("color", "blue");
							console.log("result >>> " + result);
						}else{
							alert(" 중복된 아이디입니다. ");
							console.log("result >>> " + result);
							$("#id").val('').focus();
							return;
						}
					}
					
					function whenError(e){
						alert(" 아이디 중복 체크 error >>> " + e.responseText);
					}
				}
			});
			
			function isValidateRegisterMember(){
				if (!$("#id").val()){
					alert("아이디를 입력하세요!!!");
					$("#id").focus();
					return;
				}

				var pw = $("#pw").val();
				var pwChck = $("#pwChck").val();
				if (!pw){
					alert("비밀번호를 입력하세요!!!");
					$("#pw").focus();
					return;
				}
				if (!pwChck){
					alert("비밀번호 확인을 입력하세요!!!");
					$("#pwChck").focus();
					return;
				}
				if (!$("#emailId").val()){
					alert("이메일 주소를 입력하세요!!!");
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
				<tr><td colspan="3" align="center">회원정보</td></tr>
				<tr>
					<td rowspan="5" id="imgWindow" align="center"></td>
					<td align="center" width="100" align="center">회원번호</td>
					<td width="250">
						&nbsp;<input type="text" name="mem" id="mem"><br>
						<font size="2">* 수정/삭제/조회 시 회원번호 사용</font>
					</td>
				</tr>
				<tr>
					<td align="center">아이디</td>
					<td colspan="2">
						<input type="text" name="id" id="id">
						<input type="button" id="idChckBtn" value="아이디중복체크">
					</td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="pw" id="pw" class="pwSet"></td>
				</tr>
				<tr>
					<td align="center"> 비밀번호확인 </td>
					<td>
						<input type="password" name="pwChck" id="pwChck" class="pwSet size="20">
						<input type="button" id="pwChckBtn" value="비밀번호확인">
					</td>
				</tr>
				<tr>
					<td align="center">회원 사진</td>
					<td><input type="file" name="memberImg" id="memberImg"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td colspan="2"><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td align="center">이메일</td>
					<td colspan="2"><input type="text" name="emailId" id="emailId"> @
						<input type="text" name="emailDomain" id="emailDomain" size="10">
						<select name="emailDomainSlctr" id="emailDomainSlctr">
							<option value="bySelf">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center">전화번호</td>
					<td colspan="2"><input type="text" name="hp" id="hp"></td>
				</tr>
				<tr>
					<td align="center">생년월일 (yyyy.mm.dd)</td>
					<td colspan="2"><input type="text" name="birth" id="birth"></td>
				</tr>
				<tr>
					<td align="center">도로명 우편번호</td>
					<td colspan="2">
						<input type="text" name="postno" id="postno">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td align="center">도로명 주소</td>
					<td colspan="2"><input type="text" name="juso" id="juso" size="50"></td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<input type="hidden" id="selectFunc" name="selectFunc">
						<input type="hidden" id="email" name="email">
						<input type="button" value="조회" id="SA">
						<input type="button" value="회원번호 검색" id="SN">
						<input type="button" value="회원가입" id="I">
						<input type="button" value="비밀번호 수정" id="U">
						<input type="button" value="삭제" id="D">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="초기화">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>