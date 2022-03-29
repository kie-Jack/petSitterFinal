<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이용자 후기 게시판</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rbboardlist.css?v=3">
</head>
<body>
	<%@ include file="../top.jsp"%>
	<section class="rbboardContainer">
		<h2><!-- <img alt="" src="img/thumbsup.png" name="img" style="margin-top: 20px"> -->
		이용자 후기 게시판</h2>
		<div style="margin: auto;">
			<ul id="main">
				<li>
					<ul class="mainrow">
						<li>번호</li>
						<li>제목</li>
						<li>작성자</li>
						<li>펫시터</li>
						<li>평점</li>
						<li>조회수</li>
						<li>작성일</li>
					</ul>
				</li>
				<c:forEach var="rb" items="${list}">
					<li>
						<ul class="row">
							<li>${rb.r_idx }</li>
							<c:if test="${member != null}">
								<li><a href="rbdetail?r_idx=${rb.r_idx}&page=${page.currentPage}&field=${field}&findText=${findText}"
									class="title" >${rb.title }<input type="hidden" value="idx?=${idx }"></a> </li>
							</c:if>
							<c:if test="${member == null}">
								<li><a href="rbdetailNotlogin?r_idx=${rb.r_idx}&page=${page.currentPage}&field=${field}&findText=${findText}"
									class="title" >${rb.title }<input type="hidden" value="idx?=${idx }"></a> </li>
							</c:if>
							<li>${rb.nick }</li>
							<li>${rb.ps_nick }</li>
							<li><c:forEach var="i" begin="1" end="${rb.rate }"><i class="fa fa-star" aria-hidden="true" style=" padding:0.1em;"></i></c:forEach></li>
							<li>${rb.r_cnt}</li>
							<li><fmt:formatDate value="${rb.r_date }"
									pattern="yyyy-MM-dd" var="r_date" /> <c:if
									test='${r_date == today}'>
									<fmt:formatDate value="${rb.r_date }" type="time" />
								</c:if> <c:if test='${rb.r_date != today}'>
									<fmt:formatDate value="${rb.r_date }" pattern="yyyy-MM-dd " />
								</c:if></li>
							

						</ul>
					</li>
				</c:forEach>
			</ul>
			</div>
		
<div style="margin:auto;">
<form action="rblist" name="frmSearch">
<div class="sa">
<div class="searchdiv">
		<select name="field" class="field">
			<option value="T" <c:if test="${field=='T'}">selected</c:if>>제목</option>
			<option value="C" <c:if test="${field=='C'}">selected</c:if>>내용</option>
			<option value="N" <c:if test="${field=='N'}">selected</c:if>>작성자</option>
			<option value="PS" <c:if test="${field=='PS'}">selected</c:if>>펫시터 닉네임</option>
			<option value="CS" <c:if test="${field=='CT'}">selected</c:if>>제목+내용</option>
		</select>
		<input placeholder="검색할 단어를 입력하세요." name="findText" value="${findText}" style="width: 300px; height: 40px; border: none; outline: none;">
		<button type="submit"></button>
</div>
</div>
	</form>
	<div style="text-align: right">
 	<a class="button" href="rbinsert?page=${page.currentPage }">글쓰기</a>&nbsp;&nbsp;
 	<a class="button" href="${pageContext.request.contextPath }">홈 </a>
 	</div>
		</div>
		 <!-- 페이지 이동 :전체보기 -->
		<c:if test="${findText==null}"> 
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
<%-- 		 <a class="pagenum" href="?page=${i}">${i}</a> --%>   
		 <a class="${page.currentPage==i? 'active':'pagenum' }" href="?page=${i}">${i}</a>   
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
		<a class="${page.currentPage==i? 'active':'pagenum' }" href="?page=${i}&field=${field}&findText=${findText}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }&field=${field}&findText=${findText}">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }&field=${field}&findText=${findText}">&gt;&gt;</a>
</div>
</c:if>
		
	</section>
</body>
 <%@ include file="../footer.jsp"%>
</html>