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
<form action="update.st?s_num=${st.s_num }&pageNumber=${pageNumber}" method="post">
	<table border="1" class="detailTable">
	<tr>
		<td height="50px;">
			<select name="memoCate" style="float: right;">
				<c:set var="cates" value="${fn:split('선택하세요,Java,Jsp,Js,Html,Css,Servlet,Spring',',')}"></c:set>
				<c:forEach var="mecates" items="${cates }">
					<option value="${mecates }" <c:if test = "${st.memoCate eq mecates}">selected</c:if>>${mecates }</option>
				</c:forEach>
			</select>
		</td>
		<td align="right" height="50px;">${st.memoDate }</td>
	</tr>
	<tr>
		<td colspan="100px" style="">
			<input type="text" name="memoTitle" value="${st.memoTitle }">
		</td>
	</tr>
	<tr>
		<td height="50px;" colspan="2">
			<input type="text" name = "subTitle" value="${st.subTitle }">
		</td>
	</tr>
	<tr>
		<td height="450px;" colspan="2">
			<textarea rows="20" cols="100" name="s_content">${st.s_content }</textarea>
		</td>
	</tr>
	<tr align="center" colspan="2">
		<td height="50px;" colspan="2">
			<input type="submit" value="수정하기">
		</td>
	</tr>
</table>
</form>