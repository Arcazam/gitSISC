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
<form class="container" method="post" action="insert.st">
	<input type="text" name="s_writer" style="width: 20%;" placeholder="작성자"/>
	<select name="memoCate" style="float: right;">
		<option value="Java">Java</option>
		<option value="Jsp">Jsp</option>
		<option value="Js(J QUERY)">Js</option>
		<option value="Html">Html</option>
		<option value="Css">Css</option>
		<option value="Servlet">Servlet</option>
		<option value="Spring">Spring</option>
	</select>
	<br><br>
	<input type="text" name="memoTitle" style="width: 40%;" placeholder="제목"/><br><br>
	<input type="text" name="subTitle" style="width: 40%;" placeholder="소제목"/><br><br>
	<textarea class="summernote" name="s_content"></textarea> 
	<br><br>
	<div id="holder">
		<div class="button">
		    <input type="submit" value="저장하기" class = "sbtn">
		    <div class="btnTwo">
		      <p class="btnText2">GO!</p>
		    </div>
		</div>
	</div>
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
