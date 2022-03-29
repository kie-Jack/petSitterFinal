<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<!-- 스타일 참고  -->
<link rel="stylesheet"
	href="./resources/css/mupdate.css">
<%@ include file="../top.jsp" %>
</head>
<body>
		<form action="update" name="frmReg" method="post"
			onsubmit="return validCheck()">
			<!--브라우저에 출력은 안되고 파라미터로 필요한값은 type을 hidden으로 한다. -->
			<table class="updateTable">
				<tr>
				<td><label>회원 정보 수정</label><td>
			<input type="hidden" name="idx" value="${member.idx}" >  
				</tr>  <!-- 이메일 , 지역 -->
				<tr>
					<td><label>이름</label></td>

					<td><input type="text" name="name" placeholder="이름 이력(필수)" value="${member.name }"
						readonly></td>   	<!--  readonly : 읽기만.입력못합니다.-->
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" name="password" value="${member.password }"></td>
				</tr>
				<tr>
					<td><label>전화번호</label></td>
					<td><input type="text" name="tel" value="${member.tel }"></td>
				</tr>
				<tr>
					<td><label>기본주소</label></td>
					<td><input type="text" name="m_addr" min="10" max="99" value="${member.m_addr }"></td>
				</tr>
				<tr>
					<td><label>상세주소</label></td>
					<td><input type="text" name="s_addr"min="10" max="99" value="${member.s_addr }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
					<input type="submit" value="수정하기"> 
					<input type="button" value="탈퇴하기" onclick="deleteOk()">
					<input type="button" value="회원정보" onclick="location.href='detail'"></td>
				</tr>
			</table>
		</form>
	<div id="myModal" class="modal">
			<span class="close">&times;</span><br>
			<div style="padding: 0px 20px; color:red;" >
				<b>비밀번호</b><br>
				<br>
				<form action="delete" method="post" name="frmPassword"
						onsubmit="return deleteSet()">
					<input type="hidden" name="idx" value="${member.idx }"> <!--삭제할 글번호-->
					<input type="password" name="password" size="10">
					<input type="submit" value="확인" style="padding: 5px 20px;">
					<br>
					<span style="color:red;font-size:0.8em;" id="err"></span>
				</form>
			</div>
	</div>
	<c:if test="${alert != null }">
		<script type="text/javascript">
		alert('고객 정보가 수정되었습니다.!');
	</script>
	</c:if>
	<script>
	var modal = document.getElementById('myModal');
	var span = document.getElementsByClassName("close")[0];

	span.onclick = function() {   //span 요소의 onclick 속성값에 해당하는 함수를 설정합니다.
		modal.style.display = "none";   //modal 화면에 안보이기   닫기 기능 구현
	}

	function deleteSet() {
		const yn = confirm('[주의]등록된 고객에서 삭제하시겠습니까 ?');
		if(yn){
			//비밀번호 입력되었는지확인.
			if(document.frmPassword.password.value==""){
				document.getElementById('err').innerHTML = "비밀번호를 입력하세요.";
				return false;
			} else {  	return true; 	}
			
		}else {
			modal.style.display = "none"; 
			return false;
		}
	}
	function deleteOk(){
		document.getElementById('myModal').style.display='block';		
	}
</script>
</body>
<%@ include file="../bottom.jsp" %>
</html>