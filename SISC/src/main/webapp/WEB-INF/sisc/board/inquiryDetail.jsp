<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<style>
    .detailTable {
        width: 40%;
        height: 500px;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 100px;
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

<c:set var="bb" value="${bd}"/>
<center style="margin-top: 50px;"><h1>문의 사항</h1></center>
<table class="detailTable">
    <tr>
        <td align="left" height="50px;">제목:${bb.subject}</td>
        <td align="right" height="50px;">${bb.reg_date}</td>
    </tr>
    <tr>
        <td colspan="2" style="font-size: 20px;">${bb.content}</td>
    </tr>
    <tr>
    	<td colspan="2" style="text-align: center;">
    		<a href="InquiryUpdate.bd?b_num=${bb.b_num }&menu=${bb.b_cate}">수정</a>
    		<a href="InquiryDelete.bd?b_num=${bb.b_num }&menu=${bb.b_cate}">삭제</a>
    	</td>
    </tr>
</table>
