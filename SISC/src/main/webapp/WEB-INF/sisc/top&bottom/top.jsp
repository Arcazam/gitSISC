<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/kfonts2.css" rel="stylesheet">

<style type="text/css">
.top {
   display: flex;
   justify-content: space-evenly;
   font-family: 'TAEBAEKfont';
   background-color: #fff;
   position: fixed; /* 처음부터 고정시킵니다. */
   top: 0;
   width: 100%;
   height: 100px;
   box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
   z-index: 1000;
}

@font-face {
   font-family: 'TAEBAEKfont';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/TAEBAEKfont.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

.top_menu {
   margin-top: 30px;
   border-radius: 100px;
   font-size: 1.2em;
}

/* placeholder 설정 */
input::placeholder {
   color:#464646;
   padding-left: 10px;
}

.space{
margin-left: 15px;
}

input[type="button"]:hover{
   color: #0095FF;
}

#design{
   text-decoration-line: none;
      color: black;
}

#design:hover{
   color: #0095FF;
}
</style>

<body>
   <div class="top">
      <a href="SiscMain.view"><img src="<%=request.getContextPath()%>/resources/images/logo.jpg" style="width:180px; height: 80px;"></a>
      <span class="top_menu"><a href="board.bd?board=Free" id="design">자유</a></span>
      <span class="top_menu"><a href="board.bd?board=Know" id="design">지식</a></span>
      <span class="top_menu"><a href="board.bd?board=QnA" id="design">QnA</a></span>
      <span class="top_menu"><a href="board.bd?board=Grad" id="design">수료생</a></span>
      <form method="post" action="search.bd">
         <input class="top_menu" type="text" placeholder="검색어를 입력하세요" name="search"> 
      </form>
      <span class="top_menu"> | </span>
      
      <!-- 세션설정한 loginInfo를 통해 로그인했는지 안했는지 구분 -->
      <c:if test="${loginInfo eq null }">
      <span class="top_menu" style="color: #00D8FF;">방문객<span class="space"></span><a href = "login.mb" id="design">로그인</a></span>
      </c:if>
      <c:if test="${loginInfo.division eq 'student' }">
      <span class="top_menu" style="color: #ABF200;">학생<span class="space"></span><a href="SelectAllStudy.st" id="design" style="text-decoration-line: none;">${loginInfo.id }님</a></span>
      </c:if>
      <c:if test="${loginInfo.division eq 'manager' }">
      <span class="top_menu" style="color: #030066;">매니저<span class="space"></span><a href="SelectAllStudy.st" id="design" style="text-decoration-line: none;">${loginInfo.id }님</a></span>
      </c:if>
      <c:if test="${loginInfo.division eq 'lecturer' }">
      <span class="top_menu" style="color: #FFBB00;">강사<span class="space"></span><a href="SelectAllStudy.st" id="design" style="text-decoration-line: none;">${loginInfo.id }님</a></span>
      </c:if>
   </div>
   
   <script>
        function submitForm() {
            var searchValue = document.getElementById('search').value;
            // 원하는 작업 수행 (예: 검색 결과 표시)
            console.log(searchValue);
        }
    </script>
   
   <div style="padding-top: 80px;">
   </div>