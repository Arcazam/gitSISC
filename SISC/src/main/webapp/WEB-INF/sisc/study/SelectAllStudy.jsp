<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath() %>/resources/css/studyTable.css" rel="stylesheet" type="text/css" />
<%@include file = "./../common/common.jsp" %>
<%@ include file="../top&bottom/top.jsp"%>  

<script>
	function insert(){
		location.href = "insert.st"
	}
</script>

<h2 align="center">My Page</h2>

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

<form>
	<div>
		<table border="0" cellpadding="0" cellspacing="0"  style="margin: auto; width: 40%;">
		<tr>
			<td colspan="9" align="right">
				<input type="button" value="추가하기" onclick="insert()" >
			</td>
		</tr>
		<c:choose>
		<c:when test="${fn:length(list) eq 0}">
			<tr>
				<td colspan="9" align="center">
					등록된 게시글이 없습니다
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="st" items="${list }">
				<input type = "hidden" name = "s_num" value="${st.s_num }">
				<tr height="100px;">
					<td width="10%" align="center">${st.s_num }</td>
					<td>
						<strong><a href="detail.st?s_num=${st.s_num }">${st.memoTitle }</a></strong>
						<p style="float:right; display: inline;">${st.memoCate }</p>
						<p>
						<p style="float:right; margin-left: ">수정 | 삭제 | ${st.memoDate }</p>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose> 
		</table>
	</div>
</form>

<script>
$(window).on("load resize ", function() {
	var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	$('.tbl-header').css({'padding-right':scrollWidth});
}).resize();
</script>