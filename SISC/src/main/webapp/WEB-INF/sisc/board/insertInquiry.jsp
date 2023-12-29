<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">

<link href="<%=request.getContextPath() %>/resources/css/btn.css" rel="stylesheet" type="text/css" />

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<style>
.sbtn{
	background-color: #3D4C53;
	color: white; 
	border: none; 
	margin-top: 8px;
}	

</style>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
<script>

	function insertBoardcheck(){
		
		if($('input[name="writer"]').val() == ""){
			alert('작성자가 누락되었습니다');
			$('input[name="writer"]').focus();
			return false;
		}
		
		if ($('select option:selected').val() == "") {
			alert('게시판 카테고리를 선택하셔야합니다');
			return false;
		}
		
		if($('input[name="subject"]').val() == ""){
			alert('제목이 누락되었습니다');
			$('input[name="subject"]').focus();
			return false;
		}
		
		if($('input[name="content"]').val() == ""){
			alert('내용이 누락되었습니다');
			$('input[name="content"]').focus();
			return false;
		}
		
	}

</script>

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
  <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/kfonts2.css" rel="stylesheet">
</head>

<body>
<br><br>
<div style="margin-left: 200px;">
	<form:form commandName="bb" class="container" method="post" action="insertInquiry.bd">
	<input type="hidden" name="board" value="${board }">
	<input type="text" name="subject" style="width: 80%; height: 40px; margin-top: 20px;" value="${ bb.subject }" placeholder="문의 제목"/>
	<div id="charCount">(100/0)</div><br><br>
	 <script>
	 $(document).ready(function () {
		    // 텍스트 입력란에 입력이 발생할 때마다 바이트 수 업데이트
		    $('input[name="subject"]').on('input', function () {
		        var inputText = $(this).val();
		        var byteCount = countBytes(inputText);

		        if (byteCount > 100) {
		            // 100자를 초과하면 메시지를 표시하고 글자를 100자로 제한
		            $('#charCount').text('글자수 제한을 초과하셨습니다').css('color', 'red');
//		            $(this).val(inputText.substring(0, 100));
//		            byteCount = 100;
		        } else {
		            // 100자 이하인 경우에는 정상적으로 글자 수를 표시
		            $('#charCount').text('(100/' + byteCount + ')').css('color', 'black');
		        }
		    });

		    // 문자열의 바이트 수를 계산하는 함수
		    function countBytes(text) {
		        var totalCount = 0;
		        for (var i = 0; i < text.length; i++) {
		            var charCode = text.charCodeAt(i);
		            totalCount += (charCode < 128) ? 1 : 3; // ASCII 문자는 1바이트, 나머지는 3바이트로 계산
		        }
		        return totalCount;
		    }
		});
    </script>
	<textarea name="content" rows="20" cols="130" placeholder="문의 내용">${ bb.content }</textarea> 
	<br>
	<br><br>
	<input type="submit" id="sub" value="저장하기" class="studysave" onClick="return insertBoardcheck()" style="margin-right: 215px;">
</form:form>
</div>
</body>
</html>