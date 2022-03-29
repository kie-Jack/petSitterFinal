<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="./resources/css/mup.css?v=3"> 
</head>
<%@ include file="../top.jsp" %>
<body>

<input type="hidden" name="idx" value="${member.idx}" >  
	<ul class="memberDetail">
		<li class="detail" id="name">이름 : ${member.name }님</li>
		<li class="detail">닉네임 : ${member.nick}</li>
		<li class="detail">전화번호 : ${member.tel}</li>
		<c:if test="${member.idx != 1}">
			<li class="detail">보유포인트 : ${member.point }</li>
		</c:if>
		<c:if test="${member.admin == 1}">
			<li class="detail">총 수익 : ${income}원</li>
		</c:if>
	</ul>
	<ul class="detailButtons">
	<li><a class="mup" href="update">정보 수정</a></li>
	<li><a class="mupo" href="home">돌아가기</a></li>
	</ul>	
 	
 	

<div>
<br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</body>
<%@ include file="../footer.jsp" %>

</html>