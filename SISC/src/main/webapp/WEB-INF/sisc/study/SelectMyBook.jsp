<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<td style="width: 100px;"></td>

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

<div>
<c:set var="id" value="${loginInfo.id}"/>
	<table style="margin: auto;">
		<c:choose>
			<c:when test="${fn:length(sb) eq 0}">
				<tr>
					<td colspan="8" align="center">등록된 책이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th style="width: 40%; text-align: center;">책 제목</th>
					<th style="width: 10%;">판매 상태</th>
					<th style="width: 30%;">&nbsp;&nbsp;  판매 종료 하기</th>
					<th style="white-space: nowrap;">수정</th>
					<th style="white-space: nowrap;">삭제</th>
				</tr>
				<c:forEach var="st" items="${sb }">
					<tr>
						<td style="width: 40%; height: 50px; text-align: center;">${st.title }</td>
						<td style="width: 20%;">
							<c:if test="${st.sellstatus == 'Yet' }">
								<span style="color: red;">판매중</span>
							</c:if>
							<c:if test="${st.sellstatus != 'Yet' }">
								<span style="color: green;">판매완료</span>
							</c:if>
						</td>
						<td style="width: 70px;">
							<a href="endsell.bk?bk_num=${st.bk_num}&pageNumber=1&id=${id}&pro_img=${loginInfo.pro_img}">판매 종료</a>
						</td>
						<td style="width: 50px;">
							<a href="updateMyBook.bk?bk_num=${st.bk_num}&pageNumber=1&writer=${st.seller}&id=${id}&pro_img=${loginInfo.pro_img}">수정</a>
						</td>
						<td style="width: 10%;">
							<a href="deleteMyBook.bk?bk_num=${st.bk_num}&pageNumber=1&id=${id}&pro_img=${loginInfo.pro_img}" style="text-decoration: none; color: black;">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<input type="button" onclick="location.href='list.bk'" class="search-submit" value="책방으로가기" style="float: right; margin-right: 430px;">
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
    
    function confirmEndSell(bkNum, pageNumber, userId, proImg, sellStatus) {
        if (sellStatus !== 'Yet') {
            // 이미 판매 완료된 경우, 아무 동작도 하지 않음
            return;
        }

        var confirmResult = confirm('판매 종료 하시겠습니까?');
        if (confirmResult) {
            location.href = "endsell.bk?bk_num=" + bkNum + "&pageNumber=" + pageNumber + "&id=" + userId + "&pro_img=" + proImg;
        }
    }
</script>
