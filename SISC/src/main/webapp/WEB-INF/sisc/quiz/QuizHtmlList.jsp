<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="<%=request.getContextPath() %>/resources/css/studyTable.css"
    rel="stylesheet" type="text/css" />
<%@include file="./../common/common.jsp"%>

<style>
.space{
	margin-right: 50px;
	display: inline;
}

a{
	color:  #337AB7;
}
</style>

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
    <%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
    <%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<div>
    <form style="margin: auto;">
        <c:choose>
            <c:when test="${fn:length(list) eq 0}">
                <p align="center">등록된 퀴즈가 없습니다</p>
            </c:when>
            <c:otherwise>
                <table>
                    <c:forEach var="qz" items="${list}">
                        <tr>
                            <td align="center">문제${qz.qz_num }</td>
                            <td><p style="float: right;">${qz.que_cate }</p></td>
                        </tr>
                        <tr>
                            <td colspan="2"><strong style="float: left;">
                                ${qz.question}</strong>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div>${qz.interpre}</div>
                                <input type="hidden" name="point" value="${qz.point}">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                           		<div class="space">1 <input type="radio" name="answer" value="1"></div>
                           		<div class="space">2 <input type="radio" name="answer" value="2"></div>
                           		<div class="space">3 <input type="radio" name="answer" value="3"></div>
                           		<div class="space">4 <input type="radio" name="answer" value="4"></div>
                           		<div class="space">5 <input type="radio" name="answer" value="5"></div>
                            </td>
                        </tr>
                         <tr>
                            <td colspan="2">
                                <div style="height: 100px;"></div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <input type="submit" value="제출하기">
    </form>
</div>