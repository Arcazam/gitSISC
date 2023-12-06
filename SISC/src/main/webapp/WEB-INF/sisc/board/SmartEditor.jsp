<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <!-- jQuery 라이브러리 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/smarteditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<body>
	<h3>게시판</h3>
	<form action="editor2.pd" method="post">
		<div id="smarteditor">
			<textarea name=txt id="txt" rows="20" cols="10"
				placeholder="내용을 입력해주세요" style="width: 600px"></textarea>
		</div>
		<input type="button" value="저장" onclick="submitPost()" />
	</form>
</body>

<script>
    let oEditors = []

    smartEditor = function() {
      console.log("Naver SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "txt",
        sSkinURI: "<%=request.getContextPath()%>/resources/smarteditor/SmartEditor2Skin.html", fCreator : "createSEditor2"
				})
	}

	// 문서가 로드된 후 실행되도록 jQuery의 ready 함수 사용
	$(document).ready(function() {
		smartEditor();
	});

	submitPost = function() {
		oEditors.getById["txt"].exec("UPDATE_CONTENTS_FIELD", []);
		let content = document.getElementById("txt").value;

		if (content == '<p>&nbsp;</p>') {
			alert("내용을 입력해주세요.");
			oEditors.getById["txt"].exec("FOCUS");
			return;
		} else {
			alert(1)
			location.href = "editor2.pd?txt="+document.getElementById("txt").value;
		}
	}
</script>
 --%>

<!DOCTYPE html>
<html lang="ko">
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
  <!--  -->
  
</head>
<body>
<br><br>
<div class="container"> 
	<input type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br><br>
	<input type="text" name="title" style="width: 40%;" placeholder="제목"/><br><br>
</div>
<div class="container">
  <textarea class="summernote" name="editordata"></textarea>    
</div>
<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
	
</script>
</body>
</html>
  