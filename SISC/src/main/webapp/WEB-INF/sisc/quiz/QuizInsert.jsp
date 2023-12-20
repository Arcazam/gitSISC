<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<form method="post" action="insert.qz">
<input type="hidden" name="qz_num">
<input type="hidden" name="point">
	<table>
		<tr>
			<td>작성자 :${mb.name }</td>
			<td>
				<select name="memoCate" style="float: right;">
					<c:set var="cates" value="${fn:split('선택하세요,HTML,CSS,JAVA,jQuery,JavaScript,SQL,JAVASPRING',',')}"></c:set>
					<c:forEach var="mecates" items="${cates }">
						<option value="${mecates }">${mecates }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" name="question" style="width: 40%;" placeholder="질문"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" name="answer" style="width: 40%;" placeholder="정답"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea class="summernote" name="interpre" placeholder="해설"></textarea> 
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="저장하기">
			</td>
		</tr>
	</table>
</form>