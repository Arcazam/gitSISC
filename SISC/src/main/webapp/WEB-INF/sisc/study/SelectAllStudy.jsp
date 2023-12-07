<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath() %>/resources/css/studyTable.css"
	rel="stylesheet" type="text/css" />
<%@include file="./../common/common.jsp"%>
<%@ include file="../top&bottom/top.jsp"%>

<script>
	function insert(){
		location.href = "insert.st"
	}
</script>

<h2 align="center">My Page</h2>



<form action="SelectAllStudy.st" method="get" class="search-form">
	<select name="whatColumn" class="search-select">
		<option value="all">전체검색</option>
		<option value="memoTitle">제목</option>
		<option value="subTitle">소제목</option>
		<option value="memoDate">작성날짜</option>
	</select> <input type="text" name="keyword" class="search-input"> <input
		type="submit" class="search-submit" value="검색">
</form>

<table class="top_table">
	<tr>
		<td rowspan="4">사진</td>
	</tr>
	<tr>
		<td>작성자:</td>
	</tr>
	<tr>
		<td>반:</td>
	</tr>
	<tr>
		<td>기간:</td>
	</tr>
</table>

<div>
	<table border="0" cellpadding="0" cellspacing="0" style="margin: auto;">
		<tr>
			<td colspan="9" align="right"><input type="button"
				class="btnstyle" value="추가하기" onclick="insert()"></td>
		</tr>
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr>
					<td colspan="9" align="center">등록된 게시글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="st" items="${list }">
					<input type="hidden" name="s_num" value="${st.s_num }">
					<tr">
						<td width="10%" align="center">${st.s_num }</td>
						<td><strong style="float: left;"><a
								href="detail.st?s_num=${st.s_num }&pageNumber=${pageInfo.pageNumber}">${st.memoTitle }</a></strong>
							<p style="float: right;">${st.memoCate }</p>
							<br>
						<br>
							<p>
							<p style="float: right;">
								<a
									href="update.st?s_num=${st.s_num }&pageNumber=${pageInfo.pageNumber}">수정</a>
								| <a
									href="delete.st?s_num=${st.s_num }&pageNumber=${pageInfo.pageNumber}">삭제</a>
								| ${st.memoDate }
							</p></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<center style="margin-bottom: 100px;">${pageInfo.pagingHtml}</center>