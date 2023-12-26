<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/common.jsp" %>
   
<%
Object loginInfo = session.getAttribute("loginInfo");
	if(loginInfo == null){%>
		<%@ include file="../top&bottom/top.jsp"%>
	<%}else{%>
		<%@ include file="../top&bottom/topLogin.jsp"%>
	<%}%>
	
   <style>
   .FreeImg{
   background-image: url("<%=request.getContextPath() %>/resources/images/자유게시판.png");
   }
   
   .KnowImg{
   background-image: url("<%=request.getContextPath() %>/resources/images/지식게시판.png");
   }
   
   .QnAImg{
   background-image: url("<%=request.getContextPath() %>/resources/images/");
   }
   
   .GradImg{
   background-image: url("<%=request.getContextPath() %>/resources/images/수료생게시판.png");
   }
   
   .QuizImg{
   background-image: url("<%=request.getContextPath() %>/resources/images/");
   }
   
   .boardTitle{
   border-collapse: collapse;
   border-radius : 30px;
      border-style : hidden;
      box-shadow : 0 0 0 1px #666;
   margin: auto;
   text-align: center;
   width: 1063px;
   height: 200px;
   font-family: 'TAEBAEKfont';
   }
   
   .showBoard{
   display: flex;
    flex-direction: row;
   }
   
   .write{
   margin-top: 10px;
   margin-bottom: 1px;
   
   }
   
   .boardTag{
   border-collapse: collapse;
   border-radius : 30px;
      border-style : hidden;
      box-shadow : 0 0 0 1px #666;
      margin-top: 10px;
      width: 220px;
      height: 400px; 
   }
   
   .boardMain{
   border-collapse: collapse;
   border-radius : 30px;
      border-style : hidden; 
      box-shadow : 0 0 0 1px #666;
   margin: auto;
   margin-top: 10px;
   width: 600px;
   height: 150px;
   }
   
   .boardTableTitle{
   white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      max-width: 150px;
      padding-left: 20px;
      padding-right: 20px;
      height: 50px;
      border-bottom: none;
   }
   
   .boardTableContent{
   overflow: hidden;
     text-overflow: ellipsis;
     display: -webkit-box;
     -webkit-line-clamp: 2;
     -webkit-box-orient: vertical;
   }
   
   .contentStyle{
   padding-left: 20px;
   padding-right: 20px;
   border-top: none;
     border-bottom: none;
   }
   
   .boardTableWriter{
   padding-left: 20px;
   height: 30px;
   border-top: none;
     border-bottom: none;
   }
   
   .boardTableTag{
   padding-left: 20px;
   padding-right: 20px;
   height: 30px;
   border-top: none;
   border-bottom: none;
   }
   
   .boardHot{
   border-collapse: collapse;
   border-radius : 30px;
      border-style : hidden;
      box-shadow : 0 0 0 1px #666;
      margin-top: 10px;
      width: 220px;
      height: 400px;
   }
   
   .floating-left {
     position: absolute; 
     left: 50%;
     top: 410px; 
     margin-left: -531px;
     text-align:center;
     width: 120px;
     transition: top 0.3s ease-in-out;
   }
   .floating-right {
     position: absolute; 
     right: 50%;
     top: 410px; 
     margin-right: -431px;
     text-align:center;
     width: 120px;
     transition: top 0.3s ease-in-out;
   }
   
   .searchBoard{
   border-radius: 100px;
   }
   
   </style>
   
   <script>
     window.addEventListener('scroll', function () {
       var leftElement = document.querySelector('.floating-left');
       var rightElement = document.querySelector('.floating-right');
       var scrollPosition = window.scrollY;

       // Adjust the top position based on scroll position
       if (scrollPosition > 386) {
         leftElement.style.top = scrollPosition + 'px';
         rightElement.style.top = scrollPosition + 'px';
       } else {
         leftElement.style.top = '386px';
         rightElement.style.top = '386px';
       }
     });
     function insert(boardName){
    	 
    	    if (boardName == '지식') {
    	    	location.href = "insert.bd?board=Know";
    	    	
    	    } else if (boardName == 'Q&A') {
    	    	location.href = "insert.bd?board=QnA";
    	    	
    	    } else if (boardName == '수료생') {
    	    	location.href = "insert.bd?board=Grad";
    	    	
    	    } else if(boardName == '자유'){
    	    	location.href = "insert.bd?board=Free";
    	    	
    	    } else if(boardName == '퀴즈'){
    	    	location.href = "insert.bd?board=Quiz";
    	    }
     }
   </script>

   <div class="floating-left">
     <table border=1 class="boardTag">
      <tr>
         <td colspan=3>지금 인기태그를 확인!</td>
      </tr>
      
      <c:forEach var="i" begin="1" end="5" step="1">
      <tr>
         <td>#해시태그</td>
      </tr>
      </c:forEach>
   </table>
   </div>
   
   <div class="floating-right">
     <table border=1 class="boardHot">
      <tr>
         <td>지금 HOT한 게시물 확인!</td>
      </tr>
      
      <c:forEach var="i" begin="1" end="10" step="1">
      <tr>
         <td>${i } | <b>작성자</b> 제목자리입니다</td>
      </tr>
      </c:forEach>
   </table>
   </div>
   
   <div>
   <!-- 뒷배경 이미지와 글자색 변경을 위한 복붙 -->
   <c:if test="${boardName == '자유' }">
   <table class="boardTitle FreeImg">
      <tr>
         <td style="width: 200px; border-right: none; border-bottom: none; padding-bottom: 50px;"><font size="6em">${boardName }게시판</font></td>
         <td style="text-align: left; padding-bottom: 35px; border-left: none; border-bottom: none;">
         <font style="padding-right: 10px;" color="gray">자유롭게 대화할 수 있는 공간이에요</font>
         </td>
      </tr> 
      
      <tr>
         <td colspan=2 style="border-top: none; border-bottom: none; ">
         <a href="board.bd?board=${KnowB }">지식게시판</a> | <a href="board.bd?board=${QnAB }">Q&A게시판</a> | <a href="board.bd?board=${GradB }">수료생게시판</a> | <a href="board.bd?board=${QuizB }">퀴즈게시판</a>
         </td>
      </tr>
      
      <tr>
         <td colspan=2 style="border-top: none;">          
         <form action="board.bd?board=${boardConfirm }" method="post">
         <input type="text" name="search" class="searchBoard" placeholder="${boardName}게시판에서 검색">
         <input type="submit" class="searchBoard" value="검색">
         </form>
         </td>
      </tr>
   </table>
   </c:if>
   
   <c:if test="${boardName == '지식' }">
   <table class="boardTitle KnowImg">
      <tr>
         <td style="width: 200px; border-right: none; border-bottom: none; padding-bottom: 50px;"><font size="6em">${boardName }게시판</font></td>
         <td style="text-align: left; padding-bottom: 35px; border-left: none; border-bottom: none;">
         <font style="padding-right: 10px;" color="gray">지식을 공유해 코딩꿈나무들의 꿈을 더 키워주세요!</font>
         </td>
      </tr> 
      
      <tr>
         <td colspan=2 style="border-top: none; border-bottom: none; ">
         <a href="board.bd?board=${FreeB }">자유게시판</a> | <a href="board.bd?board=${QnAB }">Q&A게시판</a> | <a href="board.bd?board=${GradB }">수료생게시판</a> | <a href="board.bd?board=${QuizB }">퀴즈게시판</a>
         </td>
      </tr>
      
      <tr>
         <td colspan=2 style="border-top: none;">          
         <form action="board.bd?board=${boardConfirm }" method="post">
         <input type="text" name="search" class="searchBoard" placeholder="${boardName}게시판에서 검색">
         <input type="submit" class="searchBoard" value="검색">
         </form>
         </td>
      </tr>
   </table>
   </c:if>
   
   <c:if test="${boardName == 'Q&A' }">
   <table class="boardTitle QnAImg">
      <tr>
         <td style="width: 200px; border-right: none; border-bottom: none; padding-bottom: 50px;"><font size="6em">${boardName }게시판</font></td>
         <td style="text-align: left; padding-bottom: 35px; border-left: none; border-bottom: none;">
         <font style="padding-right: 10px;" color="gray">모르는 곳이 있다면 여기에!</font>
         </td>
      </tr> 
      
      <tr>
         <td colspan=2 style="border-top: none; border-bottom: none; ">
         <a href="board.bd?board=${FreeB }">자유게시판</a> | <a href="board.bd?board=${KnowB }">지식게시판</a> | <a href="board.bd?board=${GradB }">수료생게시판</a> | <a href="board.bd?board=${QuizB }">퀴즈게시판</a>
         </td>
      </tr>
      
      <tr>
         <td colspan=2 style="border-top: none;">          
         <form action="board.bd?board=${boardConfirm }" method="post">
         <input type="text" name="search" class="searchBoard" placeholder="${boardName}게시판에서 검색">
         <input type="submit" class="searchBoard" value="검색">
         </form>
         </td>
      </tr>
   </table>
   </c:if>
   
   <c:if test="${boardName == '수료생' }">
   <table class="boardTitle GradImg">
      <tr>
         <td style="width: 200px; border-right: none; border-bottom: none; padding-bottom: 50px;"><font size="6em">${boardName }게시판</font></td>
         <td style="text-align: left; padding-bottom: 35px; border-left: none; border-bottom: none;">
         <font style="padding-right: 10px;" color="gray">수료한 후에도 나의 코딩 친구는 이곳에서!</font>
         </td>
      </tr> 
      
      <tr>
         <td colspan=2 style="border-top: none; border-bottom: none; ">
         <a href="board.bd?board=${FreeB }">자유게시판</a> | <a href="board.bd?board=${KnowB }">지식게시판</a> | <a href="board.bd?board=${QnAB }">Q&A게시판</a> | <a href="board.bd?board=${QuizB }">퀴즈게시판</a>
         </td>
      </tr>
      
      <tr>
         <td colspan=2 style="border-top: none;">          
         <form action="board.bd?board=${boardConfirm }" method="post">
         <input type="text" name="search" class="searchBoard" placeholder="${boardName}게시판에서 검색">
         <input type="submit" class="searchBoard" value="검색">
         </form>
         </td>
      </tr>
   </table>
   </c:if>
   
   <c:if test="${boardName == '퀴즈' }">
   <table class="boardTitle QuizImg">
      <tr>
         <td style="width: 200px; border-right: none; border-bottom: none; padding-bottom: 50px;"><font size="6em">${boardName }게시판</font></td>
         <td style="text-align: left; padding-bottom: 35px; border-left: none; border-bottom: none;">
         <font style="padding-right: 10px;" color="gray">얼마나 성장했나 확인해볼까요?</font>
         </td>
      </tr> 
      
      <tr>
         <td colspan=2 style="border-top: none; border-bottom: none; ">
         <a href="board.bd?board=${FreeB }">자유게시판</a> | <a href="board.bd?board=${KnowB }">지식게시판</a> | <a href="board.bd?board=${QnAB }">Q&A게시판</a> | <a href="board.bd?board=${GradB }">수료생게시판</a>
         </td>
      </tr>
      
      <tr>
         <td colspan=2 style="border-top: none;">          
         <form action="board.bd?board=${boardConfirm }" method="post">
         <input type="text" name="search" class="searchBoard" placeholder="${boardName}게시판에서 검색">
         <input type="submit" class="searchBoard" value="검색">
         </form>
         </td>
      </tr>
   </table>
   </c:if>
   </div>
   <!-- 휴~ 소개 페이지 끝! -->
   
   <div class="write">
   <input type="button" value="글쓰기" style="margin-left: 1155px; border-radius: 100px; width: 220px;" onclick="insert('${boardName}')">
   </div>
   
   <div>   
   <c:forEach var="bd" items="${list }">
        <table border=1 class="boardMain">
            <c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr>
					<td colspan="3" align="center" class="boardTableTitle">등록된 게시글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
					<tr>
		                <td class="boardTableTitle"><b><font size="5">
		                	<a href = "detailList.bd?b_num=${bd.b_num }&ref=${bd.ref }&pageNumber=${pageInfo.pageNumber}&board=${boardName}">${bd.subject }</a></font></b>
		                </td>
		            </tr>
		            
		            <tr>
		                <td colspan=2 class="contentStyle">
		                <div class="boardTableContent">
		                <span>${bd.content }</span>
		               </div>
		               </td>
		            </tr>
		            
		            <tr>
		               <td class="boardTableWriter"><b>${bd.writer }</b></td>
		            </tr>
		            
		            <tr>
		                <td class="boardTableTag" colspan=2>#태그</td>
		            </tr>
			</c:otherwise>
		</c:choose>
        </table>
   </c:forEach>
   </div>
   <center style="margin-bottom: 100px; margin-top: 50px">${pageInfo.pagingHtml}</center>