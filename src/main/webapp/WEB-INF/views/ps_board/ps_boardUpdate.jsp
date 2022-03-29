<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 게시글 작성</title>
<link rel="stylesheet" href="./resources/css/ps_boardWrite.css?v=3">
</head>
<body>
<%@ include file="../top.jsp" %>
<br><br><br><br>
<h1 style="color: #aabb97;">펫시터 게시글 작성</h1>
<form method="post" action="psb_updateSave" enctype="multipart/form-data">
	<input type="hidden" name="psb_idx" value="${ps_board.psb_idx}">
	<input type="hidden" name="idx" value="${ps_board.idx}">
	<table style="height: 900px;">
		<tr>
			<th width="25%">제목</th>
			<td><input type="text" name="title" class="input" required="required" value="${ps_board.title}"></td>
		</tr>
		<tr>
			<th width="25%">닉네임</th>
			<td><input type="text" name="nick" class="input" required="required" readonly value="${nick}"></td>
		</tr>
		<tr>
			<th>기본주소</th>
			<td>
				<input type="text" name="m_addr" class="input" required="required" value="${ps_board.m_addr}">
			</td>
		</tr>
		<tr>
			<th width="25%">시작일</th>
			<td><input type="date" name="ps_sdate" class="input" required="required"></td>
		</tr>
		<tr>
			<th width="25%">종료일</th>
			<td><input type="date" name="ps_fdate" class="input" required="required"></td>
		</tr>
		<tr>
			<th>견종</th>
			<td width="20%">
				<input type="checkbox" name="p_size" value="소형견" checked>
				<label for="small">소형견</label> (7kg 미만)
				<input type="checkbox" name="p_size" value="중형견">
				<label for="middle">중형견</label> (7kg 이상 15kg 미만)
				<input type="checkbox" name="p_size" value="대형견">
				<label for="big">대형견</label> (15kg 이상)
			</td>
		</tr>
		<tr>
			<th>조건체크</th>
			<td width="20%">
				<label><input type="checkbox" name="terms" value="반려동물없음">반려동물 없음</label>
				<label><input type="checkbox" name="terms" value="픽업가능">픽업 가능</label>
				<label><input type="checkbox" name="terms" value="대형견가능">대형견 가능</label>
				<label><input type="checkbox" name="terms" value="마당있음">마당 있음</label>
				<label><input type="checkbox" name="terms" value="노견케어">노견 케어</label>
			</td>
		</tr>
		<tr>
			<th>코멘트</th>
			<td><textarea rows="2" cols="80" name="comment" required="required">${ps_board.comment}</textarea></td>
		</tr>
		<tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="80" name="content" required="required">${ps_board.content}</textarea></td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				<input type="file" name="files" accept="image/*" multiple class="bn">
			</td>
		</tr>
		<tr height="100">
		 	<td colspan="2" align="center">
			 	<button type="submit" value="저장" class="btn" ><span>저장</span></button>
			 	<button type="reset"  value="다시쓰기" class="btn"><span>다시쓰기</span></button>
			 	<button type="button" value="돌아가기" onclick="history.back(-1)" class="btn"><span>돌아가기</span></button>
		 	</td>
		</tr>
	</table>
</form>

<script>
</script>

</body>
</html>