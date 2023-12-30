<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#BoardDetailTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#BoardDetailTable th {
		background-color: #49CAF2;
		color: black;
	}

</style>

<script>

	function toDelete(num,pageNumber){
		if (confirm(num+'번 레코드를 삭제하시겠습니까?')) {
			location.href="boardDelete.mag?b_num="+num+"&pageNumber="+pageNumber;
		} else {
			return;
		}
	}
	
	function toMainList(b_cate,pageNumber){
		location.href="boardList.mag?pageNumber="+pageNumber+"&b_cate="+b_cate;
	}

</script>

<table id="BoardDetailTable" border=1>

	<tr>
		<th colspan=4>게시판 카테고리 : ${ bb.b_cate }</th>
	</tr>
	<tr align=center>
		<th>글번호</th>
		<td>${ bb.b_num }</td>
		<th>조회수</th>
		<td>${ bb.readcount }</td>
	</tr>
	<tr align=center>
		<th>작성자</th>
		<td>${ bb.writer }</td>
		<th>작성일</th>
		<td>
			<fmt:formatDate value="${bb.reg_date}" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr>
		<th>글 제목</th>
		<td colspan=3>${ bb.subject }</td>
	</tr>
	<tr>
		<th>글 내용</th>
		<td colspan=3>${ bb.content }</td>
	</tr>
	<tr>
		<th>태그</th>
		<td colspan=3>${ bb.taglist }</td>
	</tr>
	<tr>
		<th colspan=4>
			<input type="button" value="글 삭제" onClick="toDelete(${ bb.b_num },${pageNumber})">
			<input type="button" value="글 목록" onClick="toMainList('${ bb.b_cate }',${pageNumber})">
		</th>
	</tr>

</table>