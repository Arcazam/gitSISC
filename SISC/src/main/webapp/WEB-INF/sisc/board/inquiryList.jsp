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
	th:nth-child(2), td:nth-child(2) {
    	width: 40%;
	}
	th:nth-child(3), td:nth-child(3) {
    	width: 20%;
    	text-align: center;
	}
	th:nth-child(4), td:nth-child(4) {
    	width: 20%;
    	text-align: center;
	}
	th{
		text-align: center;
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
	<table style="margin: auto; color: gray;">
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr>
					<td colspan="9" align="center">등록된 게시글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<th width="1px;" >번호</th>
				<th>제목</th>
				<th style="height: 50px;">작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
				<c:forEach var="bd" items="${list }">
					<tr>
						<td style="text-align: center;">${bd.b_num }</td>
						<td><a href="inquiryDetail.bd?b_num=${bd.b_num }&menu=${bd.b_cate }" style="color: gray;">${bd.subject }</a></td>
						<td style="height: 50px;">${bd.writer }</td>
						<td>
							<fmt:parseDate value="${bd.reg_date}" pattern="yyyy-MM-dd" var='day' /> 
							<fmt:formatDate value="${day}" pattern="yyyy-MM-dd" />
						</td>
						<td style="text-align: center;">${bd.readcount }</td>
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