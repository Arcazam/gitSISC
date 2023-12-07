<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "./../common/common.jsp" %>
<%@ include file="../top&bottom/top.jsp"%>  

<style>
	.detailTable{
		width: 60%;
		height: 700px;
		margin: auto;
		margin-top: 50px;
	}
</style>

<c:set var="st" value="${sb }"/>
<table border="1" class="detailTable">
	<tr>
		<td height="50px;">
			${st.memoCate }
		</td>
		<td align="right" height="50px;">${st.memoDate }</td>
	</tr>
	<tr>
		<td colspan="2">${st.memoTitle }</td>
	</tr>
	<tr>
		<td height="50px;" colspan="2">${st.subTitle }</td>
	</tr>
	<tr>
		<td height="450px;" colspan="2">${st.s_content }</td>
	</tr>
	<tr align="center">
		<td height="50px;" colspan="2"><a href = "update.st?s_num=${st.s_num }&pageNumber=${pageNumber}"">수정</a> | <a href = "delete.st?s_num=${st.s_num }&pageNumber=${pageNumber}">삭제</a></td>
	</tr>
</table>