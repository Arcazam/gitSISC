<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<style>
    .detailTable {
        width: 60%;
        height: 700px;
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

    .detailTable tr:last-child td {
        height: 100px;
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
	
	.book_img{
		width: 200px;
		height: 300px;
		margin: 60px;
	}
</style>

<c:set var="bk" value="${bb}"/>
<table class="detailTable">
    <tr>
        <td height="50px;">${st.memoCate}</td>
        <td align="right" height="50px;">${bk.seller_name}</td>
    </tr>
    <tr>
        <td colspan="2" style="font-size: 20px;">${bk.title}</td>
    </tr>
    <tr>
        <td height="50px;" colspan="2">${bk.writer}</td>
    </tr>
    <tr>
        <td height="450px;" colspan="2">
        <img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bk.b_image1 }">
        <img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bk.b_image2 }">
        <img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bk.b_image3 }">
        </td>
    </tr>
    <tr>
        <td height="50px;" colspan="2">${bk.sell_content}</td>
    </tr>
    <tr align="center">
        <td height="50px;" colspan="2">
            <a href="update.bk?bk_num=${bk.bk_num}&pageNumber=${pageNumber}">수정</a>|
            <a href="delete.bk?bk_num=${bk.bk_num}&pageNumber=${pageNumber}"> 삭제</a>
        </td>
    </tr>
</table>

<%@ include file="../top&bottom/bookBottom.jsp"%>