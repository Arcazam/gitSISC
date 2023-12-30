<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#magMemberListTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magMemberListTable th {
		background-color: #49CAF2;
		color: black;
	}
	
	#magMemberSearchTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magMemberSearchTable th{
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
			document.magMemberListForm.submit();
		} else {
			return;
		}

	}
	
	function deleteMember(id,pageNumber){
		location.href="memberDelete.mag?id="+id+"&pageNumber="+pageNumber;
	}
	
</script>

<center>
	<form name="magMemberSearchForm" method="get" action="memberList.mag">
		<table id = "magMemberSearchTable" border=1>
			<tr>
				<th>
					학원(수료)생 레코드 : ${ pageInfo.totalCount }개
				</th>
			</tr>
			<tr align="center">
				<td>
					<select name="whatColumn">
						<option value="all">전체검색</option>
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="gender">성별</option>				
						<option value="m_class">반</option>				
						<option value="curriculum">교육과정</option>				
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
</center>

<form name="magMemberListForm" action="delSelMember.mag">
	<input type="hidden" name="pageNumber" value="${ pageInfo.pageNumber }">
	<table id="magMemberListTable" border=1>
		<tr>
			<th colspan="9">학원(수료)생 관리</th>
		</tr>
		<tr>
			<th>
				<input type="checkbox" name="allcheck" onClick="allDelete(this)">
			</th>
			<th>아이디</th>
			<th>이름</th>
			<th>생일</th>
			<th>성별</th>
			<th>구분</th>
			<th>반</th>
			<th>교육과정</th>
			<th>삭제</th>
		</tr>
		<c:if test="${ !empty mlist }">
			<c:forEach var="mb" items="${ mlist }">
				<tr align="center">
					<td>
						<input type="checkbox" name="rowcheck" value=${ mb.id }>
					</td>
					<td>${ mb.id }</td>
					<td>
						<a href="dListMember.mag?id=${ mb.id }&pageNumber=${ pageInfo.pageNumber }">
							${ mb.name }
						</a>
					</td>
					<td>
						<fmt:formatDate value="${ mb.birth }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${ mb.gender }</td>
					<td>${ mb.division }</td>
					<td>${ mb.m_class }</td>
					<td>${ mb.curriculum }</td>
					<td>
						<input type="button" value="삭제" onClick="deleteMember('${ mb.id }',${ pageInfo.pageNumber })">
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${ empty mlist }">
			<tr align="center">
				<td colspan="9">
					학원(수료)생 정보가 없습니다
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