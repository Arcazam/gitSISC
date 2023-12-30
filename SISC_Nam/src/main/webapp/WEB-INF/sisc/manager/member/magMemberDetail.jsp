<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#MemberDetailTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#MemberDetailTable th {
		background-color: #49CAF2;
		color: black;
	}

</style>

<script>

	function toDelete(id,pageNumber){
		if (confirm(id+'의 레코드를 삭제하시겠습니까?')) {
			location.href="memberDelete.mag?id="+id+"&pageNumber="+pageNumber;
		} else {
			return;
		}
	}
	
	function toMainList(pageNumber){
		location.href="memberList.mag?pageNumber="+pageNumber;
	}

</script>

<table id="MemberDetailTable" border=1>

	<tr>
		<th colspan=2>${ mb.id }님의 정보</th>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td align="center">${ mb.password }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td align="center">${ mb.name }</td>
	</tr>
	<tr>
		<th>프로필 사진</th>
		<td align="center">
			<!-- 프로필 사진 불러오는 코드 작성 부탁 -->
			${ mb.pro_img }
		</td>
	</tr>
	<tr>
		<th>주민등록번호</th>
		<td align="center">${ mb.joomin }</td>
	</tr>
	<tr>
		<th>생일</th>
		<td align="center">
			<fmt:formatDate value="${ mb.birth }" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td align="center">${ mb.gender }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td align="center">${ mb.address }</td>
	</tr>
	<tr>
		<th>구분</th>
		<td align="center">${ mb.division }</td>
	</tr>
	<tr>
		<th>코드</th>
		<td align="center">${ mb.code }</td>
	</tr>
	<tr>
		<th>교육기간</th>
		<td align="center">
			<fmt:formatDate value="${ mb.start_day }" pattern="yyyy-MM-dd"/>~
			<fmt:formatDate value="${ mb.end_day }" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr>
		<th>핸드폰번호</th>
		<td align="center">${ mb.phone }</td>
	</tr>
	<tr>
		<th>반</th>
		<td align="center">${ mb.m_class }</td>
	</tr>
	<tr>
		<th>교육과정</th>
		<td align="center">${ mb.curriculum }</td>
	</tr>
	<tr>
		<th>채택수</th>
		<td align="center">${ mb.adopt }</td>
	</tr>
	<tr>
		<th colspan=2>
			<input type="button" value="회원 삭제" onClick="toDelete('${ mb.id }',${pageNumber})">
			<input type="button" value="회원 목록" onClick="toMainList(${pageNumber})">
		</th>
	</tr>

</table>