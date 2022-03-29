<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<<<<<< HEAD
<title>이용 문의 게시판</title>
<link rel="stylesheet" href="./resources/css/q_board.css?v=3">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<%@ include file="../top.jsp" %>
</head>
<body>
<section class="qnaBoard" style="width:70%;">
<h3>Q&A 게시판</h3>
<hr>
<div class="qnaSearch">
	<form action="q_list" name="frmSearch">
		<select name="field">
		<!--c:if 는 페이지 이동시 선택된 검색항목 유지하기 위해 작성  -->
			<option value="S" <c:if test="${field=='S'}">selected</c:if>>제목</option>
			<option value="C" <c:if test="${field=='C'}">selected</c:if>>내용</option>
			<option value="N" <c:if test="${field=='N'}">selected</c:if>>작성자</option>
			<option value="CS" <c:if test="${field=='CS'}">selected</c:if>>제목+내용</option>
		</select>
		<input placeholder="검색할 단어를 입력하세요." name="findText" value="${findText}">
		<input type="submit" value="검색">
	</form>
	
	
</div>
<div class="qnaList" style="margin:auto;">
 <table class="table2_1">
 	<tr><th width="10%">번호</th>
 		<th width="45%">제목</th>
 		<th width="15%">작성자</th>
 		<th width="10%">조회수</th>
 		<th width="20%">작성일</th></tr>
 	<c:forEach var="vo" items="${list}"> <!-- vo가 Freeboard타입  blists.getList() 실행-->
	<tr>
		<td>${vo.q_idx }</td> 	
 		<td><a href="q_detail?q_idx=${vo.q_idx}&page=${page.currentPage}&field=${field}&findText=${findText}" class="title">${vo.content }</a>
 		</td>
 		<td>${vo.nick }</td>
 		<td>${vo.q_cnt }</td>
 		<td>
 		<!-- wdate 타입을 클래스에서 LocalDateTime 으로 했을때 날짜시간을 문자열 yyyy-MM-dd'T'HH:mm 형식이다.
 			 wdate필드값을 pattern으로 파싱(형식을 맞춤)-->
 	<%-- 	<fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm" value="${vo.wdate }" var="wdate"/> --%>
 		<fmt:formatDate value="${vo.q_date }" pattern="yyyy-MM-dd"/>  <!-- 출력패턴 -->
 		</td>
 	</tr>
 	</c:forEach>
 </table>
</div>
<div style="text-align: center;">
	<a class="button" href="q_insert?page=${page.currentPage }">글쓰기</a>
</div>
 <!-- 페이지 이동 :전체보기 -->
 <div class="paging">
 <c:if test="${findText==null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?page=${i}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }">&gt;&gt;</a>
</div>
</c:if>
<!-- 페이지 이동 :검색결과 보기 -->
 <c:if test="${findText!=null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1&field=${field}&findText=${findText}">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }&field=${field}&findText=${findText}">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?page=${i}&field=${field}&findText=${findText}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }&field=${field}&findText=${findText}">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }&field=${field}&findText=${findText}">&gt;&gt;</a>
</div>
</c:if>
</div>
</section>
</body>
<%@ include file="../footer.jsp" %>
=======
<title>qna 게시판</title>
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
<div>
	<form action="q_list" name="frmSearch">
		<select name="field">
		<!--c:if 는 페이지 이동시 선택된 검색항목 유지하기 위해 작성  -->
			<option value="S" <c:if test="${field=='S'}">selected</c:if>>제목</option>
			<option value="C" <c:if test="${field=='C'}">selected</c:if>>내용</option>
			<option value="N" <c:if test="${field=='N'}">selected</c:if>>작성자</option>
			<option value="CS" <c:if test="${field=='CS'}">selected</c:if>>제목+내용</option>
		</select>
		<input placeholder="검색할 단어를 입력하세요." name="findText" value="${findText}">
		<input type="submit" value="검색">
	</form>
	
	
</div>
<div style="margin:auto;">
 <table>
 	<tr><th width="10%">번호</th>
 		<th width="45%">제목</th>
 		<th width="15%">작성자</th>
 		<th width="10%">조회수</th>
 		<th width="20%">작성일</th></tr>
 	<c:forEach var="vo" items="${list}"> <!-- vo가 Freeboard타입  blists.getList() 실행-->
	<tr>
		<td>${vo.q_idx }</td> 	
 		<td><a href="q_detail?q_idx=${vo.q_idx}&page=${page.currentPage}&field=${field}&findText=${findText}" class="title">${vo.content }</a>
 		</td>
 		<td>${vo.nick }</td>
 		<td>${vo.q_cnt }</td>
 		<td>
 		<!-- wdate 타입을 클래스에서 LocalDateTime 으로 했을때 날짜시간을 문자열 yyyy-MM-dd'T'HH:mm 형식이다.
 			 wdate필드값을 pattern으로 파싱(형식을 맞춤)-->
 	<%-- 	<fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm" value="${vo.wdate }" var="wdate"/> --%>
 		<fmt:formatDate value="${vo.q_date }" pattern="yyyy-MM-dd"/>  <!-- 출력패턴 -->
 		</td>
 	</tr>
 	</c:forEach>
 	<tr><td colspan="4">Go!
 	<!-- a태그 url요청 get 메소드 -->
 	<a class="button" href="q_insert?page=${page.currentPage }">글쓰기</a>
 	<a class="button" href="${pageContext.request.contextPath }">홈</a></td>
 	<td>작성글 총 개수 : ${page.totalCount}</td>
 	</tr>
 </table>
</div>
 <!-- 페이지 이동 :전체보기 -->
 <c:if test="${findText==null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?page=${i}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }">&gt;&gt;</a>
</div>
</c:if>
<!-- 페이지 이동 :검색결과 보기 -->
 <c:if test="${findText!=null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1&field=${field}&findText=${findText}">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }&field=${field}&findText=${findText}">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?page=${i}&field=${field}&findText=${findText}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }&field=${field}&findText=${findText}">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }&field=${field}&findText=${findText}">&gt;&gt;</a>
</div>
</c:if>
</section>
<%-- <%@ include file="../bottom.jsp" %> --%>
</body>
>>>>>>> refs/remotes/origin/master
</html>








