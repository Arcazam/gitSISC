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
   
   <center style="margin-top: 50px;"><strong><h1>문의사항</h1></strong></center>
 <form action="" method="get" class="search-form" style="margin-top: 50px; margin-bottom: 50px;">
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
         <c:when test="${fn:length(list) eq 0}">
            <tr>
               <td colspan="9" align="center">등록된 게시글이 없습니다</td>
            </tr>
         </c:when>
         <c:otherwise>
         <tr>
            <td>작성자</td>
            <td>제목</td>
            <td>조회수</td>
         </tr>
            <c:forEach var="bd" items="${list }">
               <tr>
                  <td style="width: 300px; height: 50px;">${bd.writer }</td>
                  <td style="width: 200px; height: 50px;">${bd.subject }</td>
                  <td style="width: 200px; height: 50px;">${bd.readcount }</td>
               </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
   </table>
</div>
<center style="margin-bottom: 100px; margin-top: 50px">${pageInfo.pagingHtml}</center>