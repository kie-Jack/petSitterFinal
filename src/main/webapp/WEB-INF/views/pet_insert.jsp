<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 정보 입력</title>
<link rel= "stylesheet" href="resources/css/petinsert.css?v=3">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">

</head>
<body>
	<h1 style= "color: #aabb97;">펫 정보 입력</h1>
	<form name = "petinsert" method="post" action="petinsert">
		<script>
			function submit2(frm) {
				frm.action="petinsertMulti"
				frm.value="${member.idx}"
				frm.submit();
				return true;
			}
			
		</script>
		<input type="hidden" name="idx" value="${member.idx}">	<!-- 세션의 idx값 action으로 넘겨주기 -->
		<table>
			<br><br><br><br><br><br>
			<tr>
				<th>이름</th>
				<td><input type="text" name="p_name" placeholder="예) 멍뭉이" required ></td>
				
			</tr>
			<tr>
				<th>견종</th>
				<td><input type="text" name="pet" placeholder="예) 웰시 코기" required></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<label for="female" class="l-radio">
				<input type="radio" name="p_gender" value="female" id="female" checked="checked">
				<span>여자아이</span>
				</label>
				
				<label for="male" class="l-radio">
				<input type="radio" name="p_gender" value="male" id="male">
				<span>남자아이</span>
				</label>
				</td>
			</tr>
			<tr>
				<th>몸무게</th>
				<td><input type="text" name="p_weight" id="p_weight" placeholder="예) 3.2" required>kg</td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="p_birth" id="p_birth" value="2021-01-01" required></td>
			</tr>	
			<tr>	
				<th>중성화</th>
				<td>
				<label for="neu_y" class="l-radio">
				<input type="radio" name="p_neu" value ="neu" id="neu_y" checked="checked">
				<span>했어요</span>
				</label>
				<label for="neu_n" class="l-radio">
				<input type="radio" name="p_neu" value ="noneu" id="neu_n">
				<span>안했어요</span>
				</label>
				</td>
			</tr>
			<tr>
				<td align="center">
				</td>
			<tr>
				<td colspan="2" align="center">																
				<button type="button" value="뒤로가기" class="b_btn" style="vertical-align:middle" onclick="location.href='home'"><span>뒤로가기</span></button>
				<button type="button" value="추가입력" class="btn" onclick="return submit2(this.form);" style="vertical-align:middle"><span>추가입력</span></button>
				<button type="submit" value="완료" class="btn" style="vertical-align:middle"><span>완료(제출)</span></button>
			</tr>			
		</table>
	</form>
</body>
</html>