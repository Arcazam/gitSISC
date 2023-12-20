<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="<%=request.getContextPath() %>/resources/css/studyTable.css"
    rel="stylesheet" type="text/css" />
<%@include file="./../common/common.jsp"%>

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
    <%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
    <%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>
    
<style>
	td{
		height: 50px;
	}
</style>    
    
<table>
	<tr>
		<td><a href = "JavaList.qz">JAVA문제 풀기</a></td>
	</tr>
	<tr>
		<td><a href = "HtmlList.qz">HTML문제 풀기</a></td>
	</tr>
	<tr>
		<td><a href = "CssList.qz">CSS문제 풀기</a></td>
	</tr>
	<tr>
		<td><a href = "JqueryList.qz">jQuery문제 풀기</a></td>
	</tr>
	<tr>
		<td><a href = "JavaScriptList.qz">JavaScript문제 풀기</a></td>
	</tr>
	<tr>
		<td><a href = "SqlList.qz">SQL문제 풀기</a></td>
	</tr>
	<tr>
		<td><a href = "JavaspringList.qz">JAVASPRING문제 풀기</a></td>
	</tr>
</table>