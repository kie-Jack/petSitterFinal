<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<<<<<< HEAD
<title>qna 수정</title>
<script type="text/javascript">
function post_data() {
	//var subject = frm1.subject.value;  //유효성 검사
	frm1.submit();
}
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/q_board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/top_bottom.css?v=3">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">

</head>
<body style="width: 70%; margin-left: 100px">
<header>
<%@ include file="../top.jsp" %>
</header>
<section>
<hr>
<br><br><br><br>
<form name="frm1" method="post" action="q_update">
 <input type="hidden" name="q_idx" value="${bean.q_idx }">
 <input type="hidden" name="page" value="${page}">
 <input type="hidden" name="field" value=${field }>
 <input type="hidden" name="findText" value=${findText }>
 <div class="mb-3">
		<label for="title">제목</label>
		<input type="text" class="form-control" name="title" value="${bean.title}" id="title" placeholder="제목을 입력해 주세요">
	</div>
	<div class="mb-3">
		<label for="reg_id">작성자</label>
		<input type="text" class="form-control" name="reg_id" value="${bean.nick}" id="reg_id" disabled>
	</div>
		<div class="mb-3">
		<label for="content">내용</label>
		<textarea class="form-control" rows="5" name="content"  id="content" placeholder="내용을 입력해 주세요" ></textarea>
	</div>
 	<div>
 	<input type="submit" value="저장" class="btnGreen">
 	<input type="reset" class="btnGreen" value="다시쓰기">
 	<input type="button" class="btnGreen" onclick="location.href='q_list?page=${page}&field=${field}$findText=${findText}'" value="목록">
 	</div>
 </form>
 </section>
<%@ include file="../footer.jsp" %>
=======
<title>qna 게시판</title>
<script type="text/javascript">
function post_data() {
	//var subject = frm1.subject.value;  //유효성 검사
	frm1.submit();
}
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/q_board.css">
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
<h3>qna 게시판 글 수정</h3>
<hr>
<form name="frm1" method="post" action="q_update">
 <input type="hidden" name="q_idx" value="${bean.q_idx }">
 <input type="hidden" name="page" value="${page}">
 <input type="hidden" name="field" value=${field }>
 <input type="hidden" name="findText" value=${findText }>
 <table>
 	<tr><td width="25%" class="td1">제목</td>
 		<td><input type="text" name="title" value="${bean.title}" size="70" class="input1" required="required"></td>
 	</tr>
 	<tr><td class="td1">작성자</td>
 		<td><input type="text" name="nick" value="${bean.nick}" size="70" class="input1" disabled></td>
 	</tr>
 
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea  rows="20" cols="80" name="content" class="input1" required="required">${bean.content}</textarea></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btnGreen">
 	<!-- <a class="button" href="javascript:post_data();">저장</a> -->
 	<input type="reset" class="btnGreen" value="다시쓰기">
 	<input type="button" class="btnGreen" onclick="location.href='q_list?page=${page}&field=${field}$findText=${findText}'" value="목록">
 	</td></tr>
 </table>
 </form>
 </section>
 <%-- <%@ include file="../bottom.jsp" %> --%>
>>>>>>> refs/remotes/origin/master
</body>
</html>