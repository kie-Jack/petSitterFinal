<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point 충전</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ include file="../top.jsp" %>
<link rel="stylesheet" href="./resources/css/point.css?v=3">
</head>
<body>
 	<form action="updatepoint" name="frmReg" method="post" onsubmit="return check_submit();">
 			<h4>포인트 충전</h4>
			<input type="hidden" name="idx" value="${member.idx}" >  
			
			<table class="pointCharge">
 			<tr><td>>현재 보유 포인트 : <c:set var="price" value="${member.point }"/>
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원</td></tr>
 			<tr><td>충전 금액 : 
 			<select name="point">
   			<option value="">== 금액 선택 ==</option>
    		<option value="50000">
    		<c:set var="price" value="50000"/>
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
   			<option value="100000">
    		<c:set var="price" value="100000"/>
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
    		<option value="150000">			
    		<c:set var="price" value="150000"/>
    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
    		<option value="200000">			
    		<c:set var="price" value="200000"/>
    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
    		<option value="250000">			
    		<c:set var="price" value="250000"/>
    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
    		<option value="300000">			
    		<c:set var="price" value="300000"/>
    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
    		<option value="350000">			
    		<c:set var="price" value="350000"/>
    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
    		<option value="400000">			
    		<c:set var="price" value="400000"/>
    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
    		<option value="450000">			
    		<c:set var="price" value="450000"/>
    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
    		<option value="500000">			
    		<c:set var="price" value="500000"/>
    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
			</option>
  		</select>
  		</td>
			<tr>
			<td>
			 <p style="color: #ac2925; margin-top: 30px">
			 최소 충전금액은 50,000원이며
			 <br>최대 충전금액은 500,000원 입니다.
			 </p>
			 </td>
 		</tr>
 		<tr>
 		<td colspan="2" align="center" >
 		<input type="submit" value="결제하기" >
 		<input type="button" value="뒤로가기" onclick="location.href='home'">
 	</td>
 	</tr>
 	</table>
 </form>
 <div>
<br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</body>
 <%@ include file="../footer.jsp" %>
 
<script>
	function handleOnChange(e) {
	  // 선택된 데이터 가져오기
	  const value = e.value;
	  
	  // 데이터 출력
	  document.getElementById('result').innerText
	    = value;
	}
</script>
	<script type="text/javascript">
	function check_submit(){
	 	if(frmReg.point.value ==""){
	 		alert("금액을 선택해주세요.");
	 		frmReg.point.focus();
	 		return false;
	 	}else{
	 		alert("포인트가 충전되었습니다.")
	 	}
		}
	</script>
</html>