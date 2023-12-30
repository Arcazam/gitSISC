<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#magBookListTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magBookListTable th {
		background-color: #49CAF2;
		color: black;
	}
	
	#magBookSearchTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magBookSearchTable th{
		background-color: #DFBBF3;
		color: black;
	}
	
</style>

<script type="text/javascript">

	function allDelete(obj) {
	
		check = obj.checked;
	
		rcheck = document.getElementsByName("rowcheck");
	
		if (check) {
			for (var i = 0; i < rcheck.length; i++) {
				rcheck[i].checked = true;
			}
		} else {
			for (var i = 0; i < rcheck.length; i++) {
				rcheck[i].checked = false;
			}
	
		}
	
	}//allDelete
	
	function selectedDel() {
		flag = false;
		rcheck = document.getElementsByName("rowcheck");
		for (var i = 0; i < rcheck.length; i++) {
			if (rcheck[i].checked) {
				flag = true;
			}
		}
		if (!flag) {
			alert('선택할 레코드를 최소한 하나를 선택하셔야 합니다');
			return;
		}
	
		if (confirm('선택한 레코드를 삭제하시겠습니까?')) {
			document.magBookListForm.submit();
		} else {
			return;
		}

	}
	
	function deleteBook(b_num,pageNumber){
		location.href="bookDelete.mag?bk_num="+bk_num+"&pageNumber="+pageNumber;
	}
	
</script>

<center>
	<form name="magBookSearchForm" method="get" action="bookList.mag">
		<table id = "magBookSearchTable" border=1>
			<tr>
				<th>
					책방 레코드 : ${ pageInfo.totalCount }개
				</th>
			</tr>
			<tr align="center">
				<td>
					<select name="whatColumn">
						<option value="all">전체검색</option>
						<option value="seller">판매자(아이디)</option>
						<option value="title">제목</option>
						<option value="sellstatus">판매상태</option>				
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
</center>

<form name="magBookListForm" action="delSelBook.mag">
	<input type="hidden" name="pageNumber" value="${ pageInfo.pageNumber }">
	<table id="magBookListTable" border=1>
		<tr>
			<th colspan="9">책 관리</th>
		</tr>
		<tr>
			<th>
				<input type="checkbox" name="allcheck" onClick="allDelete(this)">
			</th>
			<th>책 번호</th>
			<th>판매자(아이디)</th>
			<th>제목</th>
			<th>할인가</th>
			<th>거래 방식</th>
			<th>거래 장소</th>
			<th>판매 상태</th>
			<th>삭제</th>
		</tr>
		<c:if test="${ !empty book_list }">
			<c:forEach var="bb" items="${ book_list }">
				<tr align="center">
					<td>
						<input type="checkbox" name="rowcheck" value=${ bb.bk_num }>
					</td>
					<td>${ bb.bk_num }</td>
					<td>
						<a href="dListBook.mag?bk_num=${ bb.bk_num }&pageNumber=${ pageInfo.pageNumber }">
							${ bb.seller }
						</a>
					</td>
					<td>${ bb.title }</td>
					<td>
						<fmt:formatNumber value="${ bb.dis_price }" pattern="#,###" /> 원
					</td>
					<td>${ bb.tradeway }</td>
					<td>${ bb.tradeplace }</td>
					<td>${ bb.sellstatus }</td>
					<td>
						<input type="button" value="삭제" onClick="deleteBook(${ bb.b_num },'${ pageInfo.pageNumber }')">
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${ empty book_list }">
			<tr align="center">
				<td colspan="9">
					책 정보가 없습니다
				</td>
			</tr>
		</c:if>
		<tr>
			<th align="right" colspan="9">
				<input type="button" value="선택한 항목 삭제" onClick="selectedDel()">
			</th>
		</tr>
	</table>
</form>
<center>
	${pageInfo.pagingHtml}
</center>