<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#magBoardListTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magBoardListTable th {
		background-color: #49CAF2;
		color: black;
	}
	
	#magBoardSearchTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magBoardSearchTable th{
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
			document.magBoardListForm.submit();
		} else {
			return;
		}

	}
	
	function deleteBoard(b_num,b_cate,pageNumber){
		location.href="boardDelete.mag?b_num="+b_num+"&b_cate="+b_cate+"&pageNumber="+pageNumber;
	}
	
</script>

<center>
	<form name="magBoardSearchForm" method="get" action="boardList.mag">
		<table id = "magBoardSearchTable" border=1>
			<tr>
				<th>
					<c:if test="${ boardCate eq 'Free' }">
						자유
					</c:if>
					<c:if test="${ boardCate eq 'Know' }">
						지식
					</c:if>
					<c:if test="${ boardCate eq 'QnA' }">
						QnA
					</c:if>
					<c:if test="${ boardCate eq 'Grad' }">
						수료생
					</c:if>
				게시판 레코드 : ${ pageInfo.totalCount }개</th>
			</tr>
			<tr align="center">
				<td>
					<select name="b_cate">
						<option value="Free" <c:if test="${ boardCate eq 'Free' }">selected</c:if>>자유게시판</option>
						<option value="Know" <c:if test="${ boardCate eq 'Know' }">selected</c:if>>지식게시판</option>
						<option value="QnA" <c:if test="${ boardCate eq 'QnA' }">selected</c:if>>QnA게시판</option>
						<option value="Grad" <c:if test="${ boardCate eq 'Grad' }">selected</c:if>>수료생게시판</option>
					</select>
					<select name="whatColumn">
						<option value="all">전체검색</option>
						<option value="subjectAndContent">제목 + 내용</option>
						<option value="writer">작성자</option>
						<option value="subject">제목</option>				
						<option value="content">내용</option>				
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
</center>

<form name="magBoardListForm" action="delSelBoard.mag">
	<input type="hidden" name="pageNumber" value="${ pageInfo.pageNumber }">
	<input type="hidden" name="b_cate" value="${ boardCate }">
	<table id="magBoardListTable" border=1>
		<tr>
			<th colspan="9">게시판관리</th>
		</tr>
		<tr>
			<th>
				<input type="checkbox" name="allcheck" onClick="allDelete(this)">
			</th>
			<th>게시판 번호</th>
			<th>카테고리</th>
			<th>글쓴이</th>
			<th>제목</th>
			<th>등록일자</th>
			<th>조회수</th>
			<th>태그 목록</th>
			<th>삭제</th>
		</tr>
		<c:if test="${ !empty blist }">
			<c:forEach var="bb" items="${ blist }">
				<tr align="center">
					<td>
						<input type="checkbox" name="rowcheck" value=${ bb.b_num }>
					</td>
					<td>
						<a href="dListBoard.mag?b_num=${ bb.b_num }&pageNumber=${ pageInfo.pageNumber }">
							${ bb.b_num }
						</a>
					</td>
					<td>${ bb.b_cate }</td>
					<td>${ bb.writer }</td>
					<td>${ bb.subject }</td>
					<td>
						<fmt:formatDate value="${bb.reg_date}" pattern="yyyy-MM-dd"/>
					</td>
					<td>${ bb.readcount }</td>
					<td>${ bb.taglist }</td>
					<td>
						<input type="button" value="삭제" onClick="deleteBoard(${ bb.b_num },'${ bb.b_cate }','${ pageInfo.pageNumber }')">
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${ empty blist }">
			<tr align="center">
				<td colspan="9">
					게시판 정보가 없습니다
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