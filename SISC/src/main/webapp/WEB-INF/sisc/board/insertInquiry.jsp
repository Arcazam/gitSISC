<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">

<link href="<%=request.getContextPath() %>/resources/css/btn.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/main2.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/forms.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/tabs.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/ui-css.css" rel="stylesheet" type="text/css" />

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

.input-group-prepend {
    margin-right: -1px;
    width: 2000px;
}

.row {
    width: 900px;
}

textarea.form-control {
    height: auto;
    width: 730;
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

<div class="container" style="margin-left: 400px;">
    <div class="body-container">
        <strong><h3>문의하기 </h3></strong>
        <div class="body-main">
            <form method="post" action="insertInquiry.bd">
        	<input type="hidden" name="board" value="${board }">
                <div class="row" style="margin-top: 20px; margin-bottom: 20px; border-top: 2px solid black;">
                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <label class="col-sm-2 col-form-label"><span style="color: red;">* </span>제목</label>
                        <div class="col-sm-3 pe-1">
                            <input type="text" class="form-control" name="subject" value="${bb.subject }" placeholder="문의 제목" style="width: 730px;"/>
                        </div>
                    </div>
                </div>
                
                <div class="row" style = "border-top: 1px solid black;">
                    <div class="input-group-prepend" style="margin-top: 20px;">
                        <label class="col-sm-2 col-form-label"><span style="color: red;">* </span> 내용</label>
                        <div class="col-sm-3 pe-1">
                            <textarea class="form-control" name="content" rows="20" cols="130" placeholder="문의 내용">${ bb.content }</textarea> 
                        </div>
                    </div>
                </div>
                <input type="submit" id="sub" value="저장하기" class="studysave" onClick="return insertBoardcheck()" style="margin-right: 225px; margin-top: 30px;">
            </form>
        </div>
    </div>
</div>
