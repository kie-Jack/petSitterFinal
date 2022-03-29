<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 커뮤니티</title>
<script type="text/javascript">
function post_data() {
	frm1.submit();
}
</script>
 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rate.css?v=3">
</head>
<body>
<section>
<%@ include file="../top.jsp" %>
<!-- <h3>동아리 커뮤니티 글 수정</h3> -->
<!-- <hr> -->
<form name="frm1" method="post" action="rbupdate?page=${page }">
 <input type="hidden" name="r_idx" value="${bean.r_idx}">
  <input type="hidden" name="page" value="${page}">
  <input type="hidden" name="field" value=${field }>
 <input type="hidden" name="findText" value=${findText }>
 <table>
 	<tr><th width="35%">제목</th>
 		<td><input type="text" name="title" value="${bean.title}" size="50" required></td>
 	</tr>
 	<tr><th>작성자</th>
 		<td><input type="text" name="name" size="50" value="${bean.nick}" disabled></td>
 	</tr>
 	<tr><th>평점</th>
 	<td>
     	<div class="star-rating">
      <div class="star-rating__wrap">
        <input class="star-rating__input" id="star-rating-5" type="radio" name="rate" value="5" <c:if test="${bean.rate == 5 }">checked</c:if>>
        
        <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-5" ></label>
        <input class="star-rating__input" id="star-rating-4" type="radio" name="rate" value="4" <c:if test="${bean.rate == 4 }">checked</c:if>>
        <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-4" ></label>
        <input class="star-rating__input" id="star-rating-3" type="radio" name="rate" value="3" <c:if test="${bean.rate == 3 }">checked</c:if>>
        <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-3" ></label>
        <input class="star-rating__input" id="star-rating-2" type="radio" name="rate" value="2" <c:if test="${bean.rate == 2 }">checked</c:if>>
        <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-2" ></label>
        <input class="star-rating__input" id="star-rating-1" type="radio" name="rate" value="1" <c:if test="${bean.rate == 1 }">checked</c:if>>
        <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-1" ></label>
      </div>
    </div>
 	<tr><th>내용</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea  rows="20" cols="80" name="content" required>${bean.content}</textarea></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btn">
 	<input type="reset"  value="다시쓰기" class="btn">
 	<input type="button" value="목록" class="btn" onclick="location.href='rblist.do?page=${page}&field=${field}$findText=${findText}'">
 	</td></tr>
 </table>
 </form>
 </section>
</body>
</html>