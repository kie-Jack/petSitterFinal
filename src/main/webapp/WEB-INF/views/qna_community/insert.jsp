<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<<<<<< HEAD
<title>이용 문의</title>
<script type="text/javascript">
function post_data() {
	//var subject = frm1.subject.value;  //유효성 검사
	frm1.submit();
}
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/q_boardInsert.css?v=3">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<%@ include file="../top.jsp" %>
</head>
<body>
<section>
<h3>문의 글 작성</h3>
<div class="q_insertContainer">  
<form name="frm1" method="post" action="q_save">
 <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}">  <!-- 클라이언트 ip -->
 <input type="hidden" name="idx" value="${member.idx}">
 	<div class="titleContainer">
		<label for="title" class="names">제목</label>
		<input type="text" name="title" id="title" placeholder="제목을 입력해 주세요">
	</div>
	<div class="writerContainer">
		<label for="reg_id" class="names">작성자</label>
		<input type="text" name="reg_id" value="${member.nick}" id="reg_id" disabled>
	</div>
		<div class="contentContainer">
		<label for="content" class="names">내용</label>
		<textarea rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
	</div>
 	<div class="q_insertBtn">
 	<input type="submit" value="저장" >
 	<input type="reset"  value="다시쓰기">
 	<input type="button" value="목록" onclick="location.href='q_list?page=${page}'">
 	</div>
 </form>
 </div>
 </section>
</body>
 <%@ include file="../footer.jsp" %>
=======
<title>동아리 커뮤니티</title>
<script type="text/javascript">
function post_data() {
	//var subject = frm1.subject.value;  //유효성 검사
	frm1.submit();
}
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/q_board.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/top_bottom.css?v=3">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
</head>
<body>
<header>
<%@ include file="../top.jsp" %>
</header>
<section>
<h3>qna 게시판</h3>
<hr>
<form name="frm1" method="post" action="q_save">
 <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}">  <!-- 클라이언트 ip -->
 <input type="hidden" name="idx" value="${member.idx}">
 <table style="width:60%;">
 	<tr><td width="20%" class="td1">제목</td>
 		<td class="left"><input type="text" name="title" size="70" class="input1" required="required"></td>
 	</tr>
 	<tr><td class="td1">작성자</td>
 		<td class="left"><input type="text" name="nick" value="${member.nick}" size="70" class="input1" required="required"></td>
 	</tr>
 	
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td class="left"><textarea  rows="20" cols="80" name="content" class="input1" required="required"></textarea></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btn" >
 	<!-- <a class="button" href="javascript:post_data();">저장</a> -->
 	<input type="reset"  value="다시쓰기" class="btn">
 	<input type="button" value="목록" onclick="location.href='q_list?page=${page}'" class="btn">
 <!-- 	<a class="button" href="#">목록</a>  -->
 	</td></tr>
 </table>
 </form>
 </section>
 <%-- <%@ include file="../bottom.jsp" %> --%>
</body>
>>>>>>> refs/remotes/origin/master
</html>