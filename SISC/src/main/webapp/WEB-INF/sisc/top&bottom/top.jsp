<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./../common/common.jsp" %>

<style>
body, html {
    margin: 0;
    padding: 0;
    width: 100%;
}

.top {
   display: flex;
   justify-content: space-evenly;
   margin-top: 10px;
   font-family: 'TAEBAEKfont';
}

.logo {
   width: 200px;
   height: 90px;
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
}
</style>

<body>

   <div class="top">
      <img class="logo" src="<%=request.getContextPath()%>/resources/images/logo.jpg">
      <span class="top_menu">자유</span> <span class="top_menu">지식</span>
      <span class="top_menu">Q&A</span> <span class="top_menu">수료생</span>
      <span class="top_menu"> | </span>
      <span class="top_menu"><font color="green">학생</font></span>
      <form>
         <input class="top_menu" type="text" placeholder="궁금한 게 있을까요?" name="search"> 
         <input class="top_menu" type="button" value="검색">
      </form>
      <span class="top_menu">로그인</span>
   </div>

   <hr>