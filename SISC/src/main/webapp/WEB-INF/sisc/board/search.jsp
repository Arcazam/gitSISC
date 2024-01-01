<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top&bottom/top.jsp"%>
   
<style>
@font-face {
   font-family: 'TAEBAEKfont';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/TAEBAEKfont.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

.searchResult{
margin-top: 50px;
text-align: center;
font-family: 'TAEBAEKfont';
}

.nothing{
margin: auto;
margin-top: 70px;
width: 50%;
height: 100px;
text-align: center;
font-size: 2em;
font-family: 'TAEBAEKfont';
}

.notFound{
margin: auto;
margin-top: 70px;
width: 50%;
height: 100px;
text-align: center;
font-size: 2em;
font-family: 'TAEBAEKfont';
}

.searchTable{
border-collapse : collapse;
border-radius : 10px;
border-style : hidden;
box-shadow : 0 0 0 1px #666;
margin: auto;
margin-top: 70px;
width: 50%;
height: 100px;
font-family: 'TAEBAEKfont';
}

.tableSet1{
font-size: 2em;
margin-left: 10px;
}

.tableSet2{
float: right;
margin-right: 10px;
font-size: 1.5em;
}

.tableSet3{
color: gray;
font-size: 1.5em;
margin-left: 10px;
}

#go{
   text-decoration-line: none;
      color: #0095FF;
}

#go:hover{
   color: black;
}
</style>
   
   <!-- 이 위부터는 스타일 설정입니다 -->
   
   <!-- 검색결과 -->
   <div class="searchResult">
   <span style="font-size: 3em;">"${search}"에 대한 검색 결과</span>
   </div>
   
   <hr style="width: 300px;">
   
   <!-- 아무것도 입력안했을 때 -->
   <c:if test="${searchNull == 0 }">
   <table class="nothing">
      <tr>
         <td>
         <span>검색창에 아무것도 입력하지 않았어요!</span>
         <img src="<%=request.getContextPath()%>/resources/images/아무것도입력안함.png" style="width: 50px; height: 50px;">
         </td>
      </tr>
   </table>
   </c:if>
   
   <!-- 결과를 찾지 못했을 때 -->
   <c:if test="${fn:length(FreeList) == 0 and fn:length(KnowList) == 0 and fn:length(QnAList) == 0 and fn:length(GradList) == 0}">
   <table class="notFound">
      <tr>
         <td>
         <span>이런 아무런 결과도 찾지 못했어요...</span>
         <img src="<%=request.getContextPath()%>/resources/images/검색결과없음.png" style="width: 50px; height: 50px;">
         </td>
      </tr>
   </table>
   </c:if>
   
   <!-- 자유게시판에서 찾았을 때 -->
   <c:if test="${fn:length(FreeList) != 0 and searchNull != 0 }">
   <table border=1 class="searchTable">
      <tr>
         <td style="border-bottom: none;">
         <span class="tableSet1">자유게시판</span>
         <a class="tableSet2" id="go" href="board.bd?board=Free&whatColumn=all&keyword=${search }">>바로가기</a>
         </td>
      </tr>
      
      <tr>
         <td style="border-top: none;"><span class="tableSet3">자유롭게 대화할 수 있는 공간에서 <span style="color: black;">${fn:length(FreeList) }개</span>의 검색결과를 찾았어요!</span></td>
      </tr>
   </table>
   </c:if>
   
   <!-- 지식게시판에서 찾았을 때 -->
   <c:if test="${fn:length(KnowList) != 0 and searchNull != 0 }">
   <table border=1 class="searchTable" style="margin-top: 40px;">
      <tr>
         <td style="border-bottom: none;">
         <span class="tableSet1">지식게시판</span>
         <a class="tableSet2" id="go" href="board.bd?board=Know&whatColumn=all&keyword=${search }">>바로가기</a>
         </td>
      </tr>
      
      <tr>
         <td style="border-top: none;"><span class="tableSet3">코딩꿈나무들의 꿈을 키우는 시간속에서 <span style="color: black;">${fn:length(FreeList) }개</span>의 검색결과를 찾았어요!</span></td>
      </tr>
   </table>
   </c:if>
   
   <!-- QnA게시판에서 찾았을 때 -->
   <c:if test="${fn:length(QnAList) != 0 and searchNull != 0 }">
   <table border=1 class="searchTable" style="margin-top: 40px;">
      <tr>
         <td style="border-bottom: none;">
         <span class="tableSet1">QnA게시판</span>
         <a class="tableSet2" id="go" href="board.bd?board=QnA&whatColumn=all&keyword=${search }">>바로가기</a>
         </td>
      </tr>
      
      <tr>
         <td style="border-top: none;"><span class="tableSet3">유익한 답변 중에서 <span style="color: black;">${fn:length(FreeList) }개</span>의 검색결과를 찾았어요!</span></td>
      </tr>
   </table>
   </c:if>
   
   <!-- 수료생게시판에서 찾았을 때 -->
   <c:if test="${fn:length(GradList) != 0 and searchNull != 0 }">
   <table border=1 class="searchTable" style="margin-top: 40px;">
      <tr>
         <td style="border-bottom: none;">
         <span class="tableSet1">수료생게시판</span>
         <a class="tableSet2" id="go" href="board.bd?board=Grad&whatColumn=all&keyword=${search }">>바로가기</a>
         </td>
      </tr>
      
      <tr>
         <td style="border-top: none;"><span class="tableSet3">코딩 친구들이 나눈 대화 중 <span style="color: black;">${fn:length(FreeList) }개</span>의 검색결과를 찾았어요!</span></td>
      </tr>
   </table>
   
   </c:if>
   
   <br><br><br><br>
   <br><br><br><br>
   