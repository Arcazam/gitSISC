<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../common/common.jsp" %>
	
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
<form:form commandName="bb" class="container" method="post" action="update.bd">
	<input type="hidden" name="b_num" value="${ bb.b_num }">
	<input type="hidden" name="pageNumber" value="${ pageNumber }">
	<input type="text" name="writer" style="width: 40%;" value="${ mb.id }" readonly><br><br>
<%
	String[] b_cateList = {"Free","Know","QnA","Grad"};
%>
	<select name="b_cate" style="float: right;">
		<option value="">선택하세요</option>
		<c:forEach var="b_cateList" items="<%= b_cateList %>">
			<c:if test="${ b_cateList eq bb.b_cate }">
				<option value="${ b_cateList }" selected>${ b_cateList }</option>
			</c:if>
			<c:if test="${ b_cateList ne bb.b_cate }">
				<option value="${ b_cateList }">${ b_cateList }</option>
			</c:if>
		</c:forEach>
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
		            $(this).val(inputText.substring(0, 100));
		            byteCount = 100;
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
	    maxHeight: null,
	    focus: true, 
	    lang : 'ko-KR'
	});
});

</script>
</html>
    