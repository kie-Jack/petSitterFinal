<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gugi&display=swap');
</style>
<link rel="stylesheet" href="./resources/css/join.css" > 
</head>
<%@ include file="../top.jsp" %>
<body>
<div >
	<form action="join" name="frmReg" method="post"
		onsubmit="return validCheck()" onclick="execPostCode()">
		<input type="hidden" name="save">
		<table>
			<tr><th>회원가입<th><tr>
			<tr><th>이름</th>
	 			<td> <input type="text"  name="name" ></td>
		 	</tr>
		 	<tr>
				<th>아이디</th>
		 		<td><input type="text" id = "id" name="id" required oninput = "checkId()" /> 
				<span class="id_ok">사용 가능한 아이디입니다.</span>
				<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span></td>
			</tr>

		 	<tr><th>비밀번호</th>
		 		<td><input type="password" name="password">(8자리 이상 입력해주세요)</td>
		 	</tr>
		 	<tr>
		 		<th>닉네임</th> 
		 		<td><input type="text" id = "nick" name="nick" required oninput = "checkNick()" /> 
				<span class="nick_ok">사용 가능한 닉네임입니다.</span>
				<span class="nick_already">누군가 이 닉네임을 사용하고 있어요.</span></td>
		 	</tr>
			 <tr>
				<th>성별</th>
				<td><input type="radio" value="남자" name="gender" checked>남자
					<input type="radio" value="여자" name="gender">여자</td>
			</tr>
		 	<tr><th>생년월일</th>
				<td><input type="date" name="birth"></td>
			</tr>
			<tr><th>전화번호</th>
				<td><input type="tel" value="${join.to}" name="tel">(ㅡ 없이 입력해주세요)</td>
			</tr>
				<tr><th>기본주소</th>
				<td> <input class="form-control" style="top: 5px;" name="m_addr" id="m_addr" type="text">
				  <input type="button" class="btn btn-primary btn-sm" value="주소찾기" onclick="sample6_execDaumPostcode()"></td>
			</tr>
			<tr><th>상세주소</th>
				<td><input type="text" name="s_addr">(동/호)</td>
			</tr>
			<tr><th>포인트</th>
				<td><input type="number" value="0" name="point" readonly ></td>
			</tr>
			<tr><th>팻시터 지원여부</th>
				<td><input type="radio" value="지원" name="p_auth">지원
					<input type="radio" value="미지원" name="p_auth" checked>미지원</td>
			</tr>
			<tr><th>자격증 여부</th>
					<!-- <td><input type="radio" value="o"  name="license">있음
					<input type="radio" value="x" name="license" checked>없음</td> -->
					<td><input type="text" value="x" name="license"></td>
			</tr>
			<tr><th>근무가능 일수(펫시터 지원시 입력)</th>
				<td><input type="number" value=0 name="work_date"></td>
			</tr>
			<tr><th>거주형태(펫시터 지원시 입력)</th>
				<td><select name="home" id="home_select">
						<option value="">선택없음</option>
						<option value="빌라">빌라</option>
						<option value="아파트">아파트</option>
						<option value="단독주택">단독주택</option>
						<option value="기타">기타</option>
				</select> 
				<span id="home_id">
				<input type="text" name="home_etc" disabled="disabled" 
						placeholder="기타" >
				</span></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center">
				<input type="submit" value="가입하기"> 
				<input type="reset" value="다시쓰기"></td>   
			</tr>
		</table>		
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"> 
    function checkId(){
        var id = $('#id').val(); 
        $.ajax({
            url:'IdCheck/' + id, 
            type:'get', 
            dataType : 'json',
            success:function(xhr){
            	if(xhr.data){ 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_ok').css("color","#6A82FB"); 
                    $('.id_already').css("display", "none");
                } else { 
                    $('.id_already').css("display","inline-block");
                    $('.id_already').css("color","#ff0000"); 
                    $('.id_ok').css("display", "none");
                }
            },
        });
    };
    function checkNick(){
        var nick = $('#nick').val(); 
        $.ajax({
            url:'NickCheck/' + nick, 
            type:'get', 
            dataType : 'json',
            success:function(xhr){
            	if(xhr.data){ 
                    $('.nick_ok').css("display","inline-block"); 
                    $('.nick_ok').css("color","#6A82FB"); 
                    $('.nick_already').css("display", "none");
                } else { 
                    $('.nick_already').css("display","inline-block");
                    $('.nick_already').css("color","#ff0000"); 
                    $('.nick_ok').css("display", "none");
                }
            },
        });
    };
</script>
<script>
function validCheck() {
	const frm = document.frmReg;
if (frm.name.value == "") {
    alert("이름을 입력하지 않았습니다.")
    frm.name.focus();
    return false;
}
if(frm.name.value.length<2){
    alert("이름을 2자 이상 입력해주십시오.")
    frm.name.focus();
    return false;
}
if (frm.id.value == "") {
    alert("아이디를 입력하지 않았습니다.")
    frm.id.focus();
    return false;
}
if (frm.password.value == "") {
     alert("비밀번호를 입력하지 않았습니다.")
     frm.password.focus();
     return false;
}
if (frm.password.value.length < 8){
	alert('패스워드는 8글자 이상으로 하세요.');
	frm.password.focus();				// 포커스(커서) 이동 
	return false;						//함수가 종료.
}
if (frm.nick.value == "") {
    alert("닉네임을 입력하지 않았습니다.")
    frm.nick.focus();
    return false;
	}
if (frm.tel.value == "") {
    alert("전화번호를 입력하지 않았습니다.")
    frm.tel.focus();
    return false;
}
if (frm.m_addr.value == "") {
    alert("주소를 입력하지 않았습니다.")
    frm.m_addr.focus();
    return false;
}
if (frm.s_addr.value == "") {
    alert("주소를 입력하지 않았습니다.")
    frm.s_addr.focus();
    return false;
}
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
new daum.Postcode(
{
    oncomplete : function(data) {
       var fullAddr = ''; 
       var extraAddr = '';
       if (data.userSelectedType === 'R') { 
           fullAddr = data.roadAddress;
        } else { 
            fullAddr = data.jibunAddress;
        }
        if (data.userSelectedType === 'R') {
        if (data.bname !== '') {
                 extraAddr += data.bname;
            }
          if (data.buildingName !== '') {
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
        }
        document.getElementById('m_addr').value = fullAddr;
        document.getElementById('s_addr').focus();
    }
}).open();
}
</script>
<script type="text/javascript">
document.getElementById("home_select").addEventListener("change",function(){
	if(this.value=="기타"){ 
		document.frmReg.home_etc.disabled=false;
	}else {
		document.frmReg.home_etc.disabled=true;
	}
	
});
</script>

</html>