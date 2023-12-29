<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath() %>/resources/css/studyTable.css"
	rel="stylesheet" type="text/css" />
<%
Object loginInfo = session.getAttribute("loginInfo");
	if(loginInfo == null){%>
		<%@ include file="../top&bottom/top.jsp"%>
	<%}else{%>
		<%@ include file="../top&bottom/topLogin.jsp"%>
	<%}%>
   
   <style>
	.detailTable{
		width: 60%;
		height: 600px;
		margin: auto;
		margin-top: 50px;
	}
</style>
   
   <center style="margin-top: 50px;"><h1>문의사항</h1></center>
 <form action="inquiry.bd" method="get" class="search-form" style="margin-top: 50px; margin-bottom: 50px;">
	<select name="whatColumn" class="search-select">
		<option value="all">전체검색</option>
		<option value="writer">작성자</option>
		<option value="subject">제목</option>
	</select> <input type="text" name="keyword" class="search-input"> 
	<input type="hidden" name="menu" value="inquiry">
	<input type="submit" class="search-submit" value="검색">
</form>

<button class="learn-more" type="button" onclick="insert()" style="margin-left: 1100px; margin-bottom: 50px;">
    <span class="circle" aria-hidden="true">
        <span class="icon arrow"></span>
    </span>
    <span class="button-text">문의 남기기</span>
</button>

<div>
<c:set var="id" value="${loginInfo.id}"/>
	<table style="margin: auto;">
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr>
					<td colspan="9" align="center">등록된 게시글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<th style="height: 50px;">작성자</th>
				<th>문의사항</th>
			</tr>
				<c:forEach var="bd" items="${list }">
					<tr>
						<td style="height: 50px;">${bd.writer }</td>
						<td style=""><a href="inquiryDetail.bd?b_num=${bd.b_num }&menu=${bd.b_cate }">${bd.subject }</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<center style="margin-bottom: 100px; margin-top: 50px">${pageInfo.pagingHtml}</center>

<script>
function insert(){
	location.href = "insertInquiry.bd?menu=inquiry";
}
</script>