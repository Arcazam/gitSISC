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
</head>

<body>
<br><br>
<form:form commandName="bb" class="container" method="post" action="insert.bd">
	<input type="hidden" name="board" value="${board }">
	<input type="text" name="writer" style="width: 40%;" value="${ mb.id }" readonly><br><br> 
	<select name="b_cate" style="float: right;">   
	    <option value="">선택하세요</option>
	    <option value="Free" <c:if test="${ board == 'Free'}">selected</c:if>>자유</option>
	    <option value="Know" <c:if test="${ board == 'Know'}">selected</c:if>>지식</option>
	    <option value="QnA" <c:if test="${ board == 'QnA'}">selected</c:if>>QnA</option>
	    <option value="Grad" <c:if test="${ board == 'Grad'}">selected</c:if>>수료생</option>
	</select>

	<br><br>
	<input type="text" name="subject" style="width: 40%;" value="${ bb.subject }" placeholder="제목"/>
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
	<textarea class="summernote" name="content">${ bb.content }</textarea> 
	<br><br>
	<input type="submit" value="저장하기" class="studysave" onClick="return insertBoardcheck()">
</form:form>
</body>
<script>
$(document).ready(function() {
	  $('.summernote').summernote({
	    placeholder: '내용',
	    minHeight: 370,
	    maxHeight: 1000,
	    focus: true,
	    lang: 'ko-KR',
	    callbacks: {
	      onImageUpload: function(files) {
	        // 이미지 업로드 콜백
	        for (var i = 0; i < files.length; i++) {
	          uploadImage(files[i]);
	        }
	      }
	    }
	  });
	});

	function uploadImage(file) {
	  var reader = new FileReader();
	  reader.onloadend = function() {
	    var img = new Image();
	    img.src = reader.result;
	    img.onload = function() {
	      var maxWidth = 600; // 이미지 최대 폭
	      var maxHeight = 400; // 이미지 최대 높이

	      var ratio = 1; // 비율 초기화
	      if (img.width > maxWidth) {
	        ratio = maxWidth / img.width; // 너비에 따른 비율 계산
	      } else if (img.height > maxHeight) {
	        ratio = maxHeight / img.height; // 높이에 따른 비율 계산
	      }

	      // 새로운 크기 계산
	      var newWidth = img.width * ratio / 3;
	      var newHeight = img.height * ratio / 3;

	      var canvas = document.createElement('canvas');
	      var ctx = canvas.getContext('2d');
	      canvas.width = newWidth;
	      canvas.height = newHeight;
	      ctx.drawImage(img, 0, 0, newWidth, newHeight);

	      var dataURL = canvas.toDataURL('image/jpeg');

	      // Summernote에 이미지 삽입
	      $('.summernote').summernote('editor.insertImage', dataURL);
	    };
	  };
	  reader.readAsDataURL(file);
	}

</script>
</html>