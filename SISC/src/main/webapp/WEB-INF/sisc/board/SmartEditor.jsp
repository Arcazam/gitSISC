<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jQuery 라이브러리 추가 -->
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
