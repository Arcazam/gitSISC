<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			alert('�ۼ��ڰ� �����Ǿ����ϴ�');
			$('input[name="writer"]').focus();
			return false;
		}
		
		if ($('select option:selected').val() == "") {
			alert('�Խ��� ī�װ��� �����ϼž��մϴ�');
			return false;
		}
		
		if($('input[name="subject"]').val() == ""){
			alert('������ �����Ǿ����ϴ�');
			$('input[name="subject"]').focus();
			return false;
		}
		
		if($('input[name="content"]').val() == ""){
			alert('������ �����Ǿ����ϴ�');
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
  
  <!-- ���ӳ�Ʈ�� ���� �߰��ؾ��� �κ� -->
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
		<option value="">�����ϼ���</option>
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
	<input type="text" name="subject" style="width: 40%;" value="${ bb.subject }" placeholder="����"/>
	<div id="charCount">(100/0)</div><br><br>
	 <script>
	 $(document).ready(function () {
		    // �ؽ�Ʈ �Է¶��� �Է��� �߻��� ������ ����Ʈ �� ������Ʈ
		    $('input[name="subject"]').on('input', function () {
		        var inputText = $(this).val();
		        var byteCount = countBytes(inputText);

		        if (byteCount > 100) {
		            // 100�ڸ� �ʰ��ϸ� �޽����� ǥ���ϰ� ���ڸ� 100�ڷ� ����
		            $('#charCount').text('���ڼ� ������ �ʰ��ϼ̽��ϴ�').css('color', 'red');
		            $(this).val(inputText.substring(0, 100));
		            byteCount = 100;
		        } else {
		            // 100�� ������ ��쿡�� ���������� ���� ���� ǥ��
		            $('#charCount').text('(100/' + byteCount + ')').css('color', 'black');
		        }
		    });

		    // ���ڿ��� ����Ʈ ���� ����ϴ� �Լ�
		    function countBytes(text) {
		        var totalCount = 0;
		        for (var i = 0; i < text.length; i++) {
		            var charCode = text.charCodeAt(i);
		            totalCount += (charCode < 128) ? 1 : 3; // ASCII ���ڴ� 1����Ʈ, �������� 3����Ʈ�� ���
		        }
		        return totalCount;
		    }
		});
    </script>
	<textarea class="summernote" name="content">${ bb.content }</textarea> 
	<br><br>
	<input type="submit" value="�����ϱ�" class="studysave" onClick="return insertBoardcheck()">
</form:form>
</body>
<script>
$(document).ready(function() {
	$('.summernote').summernote({
 		placeholder: '����',
	    minHeight: 370,
	    maxHeight: null,
	    focus: true, 
	    lang : 'ko-KR'
	});
});

</script>
</html>
    