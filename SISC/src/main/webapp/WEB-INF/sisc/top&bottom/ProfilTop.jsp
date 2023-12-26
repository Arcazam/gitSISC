<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* css파일에다 따로하면 스타일이 적용이 안되서 이부분에 스타일 적용 */
.card {
  width: 700px;
  height: 240px;
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


<%
ServletContext servletContext = null;
String img = request.getContextPath() + "/resources/member/pro_img/";
Object updateImg = (Object)session.getAttribute("updateImg");

String pro_img = (String) request.getAttribute("pro_img");
%>
<div class="card">
    <div class="card_load">
    <% if (updateImg != null) { %>
	    <img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/${loginInfo.id}/pro_img/${loginInfo.pro_img}" />
	<% }else if(updateImg == null && !"defaultImg.png".equals(request.getAttribute("pro_img"))) {%>
	    <img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/${loginInfo.id}/pro_img/${loginInfo.pro_img}" />
	<% } %> 
	
    <% if ("defaultImg.png".equals(request.getAttribute("pro_img"))){ %>
	   		<img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/pro_img/defaultImage.png">
		<% }else if (request.getAttribute("pro_img") == "" && updateImg == null) { %>
		    <img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/pro_img/defaultImage.png">
		<% } %> 
		
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
        <a href="myboard.st?id=${loginInfo.id }&pro_img=${loginInfo.pro_img}&writer=${loginInfo.id}">내가쓴 게시글</a>
        <a href="mycomment.st?id=${loginInfo.id }&pro_img=${loginInfo.pro_img}&writer=${loginInfo.id}">내가쓴 댓글</a>
        <a href="myBook.st?id=${loginInfo.id }&pro_img=${loginInfo.pro_img}&writer=${loginInfo.id}">내 중고책</a>
        <a href="SelectAllStudy.st?id=${loginInfo.id }&pro_img=${loginInfo.pro_img}">내 메모장</a>
        <a href="delete.mb?id=${loginInfo.id }">회원 탈퇴</a>
    </div>
    
    <!-- 프로필 수정 링크 -->
    <div style="margin-left: 45px; clear: both;">
	    <a href="#" onclick="openProfileUpdate('${loginInfo.id}','${loginInfo.pro_img }')">프로필 수정</a>
	</div>
</div>