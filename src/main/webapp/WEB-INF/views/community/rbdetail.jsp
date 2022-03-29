<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>day7 글 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rbdetail.css?v=3">
</head>

<body>
<%@ include file="../top.jsp" %>

<section>
	<!-- 문서가 생성될때 실행 -->
	<h2><!-- <img alt="" src="img/thumbsup.png" name="img" style="margin-top: 20px"> -->
		이용자 후기 게시판</h2>
	
	<div style="width: 90%; margin: auto;max-width: 1024px;">
		<ul id="main">
			<li>
				<ul class="title_row">
					<li><strong>${bean.nick}</strong> 님의 글</li>
					<li>${bean.title}</li>
				</ul>
			</li>
			<li>
				<ul class="info_row">
					<li>맡긴 펫시터 닉네임 : ${bean.ps_nick }</li>	
					<li><c:forEach var="i" begin="1" end="${bean.rate }">★</c:forEach></li>	
					<li>조회수 ${bean.r_cnt}</li>
					<li>작성날짜 <fmt:formatDate value="${bean.r_date }" type="both"/></li>
					<!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
				</ul>
			</li>
			<li>
				<ul id="content">
					<li>내용</li>			
					<!-- textarea에 입력한 엔터는 \n db에도 \n으로 저장됩니다.
					     브라우저 출력은 줄바꿈은 <br> 태그 해결1) pre 태그, 해결2) \n을 <br>로 대치-->	
					<li>
						<pre>${bean.content}</pre>
					</li>				
				</ul>
			</li>
		</ul>
	<div style="text-align: center;margin-bottom: 10px;">
		<c:if test="${member.idx==bean.idx || member.admin == '1' }">
		<a class="button" href="rbupdate?r_idx=${bean.r_idx}&page=${page}&field=${field}&findText=${findText}">수정</a>
		<%-- <a class="button" href="rbdelete.do?r_idx=${bean.r_idx}&page=${page}">삭제</a> --%>
		<a class="button" onclick="javascript:deleteSet()">삭제</a>
		</c:if>
		<a class="button" href="rblist?page=${page }&field=${field}&findText=${findText}">목록</a>
	</div>
	<!-- 메인글 출력 끝 -->
	
	
</div>
<!-- 처음에는 display가 none 이고 안보입니다. -->
<!-- modal : alert,confirm 메소드 사용 외에 추가적인 정보를 받을 때 사용자가 만드는 입력 상자...-->
 	<div id="myModal" class="modal">
		<!-- Modal content : 모달 입력창-->
		<div class="modal-content">
			<span class="close">&times;</span><br>
			<div style="padding: 0px 20px;">
				<b>삭제 확인</b><br>
				<br>
				<form action="rbdelete" method="post" onsubmit="return deleteOk()">
					<input type="hidden" name="r_idx" value="${bean.r_idx }"> <!--삭제할 글번호-->
					<input type="hidden" name="page" value="${page }">
					<input type="submit" value="확인" style="padding: 5px 20px;">
					<br>
					<span style="color:red;font-size:0.8em;" id="err"></span>
				</form>
			</div>
		</div>
	</div> 
</section>	
<%-- <%@ include file="../bottom.jsp" %> --%>
<!-- 모달 끝 -->
<script type="text/javascript">
	var modal = document.getElementById('myModal');
	var span = document.getElementsByClassName("close")[0];
	
	span.onclick = function() {   //span 요소의 onclick 속성값에 해당하는 함수를 설정합니다.
		modal.style.display = "none";   //modal 화면에 안보이기   닫기 기능 구현
	}

	function deleteOk(){
		const yn = confirm('글을 삭제하시겠습니까?');
		if(yn==true){
			return true; 	
			location.href=`delete?r_idx=${bean.r_idx }&page=${page }&field=${field }&findText=${findText }`;
		}else {
			modal.style.display = "none"; 
			return false;
		}
	}
	function deleteSet(){
		document.getElementById('myModal').style.display='block';		
	}
	
	
</script>

</body>
</html>
