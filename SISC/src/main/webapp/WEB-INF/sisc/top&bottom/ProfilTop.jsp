<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common/common.jsp"%>   
<style>
/* css파일에다 따로하면 스타일이 적용이 안되서 이부분에 스타일 적용 */
.card {
  width: 760px;
  height: 250px;
  background: #ffff;
  box-shadow: 0 1px 25px rgba(0,0,0,0.2);
  transform: translate(-50%, -50%);
  padding: 12px 10px;
  font-family: 'Pretendard-Regular';
  margin-top: 200px;
  margin-left: 50%;
}

.card_load {
    width: 170px;
    height: 170px;
    border-radius: 50%; /* 둥근 모양을 위해 50%의 값을 사용합니다 */
    overflow: hidden; /* 이미지가 테두리를 벗어나지 않도록 설정합니다 */
    position: relative;
    text-align: center;
    float: left;
    background: linear-gradient(120deg, #e5e5e5 30%, #f0f0f0 38%, #f0f0f0 40%, #e5e5e5 48%);
    background-size: cover;
    background-position: center center;
    animation: load89234 2s infinite;
    margin-top: 30px;
    margin-left: 25px;
}

.card_load_extreme_title {
  width: 320px;
  height: 25px;
  position: relative;
  margin-left: 225px;
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
    width: 320px; /* 적절한 너비로 조정 */
    height: 160px; /* 적절한 높이로 조정 */
    float: left; /* 왼쪽으로 나열되도록 설정 */
    margin-top: 10px;
    margin-left: 30px; /* 여백 설정 */
    border-radius: 5px;
    background: linear-gradient(120deg, #e5e5e5 30%, #f0f0f0 38%, #f0f0f0 40%, #e5e5e5 48%);
    background-size: 200% 100%;
    background-position: 100% 0;
    animation: load89234 2s infinite;
    font-size: 18px;
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
 .additional_content {
            display: flex;
            justify-content: flex-end; /* 우측으로 배치 */
            margin-top: -20px; /* 위쪽으로 위치 조정 */
            margin-right: 30px;
        }

        .additional_links {
            display: flex;
            flex-direction: column;
            align-items: flex-end; /* 우측 정렬 */
        }

        .additional_links a {
            margin-bottom: 10px;
            text-decoration: none;
            color: black;
        }
</style>


<%
ServletContext servletContext = null;
String img = request.getContextPath() + "/resources/member/pro_img/";
Object updateImg = (Object)session.getAttribute("updateImg");

String pro_img = (String) request.getAttribute("pro_img");
%>
<div class="card">
        <div class="card_load">
			<c:if test="${updateImg eq null }">
				<img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/pro_img/${loginInfo.pro_img}">
			</c:if>
			<c:if test="${updateImg ne null }">
				<img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/pro_img/${updateImg}">
			</c:if>
        </div>
        <div class="card_load_extreme_title"><b>이름</b> ${loginInfo.name }</div>
	    <div class="card_load_extreme_descripion">
	    	<b> 아이디</b> ${loginInfo.id }<br>
		    <b> 전화번호</b> ${loginInfo.phone }<br>
		    <b> 교육과</b> ${loginInfo.curriculum }<br>
		    <b> 클래스</b> ${loginInfo.m_class }반<br>
		    <b> 교육기간</b> 
		    <fmt:parseDate value=' ${loginInfo.start_day }' pattern="yyyy-MM-dd" var='start_day' /> 
			<fmt:formatDate value="${start_day}" pattern="yyyy-MM-dd" /> ~ 
			<fmt:parseDate value=' ${loginInfo.end_day }' pattern="yyyy-MM-dd" var='end_day' /> 
			<fmt:formatDate value="${end_day}" pattern="yyyy-MM-dd" />
	    </div>

        <div class="additional_content">
            <%-- 추가할 내용 배치 --%>
            <c:if test="${updateImg eq null }">
            	<div class="additional_links">
			    	<input type="hidden" name="loginInfo" value="${loginInfo }">
			        <a href="update.mb?id=${loginInfo.id }">내정보 수정</a>
			        <a href="#" onclick="openProfileUpdate('${loginInfo.id}','${loginInfo.pro_img }')">프로필 수정</a>
			        <a href="myboard.st?id=${loginInfo.id }&pro_img=${loginInfo.pro_img}&writer=${loginInfo.id}">내가쓴 게시글</a>
			        <a href="mycomment.st?id=${loginInfo.id }&pro_img=${loginInfo.pro_img}&writer=${loginInfo.id}">내가쓴 댓글</a>
			        <a href="myBook.st?id=${loginInfo.id }&pro_img=${loginInfo.pro_img}&writer=${loginInfo.id}">내 중고책</a>
			        <a href="SelectAllStudy.st?id=${loginInfo.id }&pro_img=${loginInfo.pro_img}">내 메모장</a>
			        <a href="<%=request.getContextPath() %>/logout.jsp">로그아웃</a>
			        <a href="delete.mb?id=${loginInfo.id }">회원 탈퇴</a>
	            </div>
            </c:if>
            <c:if test="${updateImg ne null }">
            	<div class="additional_links">
			    	<input type="hidden" name="loginInfo" value="${loginInfo }">
			        <a href="update.mb?id=${loginInfo.id }">내정보 수정</a>
			        <a href="#" onclick="openProfileUpdate('${loginInfo.id}','${loginInfo.pro_img }')">프로필 수정</a>
			        <a href="myboard.st?id=${loginInfo.id }&pro_img=${updateImg}&writer=${loginInfo.id}">내가쓴 게시글</a>
			        <a href="mycomment.st?id=${loginInfo.id }&pro_img=${updateImg}&writer=${loginInfo.id}">내가쓴 댓글</a>
			        <a href="myBook.st?id=${loginInfo.id }&pro_img=${updateImg}&writer=${loginInfo.id}">내 중고책</a>
			        <a href="SelectAllStudy.st?id=${loginInfo.id }&pro_img=${updateImg}">내 메모장</a>
			        <a href="<%=request.getContextPath() %>/logout.jsp">로그아웃</a>
			        <a href="delete.mb?id=${loginInfo.id }">회원 탈퇴</a>
	            </div>
            </c:if>
        </div>
    </div>
</div>