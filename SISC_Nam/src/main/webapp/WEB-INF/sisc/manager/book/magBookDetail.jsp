<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#BookDetailTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#BookDetailTable th {
		background-color: #49CAF2;
		color: black;
	}

</style>

<script>

	function toDelete(num,pageNumber){
		if (confirm(num+'번 레코드를 삭제하시겠습니까?')) {
			location.href="bookDelete.mag?bk_num="+num+"&pageNumber="+pageNumber;
		} else {
			return;
		}
	}
	
	function toMainList(pageNumber){
		location.href="bookList.mag?pageNumber="+pageNumber;
	}

</script>

<table id="BookDetailTable" border=1>

	<tr>
		<th colspan=2>${ bb.bk_num }번의 책 정보</th>
	</tr>
	<tr>
		<th>판매자</th>
		<td align="center">${ bb.seller }</td>
	</tr>
	<tr>
		<th>저자</th>
		<td align="center">${ bb.writer }</td>
	</tr>
	<tr>
		<th>책 제목</th>
		<td align="center">${ bb.title }</td>
	</tr>
	<tr>
		<th>출판사</th>
		<td align="center">${ bb.publisher }</td>
	</tr>
	<tr>
		<th>책 사진</th>
		<td align="center">
			<img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bb.b_image1 }">
        <c:choose>
          <c:when test="${not empty bb.b_image2}">
            <img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bb.b_image2 }">
          </c:when>
          <c:otherwise>
            <img class="book_img" src="<%=request.getContextPath()%>/resources/images/no.jpg">
          </c:otherwise>
        </c:choose>
        <c:choose>
          <c:when test="${not empty bb.b_image3}">
            <img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bb.b_image3 }">
          </c:when>
          <c:otherwise>
            <img class="book_img" src="<%=request.getContextPath()%>/resources/images/no.jpg">
          </c:otherwise>
        </c:choose>
		</td>
	</tr>
	<tr>
		<th>판매코멘트</th>
		<td align="center">${ bb.sell_content }</td>
	</tr>
	<tr>
		<th>할인가</th>
		<td align="center">${ bb.dis_price }</td>
	</tr>
	<tr>
		<th>거래방식</th>
		<td align="center">${ bb.tradeway }</td>
	</tr>
	<tr>
		<th>거래장소</th>
		<td align="center">${ bb.tradeplace }</td>
	</tr>
	<tr>
		<th>판매상태</th>
		<td align="center">${ bb.sellstatus }</td>
	</tr>
	<tr>
		<th colspan=2>
			<input type="button" value="책 삭제" onClick="toDelete(${ bb.bk_num },${pageNumber})">
			<input type="button" value="책 목록" onClick="toMainList(${pageNumber})">
		</th>
	</tr>

</table>
    