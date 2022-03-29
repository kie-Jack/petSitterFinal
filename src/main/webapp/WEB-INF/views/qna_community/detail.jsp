<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>

<script type="text/javascript">
	function resetOk() {
		document.frmCmt.func.value = 1;
		document.frmCmt.nick.disabled=false; 
	}
	
	function  updateCmt(qc_idx,nick,qc_content) {  //실제 댓글 수정은 content 컬럼만 , 화면에 값표시 함수
		var obj = document.frmCmt;
		obj.qc_idx.value=qc_idx;   //수정할 컬럼의 idx값을 input 태그 value 에 설정합니다.
		obj.nick.value = nick;  //
		//textarea 로 값 표시하기전에 <br>을 개행문자로 바꾸기 
		while(qc_content.indexOf('<br>')!=-1){  //문자열 <br> 가 없을떄 까지 반복
			qc_content = qc_content.replace('<br>','\n');
		}
		obj.qc_content.value=qc_content;
		obj.func.value=2;    //댓글 수정  (func 1은 댓글입력, func 3은 댓글 삭제)
		document.frmCmt.nick.disabled=true;    //disabled 를 설정
	}
	
	function deleteCmt(qc_idx,page,q_idx){
		var yn=confirm('댓글을 삭제하시겠습니까?');
		if(yn){
			alert('댓글을 삭제합니다.');  /* cmtidx:댓글 idx , page:현재페이지번호 , mref:메인글 idx */
			location.href='comment?action=delete&qc_idx='+qc_idx+'&page='+page+'&q_idx='+q_idx;
		}  //현재 detail.jsp -> commentAction.jsp  -> 처리 -> detailAction.jsp (꼭필요한 파라미터는 메인글 idx, 페이지번호 page)
		   //그러므로 댓글 수정 삭제시에 메인글 idx 와 page를 파라미터로 전달해야한다.
	}
	
	//댓글 수정,삭제 - 데이터 전달
	function delSet(qc_idx) {   //idx는 댓글테이블에서 삭제할 기본키 컬럼값
		frm2.qc_idx.value=qc_idx;	
		modal.style.display = "block";   //modal 화면에 보이기
	}
	
	//메인글 삭제 확인
	function deleteOk(){
		var yn= confirm( '글을 삭제하시겠습니까?');
		
		if(yn){   //${bean.idx },${page }
			alert('글 ' + ${bean.q_idx } +'를 삭제합니다.');
			//수정해야 실행됩니다.
			location.href=`q_delete?q_idx=${bean.q_idx }&page=${page }&field=${field }&findText=${findText }`;
		}
	}

</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/q_board.css">  <!-- 상대경로 ../ 한단계 위로 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/q_modal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/top_bottom.css?v=3">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
</head>
<body onload="resetOk()">  <!-- 문서가 생성될때 실행 -->
<header>
<%@ include file="../top.jsp" %>
</header>
<<<<<<< HEAD
<section class="qnaBoard" style="height:120%">
<h3>Q&A 게시판</h3>
=======
<section>
<h3>qna 게시판</h3>
>>>>>>> refs/remotes/origin/master
<hr>
 <table style="width:80%;margin:auto;">
 	<tr><td width="20%" class="td1">제목</td>
 		<td width="40%" class="input1">${bean.content}</td>
 		<td width="20%" class="td1">조회수</td>
 		<td class="input1">${bean.q_cnt}</td>
 	</tr>
 	<tr><td class="td1">작성자</td>
 		<td class="input1">${bean.nick} 
 		<span style="font-size:70%;padding-left: 30px;">(${bean.ip})</span></td>
 		<td class="td1">작성날짜</td>
 		<td class="input1">
 		<%-- <fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm" value="${bean.wdate }" var="wdate"/> --%>
 		<fmt:formatDate value="${bean.q_date }" pattern="yyyy-MM-dd"/>
 		</td>
 	</tr>
 	<tr><td class="td1">내용</td>
 		<td colspan="3" class="input1" style="text-align: left;">
 		<div  style="height: 300px;">
 		<pre>${bean.content }</pre></div></td>   <!-- 엔터,탭,기호 등 텍스트 그대로 출력할 때 사용 -->
 	</tr>
 	<tr><td colspan="4" align="center"><br>
 	<c:if test="${member.nick == bean.nick || member.admin == '1'}">
 	<a class="button" href="q_update?idx=${bean.q_idx }&page=${page}&field=${field }&findText=${findText }">수정</a>
 	<a class="button" onclick="javascript:deleteOk();">삭제</a>
 	</c:if>
 	<a class="button" href="q_list?page=${page }&field=${field }&findText=${findText }">목록</a><br><br><br>
 	</td></tr>
 </table>
 <!-- 메인글 출력 끝 -->
 <!-- 댓글 시작 -->
 <!-- 댓글 입력 -->
