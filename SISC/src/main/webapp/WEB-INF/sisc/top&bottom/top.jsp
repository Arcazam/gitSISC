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
   margin-top: 10px;
   font-family: 'TAEBAEKfont';
   font-size: 15px;
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
   margin-top: 45px;
   border-radius: 100px;
   font-size: 1.5em;
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
      <a href="SiscMain.view"><img class="logo" src="<%=request.getContextPath()%>/resources/images/logo.jpg" style="width:210px; height: 100px;"></a>
      <span class="top_menu"><a href="board.bd?board=Free" id="design">자유</a></span>
      <span class="top_menu"><a href="board.bd?board=Know" id="design">지식</a></span>
      <span class="top_menu"><a href="board.bd?board=QnA" id="design">Q&A</a></span>
      <span class="top_menu"><a href="board.bd?board=Grad" id="design">수료생</a></span>
      <span class="top_menu"><a href="QuizSelect.qz" id="design">퀴즈</a></span>
      <span class="top_menu"> | </span>
      <span class="top_menu">학생</span>
      <form>
         <input class="top_menu" type="text" placeholder="궁금한 게 있을까요?" name="search"> 
         <input class="top_menu" type="button" value="검색">
      </form>
      <span class="top_menu"><a href = "login.mb" id="design">로그인</a></span>
   </div>

   <hr>