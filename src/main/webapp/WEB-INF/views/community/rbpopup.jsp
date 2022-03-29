<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pslist.css?v=3">
</head>
<script type="text/javascript">
	function closePop(){
		/* var nick = document.getElementById("nick");
		window.returnValue=nick; */
		opener.document.frm1.ps_nick.value= document.frm.ps_nick.value;
		self.close();
	}

</script>
<body>
<section>
	<form name="frm" method="post" action='rbinsert' target="_serf">
	
		<table>
			<tr>
				<th>펫시터 닉네임</th>
				<td>
				<input type="text" size="22" id="ps_nick" readonly>
				<input type="button" size="8" onclick="closePop()" value="선택">
				</td>
			</tr>
			
		</table>
	</form>
	<form name="frm2" action="rbpopup">
		<table>
			<tr>
			<th>닉네임으로 검색</th>
				<td>
				<input type="text" size="22" name="nick">
				<input type="submit" size="8" value="검색">
				</td>
			</tr>
		</table>
			
	</form>
	
		<hr>
		<div style="margin:auto;">
		<ul id="main">
			<li>
				<ul class="row">
					<li>펫시터 닉네임</li>
					<li>펫시터 주소</li>
				</ul>
			</li>
		<c:forEach var="pl" items="${list }">
			<li>
				<ul class="row">
					<li><a href="#" onclick="document.getElementById('ps_nick').value='${pl.nick}'">${pl.nick }		<input type="hidden" name="idx" value="${pl.idx }"></a></li>

					<li>${pl.m_addr }</li>
				</ul>
		</c:forEach>
			
		</ul>
		<script type="text/javascript">


</script>
	</div>
 <!-- 전체 ps목록 -->

	<c:if test="${nick==null }">
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
		<!-- 검색 ps목록 -->
		<c:if test="${nick!=null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1&nick=${nick }">&lt;&lt;</a>  
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }&nick=${nick }">&lt;</a>  
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}"> 
		<a class="pagenum" href="?page=${i}&nick=${nick }">${i}</a>  
	</c:forEach>
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }&nick=${nick }">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }&nick=${nick }">&gt;&gt;</a>
</div>
</c:if>
		

		</section>
</body>
</html>