<form action="comment?action=insert&page=${page}" method="post" name="frmCmt"><!-- 댓글 입력  , 추가 : 댓글수정과 삭제 -->
 <input type="hidden" name="func" value="1">   <!-- 기본값은 댓글 입력 , 수정:2 ,삭제:3 -->
 <!-- CommentDTO 변수명과 일치하도록 name 속성 설정 그래야 Controller Model객체로 전달됩니다. -->
 <input type="hidden" name="qc_idx" value="0">  <!-- 댓글의 PK(기본키) 컬럼 값 : 댓글 수정을 위해서만 사용 -->
 <input type="hidden" name="q_idx" value="${bean.q_idx}">  <!-- 메인글의 idx -->
 <input type="hidden" name="idx" value="${member.idx}">
 <table style="width:60%;margin: auto;">
 	<tr><td colspan="4">댓글 갯수 : ${bean.qc_cnt }    
 		<input type="button" onclick="window.location.reload()" value="새로고침" class="btn-small">
 		<!--  또는 window.location.reload() :history.go(0)현재페이지로 url 재요청-->
 	</td>
 	</tr>
 	<tr><td colspan="4"><hr></td></tr>
 	<c:if test="${member.admin == '1'}">
 	<!-- 댓글 입력 -->
 	<tr>
 		<td width="25%" >작성자</td><td width="25%">
 		<input type="text" name="nick" value="${member.nick}" class="input1"></td>
 	</tr>
 	<tr>
 		<td colspan="3">  <!-- 크기조절불가 : style="resize: none;" -->
 			<textarea rows="5" cols="80" name="qc_content"  style="resize: none;" placeholder="댓글을 작성하세요." class="input1"></textarea>
 		</td>
 		<td width="15%" style="text-align: left;">
 			<input type="submit" value="저장" class="btn-small">
 			<input type="reset" value="취소" class="btn-small" onclick="resetOk()">
 		</td>
 	</tr>
 	</c:if>
 	<tr><td colspan="4"><hr></td></tr>
 	<!-- 댓글 출력  -->
 	<c:forEach var="cmt" items="${q_commentlist}">
 		<c:set var="q_idx" value="${q_idx}"/>   <!-- 개행문자 저장한 애트리뷰트 가져오기 -->
 		<c:set var="qc_content" value="${fn:replace(cmt.qc_content,q_idx,'<br>')}" />   <!--개행문자를 <br>로 바꾸기  -->
 		<tr>
 			<td colspan="4" style="text-align: left;">
 	<div id="comment">
 			<div>
			 <span class="nick">${cmt.nick}</span>				
 			 <span class="now">

 			 </span>
 			 <span style="float: right;">  <!-- span은 부모영역의 오른쪽으로 정렬  -->
 			 <c:if test="${ member.admin == '1'}">
 			 <c:set value="${pageContext.request.contextPath}/resources/img" var="image" />
 		<!-- updateCmt() :댓글 리스트 중에   선택한 인덱스의 name,content 값을 input의 value 로 합니다.-->
	 			 <a href="javascript:updateCmt('${cmt.qc_idx}','${cmt.nick}','${qc_content}')" style="cursor: pointer;text-decoration: none;">
	 			 	<img src="${image}/pencil.jpg" alt="수정" style="width:20px;">
	 			 </a>
	 	<!-- deleteCmt() : 선택한 글 index값(idx 프로퍼티)을 파라미터로 전달하는 url 요청-->
 			 <a href="javascript:deleteCmt('${cmt.qc_idx}','${page}','${bean.q_idx}')" style="cursor: pointer;text-decoration: none;">
	 			 	<img src="${image}/delete.png" alt="삭제" style="width:20px;">
	 		 </a>
	 		 </c:if>
 			 </span>
 			 </div>
 			 <div style="padding-top: 10px;">  <!-- 댓글 내용 -->
 			 	<pre>${cmt.qc_content}<br></pre> 
 			 <%-- 	${content} --%>
 			 </div>
 	</div>
 			</td>
 		</tr>
 	</c:forEach> 
 </table>
 </form>
 
 <!-- modal : alert,confirm 그리고 추가적인 정보를 받을 때 사용자가 만드는 입력 상자...-->

<div id="myModal" class="modal">
<!-- Modal content : 모달 입력창-->

<div class="modal-content" >
<span class="close">&times;</span><br>  
<div style="padding: 0px 20px;">
<b>댓글 삭제</b><br><br>  <!-- 댓글삭제에 활용 -->
<form action="comment?action=delete" method="post" name="frm2">
<input type="hidden" name="q_idx" value="${bean.q_idx }"> <!-- 현재 detail로 돌아오기 위한 값 전달 -->
<input type="hidden" name="page" value="${page }">
<input type="hidden" name="q_idx" value="0" >
<!-- <input type="hidden" name="func" value="3" > -->
<!-- <input type="password" name="password" size="10" class="input1"> -->
<p> 삭제하시겠습까? <p>
<input type="submit" value="확인" class="btn-small" style="padding: 5px 20px;">
</form>
</div>
</div>
</div>
</section>
<%-- <%@ include file="../bottom.jsp" %> --%>
<script type="text/javascript">
var modal = document.getElementById('myModal');

var span = document.getElementsByClassname("close")[0];
span.onclick = function() {
modal.style.display = "none";	//modal 화면에 안보이기	닫기 기능 구현
}
</script> 
  
 
</body>
</html>









