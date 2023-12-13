<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="../top&bottom/topLogin.jsp"%> 

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
</style>

<c:set var="st" value="${sb}"/>
<table class="detailTable">
    <tr>
        <td height="50px;">${st.memoCate}</td>
        <td align="right" height="50px;">${st.memoDate}</td>
    </tr>
    <tr>
        <td colspan="2" style="font-size: 20px;">${st.memoTitle}</td>
    </tr>
    <tr>
        <td height="50px;" colspan="2">${st.subTitle}</td>
    </tr>
    <tr>
        <td height="450px;" colspan="2">${st.s_content}</td>
    </tr>
    <tr align="center">
        <td height="50px;" colspan="2">
            <a href="update.st?s_num=${st.s_num}&pageNumber=${pageNumber}">수정</a>|
            <a href="delete.st?s_num=${st.s_num}&pageNumber=${pageNumber}"> 삭제</a>
        </td>
    </tr>
</table>
