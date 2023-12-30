<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#QuizDetailTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#QuizDetailTable th {
		background-color: #49CAF2;
		color: black;
	}

</style>

<script>

	function toUpdate(qz_num,pageNumber){
		if (confirm(qz_num+'번 레코드를 수정하시겠습니까?')) {
			location.href="quizUpdate.mag?qz_num="+qz_num+"&pageNumber="+pageNumber;
		} else {
			return;
		}
	}

	function toDelete(qz_num,pageNumber){
		if (confirm(qz_num+'번 레코드를 삭제하시겠습니까?')) {
			location.href="quizDelete.mag?qz_num="+qz_num+"&pageNumber="+pageNumber;
		} else {
			return;
		}
	}
	
	function toMainList(que_cate,pageNumber){
		location.href="quizList.mag?pageNumber="+pageNumber+"&que_cate="+que_cate;
	}

</script>

<table id="QuizDetailTable" border=1>

	<tr>
		<th colspan=2>퀴즈 카테고리 : ${ qb.que_cate }</th>
	</tr>
	<tr align=center>
		<th>퀴즈번호</th>
		<td>${ qb.qz_num }</td>
	</tr>
	<tr align=center>
		<th>질문</th>
		<td>${ qb.question }</td>
	</tr>
	<tr>
		<th>보기</th>
		<td>${ qb.qz_view }</td>
	</tr>
	<tr>
		<th>답</th>
		<td>${ qb.answer }</td>
	</tr>
	<tr>
		<th>해설</th>
		<td>${ qb.interpre }</td>
	</tr>
	<tr>
		<th colspan=2 align=right>
			<input type="button" value="퀴즈 수정" onClick="toUpdate(${ qb.qz_num },${pageNumber})">
			<input type="button" value="퀴즈 삭제" onClick="toDelete(${ qb.qz_num },${pageNumber})">
			<input type="button" value="퀴즈 목록" onClick="toMainList('${ qb.que_cate }',${pageNumber})">
		</th>
	</tr>

</table>