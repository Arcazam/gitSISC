<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<style>
    .detailTable {
        width: 40%;
        margin: auto;
        margin-top: 50px;
        border-collapse: collapse;
        font-family: 'Pretendard-Regular';
    }

    .detailTable td {
        border: 1px solid #ddd;
        padding: 10px;
    }

    .detailTable tr:first-child {
        background-color: #f2f2f2;
    }

    .detailTable tr:last-child a {
        color: blue;
        text-decoration: none;
        margin-right: 10px;
    }
    
    @font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
</style>

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>


<c:set var="bd" value="${bb}"/>
<table class="detailTable">
    <tr>
        <td height="50px;">${bd.writer}</td>
        <td align="right" height="50px;">조회수 ${bd.readcount}</td>
    </tr>
    <tr>
        <td colspan="2" style="font-size: 20px;">${bd.b_cate}</td>
    </tr>
    <tr>
        <td height="50px;" colspan="2">${bd.subject}</td>
    </tr>
    <tr>
        <td height="150px;" colspan="2">${bd.content}</td>
    </tr>
    <tr align="center">
        <td height="20px;" colspan="2">
            <a href="update.bd?b_num=${bd.b_num}&pageNumber=${pageNumber}&board=${bd.b_cate}">수정</a>|
            <a href="delete.bd?b_num=${bd.b_num}&pageNumber=${pageNumber}&board=${bd.b_cate}">삭제</a>
        </td>
    </tr>
</table>

<c:forEach var="bd2" items="${numCommentsList }">
<table class = "detailTable">
	<tr>
			<%-- <td>
			<c:set var = "wid" value="0"/>
			<c:if test="${bd2.re_level > 0}">
				<c:set var = "wid" value="${bd2.re_level * 20}"/>
				<img src="<%=request.getContextPath() %>/resources/images/level.gif" width="${wid }">
				<img src="<%=request.getContextPath() %>/resources/images/re.gif">
			</c:if>
			<c:if test="${bd2.readcount >= 10 }">
				<img src="<%=request.getContextPath() %>/resources/images/hot.gif">
			</c:if>
			<a href = "detail.bd?num=${bd2.b_num }&pageNumber=${pageInfo.pageNumber}&ref=${bd.ref }&re_step=${bd2.re_step }&re_level=${bd2.re_level }">
				${bd2.subject }
			</a>
			</td> --%>
			<td>${bd2.writer }</td>
			<td>${bd2.content }</td>
			<td>
				<fmt:parseDate value="${bd2.reg_date}" var="regdate" pattern="yyyy-MM-dd HH:mm:ss.S" />
				<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd" />
			</td>
		<td>조회수 ${bd2.readcount }</td>
	</tr>
</table>
</c:forEach>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class="container">
<form action="reply.bd" method="post" style="width: 40%; margin-left: 210px;">
<input type="hidden" name = "b_num" value="${bd.b_num }">
<input type="hidden" name = "b_cate" value="${bd.b_cate }">
<input type="hidden" name = "writer" maxlength="10" value="${bd.writer }">
<input type="hidden" name = "subject" maxlength="50" value="${bd.subject }">
<input type="hidden" name = "pageNumber" value="${pageNumber }">
<input type="hidden" name = "ref" value="${bd.ref }">
<input type="hidden" name = "re_level" value="${bd.re_level }">
<input type="hidden" name = "re_step" value="${bd.re_step }">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">      
                <tr>
					<td width="50">작성자 : 
						<c:choose>
						    <c:when test="${empty mb.name}">
						        로그인을 해야 댓글을 쓸수 있습니다
						    </c:when>
						    <c:otherwise>
						        ${mb.name}
						    </c:otherwise>
						</c:choose>
					</td>
				</tr>
                    <tr>
                        <td>
                            <textarea style="width: 700px" rows="3" cols="30" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                               <input class="btn pull-right btn-success" type="submit" value="등록">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</div>
 