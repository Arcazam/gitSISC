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
	<table style="margin: auto;">
		<c:choose>
			<c:when test="${fn:length(sb) eq 0}">
				<tr>
					<td colspan="9" align="center">등록된 책이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="st" items="${sb }">
					<tr>
						<td style="width: 300px; height: 50px;">책제목: ${st.seller }</td>
						<td style="width: 200px;">
							<c:if test="${st.sellstatus == 'Yet' }">
								판매중
							</c:if><c:if test="${st.sellstatus != 'Yet' }">
								판매완료
							</c:if>
						</td>
						<td style="width: 70px;">
							<a href="endsell.bk?bk_num=${st.bk_num}&pageNumber=1&id=${id}&pro_img=${loginInfo.pro_img}">판매 종료</a>
						</td>
						<td style="width: 50px;">
							<a href="updateMyBook.bk?bk_num=${st.bk_num}&pageNumber=1&writer=${st.seller}&id=${id}&pro_img=${loginInfo.pro_img}">수정</a>
						</td>
						<td style="width: 50px;;">
							<a href="deleteMyBook.bk?bk_num=${st.bk_num}&pageNumber=1&id=${id}&pro_img=${loginInfo.pro_img}">삭제</a>
						</td>
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
	function openProfileUpdate(userId) {
    	window.open("updateImg.mb?id=" + userId, "프로필 수정", "width=500,height=500");
    }
	window.onload = function() {
        window.opener.location.reload(); // 부모 창 새로고침
    };
</script>