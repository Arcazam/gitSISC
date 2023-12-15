<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath() %>/resources/css/studyTable.css"
	rel="stylesheet" type="text/css" />
<%@include file="./../common/common.jsp"%>
<html xmlns:th="http://www.thymeleaf.org">

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<style>
/* css파일에다 따로하면 스타일이 적용이 안되서 이부분에 스타일 적용 */
.card {
  width: 700px;
  height: 200px;
  background: #ffff;
  box-shadow: 0 1px 25px rgba(0,0,0,0.2);
  transform: translate(-50%, -50%);
  padding: 12px 10px;
  font-family: 'Pretendard-Regular';
  margin-top: 150px;
  margin-left: 50%;
}

.card_load {
    width: 140px;
    height: 140px;
    border-radius: 50%; /* 둥근 모양을 위해 50%의 값을 사용합니다 */
    overflow: hidden; /* 이미지가 테두리를 벗어나지 않도록 설정합니다 */
    position: relative;
    text-align: center;
    float: left;
    background: linear-gradient(120deg, #e5e5e5 30%, #f0f0f0 38%, #f0f0f0 40%, #e5e5e5 48%);
    background-size: cover;
    background-position: center center;
    animation: load89234 2s infinite;
    margin-top: 15px;
    margin-left: 10px;
}

.card_load_extreme_title {
  width: 260px;
  height: 25px;
  position: relative;
  margin-left: 200px;
  text-align: center;
  border-radius: 5px;
  background: linear-gradient(120deg, #e5e5e5 30%, #f0f0f0 38%, #f0f0f0 
  40%, #e5e5e5 48%);
  background-size: 200% 100%;
  background-position: 100% 0;
  animation: load89234 2s infinite;
  font-size: 20px;
}

.card_load_extreme_descripion {
    /* 기존 코드... */
    width: 260px; /* 적절한 너비로 조정 */
    height: 130px; /* 적절한 높이로 조정 */
    float: left; /* 왼쪽으로 나열되도록 설정 */
    margin-top: 10px;
    margin-left: 50px; /* 여백 설정 */
    border-radius: 5px;
    background: linear-gradient(120deg, #e5e5e5 30%, #f0f0f0 38%, #f0f0f0 40%, #e5e5e5 48%);
    background-size: 200% 100%;
    background-position: 100% 0;
    animation: load89234 2s infinite;
    font-size: 18px;
    text-align: center;
    margin-right: 80px;
}
.card_links {
    display: flex;
    flex-direction: column;
}

.card_links a {
    display: block;
    margin-bottom: 10px;
    text-decoration: none;
    color: black;
}


@keyframes load89234 {
  100% {
    background-position: -100% 0;
  }
}

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

.img-option{
	width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 5px;
}
</style>

<script>
	function insert(){
		location.href = "insert.st"
	}
	function updateProfileImage(imageUrl) {
        $('#profileImage').attr('src', imageUrl); // 프로필 이미지 업데이트
    }
	function openProfileUpdate(userId) {
    	window.open("updateImg.mb?id=" + userId, "프로필 수정", "width=500,height=500");
    }
</script>

<%
ServletContext servletContext = null;
String img = request.getContextPath() + "/resources/member/pro_img/";
File updateImg = (File)session.getAttribute("updateImg");

String fullPath = "C:\\Users\\rudgu\\Spring_ngh\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SISC\\resources\\member\\pro_img\\";
String fileName = new File(fullPath).getName(); // "la.png"

%>
<div class="card">
    <div class="card_load">
    	<!-- 문제점 : 새로고침해도 안바뀌고 로그아웃하고 로그인해야지 프로필 사진이 바뀐다 해결해야함 -->
		<c:choose>
		    <c:when test="${empty updateImg}">
		        <img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/pro_img/${loginInfo.pro_img}" />
		    </c:when>
		    <c:otherwise>
		        <c:if test="${not empty updateImg}">
				    <img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/pro_img/<%= fileName %>" />
				</c:if>
		    </c:otherwise>
		</c:choose>
	</div>
    <div class="card_load_extreme_title">이름 - ${loginInfo.name }</div>
    <div class="card_load_extreme_descripion">
    	아이디 - ${loginInfo.id }<br><br>
	    전화번호 - ${loginInfo.phone }<br><br>
	    클래스 - ${loginInfo.m_class }반<br>
    </div>
    <div class=	"card_links">
    <input type="hidden" name="loginInfo" value="${loginInfo }">
        <a href="update.mb?id=${loginInfo.id }">내정보 수정</a>
        <a href="#">내가쓴 게시글</a>
        <a href="#">내가쓴 댓글</a>
        <a href="delete.mb?id=${loginInfo.id }">회원 탈퇴</a>
    </div>
    
    <!-- 프로필 수정 링크 -->
    <div style="margin-left: 45px; clear: both;">
	    <a href="#" onclick="openProfileUpdate('${loginInfo.id}')">프로필 수정</a>
	</div>
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
<div>
<button class="learn-more" type="button" onclick="insert()">
	<span class="circle" aria-hidden="true">
		<span class="icon arrow"></span>
	</span>
	<span class="button-text">추가하기</span>
</button>
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

