<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath() %>/resources/css/studyTable.css"
	rel="stylesheet" type="text/css" />
<%@include file="./../common/common.jsp"%>
<%@ include file="../top&bottom/topLogin.jsp"%>

<style>
/* css파일에다 따로하면 스타일이 적용이 안되서 이부분에 스타일 적용 */
.card {
  width: 190px;
  height: 90px;
  background: #ffff;
  box-shadow: 0 1px 25px rgba(0,0,0,0.2);
  position: absolute;
  transform: translate(-50%, -50%);
  top: 30%;
  left: 10%;
  padding: 12px 10px;
}

.card_load {
  width: 70px;
  height: 70px;
  position: relative;
  float: left;
  background: linear-gradient(120deg, #e5e5e5 30%, #f0f0f0 38%, #f0f0f0 
  40%, #e5e5e5 48%);
  border-radius: 50%;
  background-size: 200% 100%;
  background-position: 100% 0;
  animation: load89234 2s infinite;
}

.card_load_extreme_title {
  width: 90px;
  height: 25px;
  position: relative;
  float: right;
  border-radius: 5px;
  background: linear-gradient(120deg, #e5e5e5 30%, #f0f0f0 38%, #f0f0f0 
  40%, #e5e5e5 48%);
  background-size: 200% 100%;
  background-position: 100% 0;
  animation: load89234 2s infinite;
}

.card_load_extreme_descripion {
  width: 90px;
  height: 47px;
  position: relative;
  float: right;
  border-radius: 5px;
  background: linear-gradient(120deg, #e5e5e5 30%, #f0f0f0 38%, #f0f0f0 
  40%, #e5e5e5 48%);
  margin-top: 10px;
  background-size: 200% 100%;
  background-position: 100% 0;
  animation: load89234 2s infinite;
}

@keyframes load89234 {
  100% {
    background-position: -100% 0;
  }
}
</style>

<script>
	function insert(){
		location.href = "insert.st"
	}
</script>

<h2 align="center">My Pages</h2>

<div class="card">
    <div class="card_load">사진</div>
    <div class="card_load_extreme_title">${loginInfo }</div>
    <div class="card_load_extreme_descripion">asd</div>
</div>

<form action="SelectAllStudy.st" method="get" class="search-form">
	<select name="whatColumn" class="search-select">
		<option value="all">전체검색</option>
		<option value="memoTitle">제목</option>
		<option value="subTitle">소제목</option>
		<option value="memoDate">작성날짜</option>
	</select> <input type="text" name="keyword" class="search-input"> <input
		type="submit" class="search-submit" value="검색">
</form>

<table class="top_table">
	<tr>
		<td rowspan="4">사진</td>
	</tr>
	<tr>
		<td>작성자:</td>
	</tr>
	<tr>
		<td>반:</td>
	</tr>
	<tr>
		<td>기간:</td>
	</tr>
</table>

<button class="learn-more" type="button" onclick="insert()">
	<span class="circle" aria-hidden="true">
		<span class="icon arrow"></span>
	</span>
	<span class="button-text">추가하기</span>
</button>

<div>
	<table style="margin: auto;">
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr>
					<td colspan="9" align="center">등록된 메모가 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="st" items="${list }">
					<input type="hidden" name="s_num" value="${st.s_num }">
					<tr>
						<td width="10%" height="50px;" align="center">${st.s_num }</td>
						<td><strong style="float: left;"><a
								href="detail.st?s_num=${st.s_num }&pageNumber=${pageInfo.pageNumber}">${st.memoTitle }</a></strong>
							<p style="float: right;">${st.memoCate }</p>
							<br>
						<br>
							<p>
							<p style="float: right;">
								<a
									href="update.st?s_num=${st.s_num }&pageNumber=${pageInfo.pageNumber}">수정</a>
								| <a
									href="delete.st?s_num=${st.s_num }&pageNumber=${pageInfo.pageNumber}">삭제</a>
								| ${st.memoDate }
							</p></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<center style="margin-bottom: 100px; margin-top: 50px">${pageInfo.pagingHtml}</center>