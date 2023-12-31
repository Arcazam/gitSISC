<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath() %>/resources/css/btn.css" rel="stylesheet" type="text/css" />

<%Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<style>
    <style>
    .detailTable {
        width: 60%;
        height: 500px;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 100px;
        font-family: 'Pretendard-Regular';
        border-collapse: collapse; /* 테이블 테두리 모델 설정 */
    }

    .detailTable th,
    .detailTable td {
        padding: 8px;
        text-align: left;
    }

    .detailTable tr:first-child td {
        border-top: none; /* 첫 번째 행의 위쪽 선 제거 */
    }

    .detailTable tr:last-child td {
        border-bottom: none; /* 마지막 행의 아래쪽 선 제거 */
        height: 100px;
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
<hr style="border: none; border-top: 2px solid black; width: 700px;">
<table class="detailTable" style="margin-left: 505px; width: 700px;">
    <tr style="background-color: white;">
        <td align="left" height="50px;"><strong style="font-size: 20px;">&nbsp;${bb.subject}</strong></td>
    </tr>
    <tr>
    	<td align="right" height="70px;">
    		<strong>작성자</strong>&nbsp;&nbsp; ${bb.writer }&nbsp;&nbsp;|&nbsp;&nbsp;
	        <strong>등록일</strong>&nbsp;&nbsp;
	        <fmt:parseDate value="${bb.reg_date}" pattern="yyyy-MM-dd" var='day' /> 
			<fmt:formatDate value="${day}" pattern="yyyy-MM-dd" />&nbsp;&nbsp;|&nbsp;&nbsp;
			<strong>조회수</strong>&nbsp;&nbsp;${bb.readcount }
        </td>
    </tr>
    <tr>
        <td colspan="2" height="70px;" style="font-size: 18px; vertical-align: top; border-top: 1px solid black;">&nbsp;${bb.content}</td>
    </tr>
    <tr>
    	<!-- 회원 정보가 다르면 수정 삭제가 안뜨게 함 -->
    	<c:if test="${mb.id == bb.writer }">
    		<td colspan="2" style="text-align: center;">
	    		<a href="InquiryUpdate.bd?b_num=${bb.b_num }&menu=${bb.b_cate}">수정</a>
	    		<a href="InquiryDelete.bd?b_num=${bb.b_num }&menu=${bb.b_cate}">삭제</a>
    		</td>
    	</c:if>
    </tr>
</table>
<br>
<hr style="border: none; border-top: 2px solid black; width: 700px;">
<input type="button" id="sub" value="목록" class="studysave" onClick="location.href='inquiryList.bd?menu=${bb.b_cate}'" style="margin-right: 500px;">
