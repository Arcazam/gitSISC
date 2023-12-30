<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath() %>/resources/css/studyUupdate.css" rel="stylesheet" type="text/css" />

<%@include file = "./../common/common.jsp" %>
<%@ include file="../top&bottom/top.jsp"%>  

<style>
	.detailTable{
		width: 60%;
		height: 600px;
		margin: auto;
		margin-top: 50px;
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

<c:set var="st" value="${sb }"/>
<form action="update.st?s_num=${st.s_num }&pageNumber=${pageNumber}" method="post">
	<table border="1" class="detailTable">
	<tr>
		<td height="50px;">
			<select name="memoCate" style="float: left;" class="pl">
				<c:set var="cates" value="${fn:split('선택하세요,Java,Jsp,Js,Html,Css,Servlet,Spring',',')}"></c:set>
				<c:forEach var="mecates" items="${cates }">
					<option value="${mecates }" <c:if test = "${st.memoCate eq mecates}">selected</c:if>>${mecates }</option>
				</c:forEach>
			</select>
		</td>
		<td align="right" height="50px;" class="date">${st.memoDate }</td>
	</tr>
	<tr>
		<td colspan="2">
			<label>
				<input type="text" class ="main_input" name="memoTitle" style="font-size: 25px;" value="${st.memoTitle }">
				<span></span>
			</label><br>
			<label>
				<input type="text" class ="sub_input" required name = "subTitle" style="font-size: 15px; color: gray;" value="${st.subTitle }">
			</label>
		</td>
	</tr>
	<tr>
		<td height="450px;" colspan="2">
			<textarea class="summernote" name="s_content">${st.s_content }</textarea>
		</td>
	</tr>
	<tr align="center">
    <td height="100px;" colspan="2">
        <button class="learn-more" type="submit">
            <span class="circle" aria-hidden="true">
                <span class="icon arrow"></span>
            </span>
            <span class="button-text">수정하기</span>
        </button>
    </td>
</tr>
</table>
</form>

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