<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<link href="<%=request.getContextPath() %>/resources/css/btn.css" rel="stylesheet" type="text/css" />

<%@ include file="../top&bottom/top.jsp"%>  

<style>
.sbtn{
	background-color: #3D4C53;
	color: white; 
	border: none; 
	margin-top: 8px;
}	

</style>

<head>
  <title>SummerNoteExample</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
</head>

<body>
<br><br>
<form class="container" method="post" action="insert.bd">
	<input type="text" name="writer" style="width: 40%;" placeholder="작성자"/><br><br> <!-- member의 id값과 같아야함 -->
	<select name="b_cate" style="float: right;">
		<c:set var="cates" value="${fn:split('선택하세요,자유,지식,Q&A,수료생',',')}"></c:set>
		<c:forEach var="bdcates" items="${cates }">
			<option value="${bdcates }">${bdcates }</option>
		</c:forEach>
	</select>
	<br><br>
	<input type="text" name="subject" style="width: 40%;" placeholder="제목"/><br><br>
	<textarea class="summernote" name="content"></textarea> 
	<br><br>
	<input type="submit" value="저장하기" class="studysave">
</form>
</body>
<script>
$(document).ready(function() {
	$('.summernote').summernote({
 		placeholder: '내용',
	    minHeight: 370,
	    maxHeight: null,
	    focus: true, 
	    lang : 'ko-KR'
	});
});

</script>
</html>
