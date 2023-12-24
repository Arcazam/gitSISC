<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath() %>/resources/css/studyTable.css"
	rel="stylesheet" type="text/css" />
<%@include file="./../common/common.jsp"%>
<html xmlns:th="http://www.thymeleaf.org">

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>
<%@ include file="../top&bottom/ProfilTop.jsp"%>

<form action="SelectAllStudy.st" method="get" class="search-form">
	<select name="whatColumn" class="search-select">
		<option value="all">전체검색</option>
		<option value="memoTitle">제목</option>
		<option value="subTitle">소제목</option>
		<option value="memoDate">작성날짜</option>
	</select> <input type="text" name="keyword" class="search-input"> <input
		type="submit" class="search-submit" value="검색">
</form>
<div>
<c:set var="id" value="${loginInfo.id}"/>
<button class="learn-more" type="button" onclick="insert('${id}','<%= pro_img %>')">
	<span class="circle" aria-hidden="true">
		<span class="icon arrow"></span>
	</span>
	<span class="button-text">추가하기</span>
</button>
	<table style="margin: auto;">
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr>
					<td colspan="9" align="center">등록된 메모가 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="st" items="${list }">
					<input type="hidden" name="s_num" value="${st.s_num }">	
					<tr>
						<td><strong style="float: left;"><a
								href="detail.st?s_num=${st.s_num }&id=${id }&pro_img=${pro_img}&pageNumber=${pageInfo.pageNumber}">${st.memoTitle }</a></strong>
							<p style="float: right;">${st.memoCate }</p>
							<br>
						<br>
							<p>
							<p style="float: right;">
								<a
									href="update.st?s_num=${st.s_num }&id=${id }&pro_img=${pro_img}&pageNumber=${pageInfo.pageNumber}">수정</a>
								| <a
									href="delete.st?s_num=${st.s_num }&id=${id }&pro_img=${pro_img}&pageNumber=${pageInfo.pageNumber}">삭제</a>
								| ${st.memoDate }
							</p></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<center style="margin-bottom: 100px; margin-top: 50px">${pageInfo.pagingHtml}</center>

<script>
	function insert(userId, pro_img){
		location.href = "insert.st?id="+ userId + "&pro_img=" + pro_img;
	}
	function updateProfileImage(imageUrl) {
        $('#profileImage').attr('src', imageUrl); // 프로필 이미지 업데이트
    }
	function openProfileUpdate(userId,pro_img) {
    	window.open("updateImg.mb?id=" + userId + "&pro_img=" + pro_img, "프로필 수정", "width=500,height=500");
    }
	window.onload = function() {
        window.opener.location.reload(); // 부모 창 새로고침
    };
</script>
</html>