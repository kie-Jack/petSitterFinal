<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./resources/css/login.css?v=3">
<%@ include file="top.jsp" %>
</head>
<body>

	<h1>로그인</h1>
<div class="loginContainer">
	<form method="post" action="login">
	<table class="loginTable">
		<tr>
		<td><span>ID :</span><input type="text" name="id" placeholder="아이디를 입력하세요.">
		</td>
		</tr>
		<tr>
		<td><span>PW :</span>
		<input type="password" name="password" placeholder="비밀번호 입력하세요.">
		</td>
		</tr>
		<tr>
			<td class="loginBtn" colspan="2" align="center">
				<input type="submit" value="로그인">
				<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}'"/>
			</td>
		</tr>
	</table>
	</form>
</div>
<%@ include file ="footer.jsp" %>
</body>
</html>