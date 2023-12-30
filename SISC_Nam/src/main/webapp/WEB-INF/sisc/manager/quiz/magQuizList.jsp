<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#magQuizListTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magQuizListTable th {
		background-color: #49CAF2;
		color: black;
	}
	
	#magQuizSearchTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magQuizSearchTable th{
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
			document.magQuizListForm.submit();
		} else {
			return;
		}

	}
	
	function insertQuiz(que_cate){
		location.href="quizInsert.mag?quizCate="+que_cate;
	}
	
	function updateQuiz(qz_num,que_cate,pageNumber){
		location.href="quizUpdate.mag?qz_num="+qz_num+"&que_cate="+que_cate+"&pageNumber="+pageNumber;
	}
	
	function deleteQuiz(qz_num,que_cate,pageNumber){
		location.href="quizDelete.mag?qz_num="+qz_num+"&que_cate="+que_cate+"&pageNumber="+pageNumber;
	}
	
</script>

<center>
	<form name="magQuizSearchForm" method="get" action="quizList.mag">
		<table id = "magQuizSearchTable" border=1>
			<tr>
				<th>
					<c:if test="${ quizCate eq 'JAVA' }">
						자바
					</c:if>
					<c:if test="${ quizCate eq 'JavaScript' }">
						자바스크립트
					</c:if>
					<c:if test="${ quizCate eq 'JAVASPRING' }">
						스프링(프레임워크)
					</c:if>
					<c:if test="${ quizCate eq 'CSS' }">
						스타일시트
					</c:if>
					<c:if test="${ quizCate eq 'SQL' }">
						데이터베이스
					</c:if>
					<c:if test="${ quizCate eq 'HTML' }">
						HTML
					</c:if>
					<c:if test="${ quizCate eq 'jQuery' }">
						제이쿼리
					</c:if>
				퀴즈 레코드 : ${ quizCateCount }개</th>
			</tr>
			<tr align="center">
				<td>
					<select name="que_cate">
						<option value="JAVA" <c:if test="${ quizCate eq 'JAVA' }">selected</c:if>>자바</option>
						<option value="JavaScript" <c:if test="${ quizCate eq 'JavaScript' }">selected</c:if>>자바스크립트</option>
						<option value="JAVASPRING" <c:if test="${ quizCate eq 'JAVASPRING' }">selected</c:if>>스프링(프레임워크)</option>
						<option value="CSS" <c:if test="${ quizCate eq 'CSS' }">selected</c:if>>스타일시트</option>
						<option value="SQL" <c:if test="${ quizCate eq 'SQL' }">selected</c:if>>데이터베이스</option>
						<option value="HTML" <c:if test="${ quizCate eq 'HTML' }">selected</c:if>>HTML</option>
						<option value="jQuery" <c:if test="${ quizCate eq 'jQuery' }">selected</c:if>>제이쿼리</option>
					</select>
					<select name="whatColumn">
						<option value="all">전체검색</option>
						<option value="question">질문</option>
						<option value="qz_view">보기</option>
						<option value="interpre">해설</option>				
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
</center>

<form name="magQuizListForm" action="delSelQuiz.mag">
	<input type="hidden" name="pageNumber" value="${ pageInfo.pageNumber }">
	<input type="hidden" name="que_cate" value="${ quizCate }">
	<table id="magQuizListTable" border=1>
		<tr>
			<th colspan="5">퀴즈관리</th>
			<th colspan="2">
				<input type="button" value="퀴즈 추가" onClick="insertQuiz('${ quizCate }')">
			</th>
		</tr>
		<tr>
			<th>
				<input type="checkbox" name="allcheck" onClick="allDelete(this)">
			</th>
			<th>퀴즈 번호</th>
			<th>카테고리</th>
			<th>질문</th>
			<th>답</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:if test="${ !empty qlist }">
			<c:forEach var="qb" items="${ qlist }">
				<tr align="center">
					<td>
						<input type="checkbox" name="rowcheck" value=${ qb.qz_num }>
					</td>
					<td>
						<a href="dListQuiz.mag?qz_num=${ qb.qz_num }&pageNumber=${ pageInfo.pageNumber }">
							${ qb.qz_num }
						</a>
					</td>
					<td>${ qb.que_cate }</td>
					<td>${ qb.question }</td>
					<td>${ qb.answer }</td>
					<td>
						<input type="button" value="수정" onClick="updateQuiz(${ qb.qz_num },'${ qb.que_cate }',${ pageInfo.pageNumber })">
					</td>
					<td>
						<input type="button" value="삭제" onClick="deleteQuiz(${ qb.qz_num },'${ qb.que_cate }',${ pageInfo.pageNumber })">
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${ empty qlist }">
			<tr align="center">
				<td colspan="6">
					게시판 정보가 없습니다
				</td>
			</tr>
		</c:if>
		<tr>
			<th align="right" colspan="7">
				<input type="button" value="선택한 항목 삭제" onClick="selectedDel()">
			</th>
		</tr>
	</table>
</form>
<center>
	${pageInfo.pagingHtml}
</center>