<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top&bottom/top.jsp"%>
		
	<style>
	/* 게시판 배경이미지 설정 */
	.FreeImg{
	background-image: url("<%=request.getContextPath() %>/resources/images/자유게시판.png");
	}
	
	.KnowImg{
	background-image: url("<%=request.getContextPath() %>/resources/images/지식게시판.png");
	}
	
	.QnAImg{
	background-image: url("<%=request.getContextPath() %>/resources/images/질문게시판.png");
	}
	
	.GradImg{
	background-image: url("<%=request.getContextPath() %>/resources/images/수료생게시판.png");
	}
	
	/* 버튼 스타일 */
	button {
	    position: relative;
	    display: inline-block;
	    cursor: pointer;
	    outline: none;
	    border: 0;
	    vertical-align: middle;
	    text-decoration: none;
	    background: transparent;
	    padding: 0;
	    font-size: inherit;
	    font-family: inherit;
	    margin-left: 1070px;
	    margin-top: 8px;
	}
	
	button.learn-more {
	    width: 220px;
	    height: auto;
	}
	
	button.learn-more .circle {
	    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	    position: relative;
	    display: block;
	    margin: 0;
	    width: 3rem;
	    height: 3rem;
	    background: #282936;
	    border-radius: 1.625rem;
	}
	
	button.learn-more .circle .icon {
	    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	    position: absolute;
	    top: 0;
	    bottom: 0;
	    margin: auto;
	    background: #fff;
	}
	
	button.learn-more .circle .icon.arrow {
	    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	    left: 0.625rem;
	    width: 1.125rem;
	    height: 0.125rem;
	    background: none;
	}
	
	button.learn-more .circle .icon.arrow::before {
	    position: absolute;
	    content: "";
	    top: -0.29rem;
	    right: 0.0625rem;
	    width: 0.625rem;
	    height: 0.625rem;
	    border-top: 0.125rem solid #fff;
	    border-right: 0.125rem solid #fff;
	    transform: rotate(45deg);
	}
	
	button.learn-more .button-text {
	    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	    position: absolute;
	    top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    padding: 0.50rem 0;
	    margin: 0 0 0 1.85rem;
	    color: #282936;
	    font-weight: 700;
	    line-height: 1.6;
	    text-align: center;
	    text-transform: uppercase;
	}
	
	button:hover .circle {
	    width: 100%;
	}
	
	button:hover .circle .icon.arrow {
	    background: #fff;
	    transform: translate(1rem, 0);
	}
	
	button:hover .button-text {
	    color: #fff;
	}
	
	/* 전체적인 게시판 설정 */
	.boardSet{
	border-collapse: collapse;
	border-radius : 10px;
   	border-style : hidden;
   	box-shadow : 0 0 0 1px #666;
	margin: auto;
	text-align: center;
	width: 1063px;
	height: 200px;
	font-family: 'TAEBAEKfont';
	}
	
	/* 게시판 세부 설정1 - 게시판 이름 */
	.boardSet1{
	width: 200px;
	height:110px;
	padding-bottom: 30px;
	border-right: none;
	border-bottom: none;
	}
	
	/* 게시판 세부 설정2 - 게시판 설명 */
	.boardSet2{
	text-align: left;
	padding-bottom: 18px;
	border-left: none;
	border-bottom: none;
	}
	
	/* 게시판 세부 설정3 - select option 설정 */
	.boardSet3{
	width: 100px;
	height: 40px;
	font-size: 15px;
	border-radius: 10px;
	background-color : rgb(255,255,255,0.4);
	color: black;
	}
	
	/* 게시물 검색 설정 */
	.searchBoard{
	border-radius: 10px;
	height: 40px;
	font-size: 20px;
	background-color : rgb(255,255,255,0.4);
	}
	
	/* 게시판 세부 설정4 - submit 설정 */
	.boardSet4{
	width: 100px;
	height: 40px;
	font-size: 20px;
	border-radius: 10px;
	background-color : rgb(255,255,255,0.4);
	color: black;
	}
	
	/* 게시글 설정 */
	.boardMain{
	border-collapse: collapse;
	border-radius : 10px;
   	border-style : hidden;
   	box-shadow : 0 0 0 1px #666;
	margin: auto;
	margin-top: 7px;
	width: 600px;
	height: 100px;
	}
	
	/* 게시글 제목 td 설정 */
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
	
	/* 게시글 내용 div 설정 */
	.boardTableContent{
	overflow: hidden;
  	text-overflow: ellipsis;
  	display: -webkit-box;
  	-webkit-line-clamp: 2;
  	-webkit-box-orient: vertical;
	}
	
	/* 게시글 작성자 td 설정 */
	.boardTableWriter{
	padding-left: 20px;
	height: 30px;
	border-top: none;
  	border-bottom: none;
	}
	
	/* 게시글 태그 td 설정 */
	.boardTableTag{
	padding-left: 20px;
	padding-right: 20px;
	height: 30px;
	border-top: none;
	border-bottom: none;
	}
	
	/* 게시판 왼쪽 태그테이블 설정 */
	.boardTag{
	border-collapse: collapse;
	border-radius : 10px;
   	border-style : hidden;
   	box-shadow : 0 0 0 1px #666;
   	margin-top: 10px;
   	width: 220px;
   	height: 400px; 
	}
	
	/* 게시판 오른쪽 핫게시물 테이블 설정 */
	.boardHot{
	border-collapse: collapse;
	border-radius : 10px;
   	border-style : hidden;
   	box-shadow : 0 0 0 1px #666;
   	margin-top: 10px;
   	width: 220px;
   	height: 400px;
	}
	
	/* 태그랑 핫 게시물 마우스스크롤 설정 */
	.floating-left {
  	position: absolute; 
  	left: 50%;
  	top: 355px; 
  	margin-left: -531px;
  	text-align:center;
  	width: 120px;
  	transition: top 0.3s ease-in-out;
	}
	.floating-right {
  	position: absolute; 
  	right: 50%;
  	top: 355px; 
  	margin-right: -431px;
  	text-align:center;
  	width: 120px;
  	transition: top 0.3s ease-in-out;
	}
	
	</style>
	
	<script>
	  window.addEventListener('scroll', function () {
	    var leftElement = document.querySelector('.floating-left');
	    var rightElement = document.querySelector('.floating-right');
	    var scrollPosition = window.scrollY;

	    // Adjust the top position based on scroll position
	    if (scrollPosition > 200) {
	      leftElement.style.top = scrollPosition + 100 + 'px';
	      rightElement.style.top = scrollPosition + 100 + 'px';
	    } else {
	      leftElement.style.top = '355px';
	      rightElement.style.top = '355px';
	    }
	  });
	  
	  function submitForm() {
          var keywordValue = document.getElementById('keyword').value;
          // 원하는 작업 수행 (예: 검색 결과 표시)
          console.log(keywordValue);
      }
	</script>
	
	<!-- 이 위부터는 style과 javascript 설정입니다 -->
	
	<div style="padding-top: 40px;">
	</div>
	
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
	<table class="boardSet FreeImg">
		<tr>
			<td class="boardSet1"><font size="6em" color="black">${boardName }게시판</font></td>
			<td class="boardSet2">
			<font style="padding-right: 10px; color: #5D5D5D;" size="4">자유롭게 대화할 수 있는 공간이에요!</font>
			</td>
		</tr> 
		
		<tr>
			<td colspan=2 style="border-top: none;">		    
			<form action="board.bd?board=${boardConfirm }" method="post">
			<%String [] columns = {"all", "writer", "subject", "content"};
    		String [] values = {"제목+내용", "작성자", "제목", "내용"};%>
			<c:set var="column" value="<%= columns %>"/>
			<c:set var="value" value="<%= values %>"/>
    		<select name="whatColumn" class="boardSet3">
    			<c:forEach var="i" begin="0" end="${fn:length(column)-1 }" step="1">
    				<option value="${column[i] }">${value[i] }
    			</c:forEach>
    		</select>
    		<input type="text" name="keyword" class="searchBoard" placeholder="${boardName}게시판에서 검색">  
			</form>
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${boardName == '지식' }">
	<table class="boardSet KnowImg">
		<tr>
			<td class="boardSet1"><font size="6em" color="white">${boardName }게시판</font></td>
			<td class="boardSet2">
			<font style="padding-right: 10px; color: #5D5D5D;" size="4">지식을 공유해 코딩꿈나무들의 꿈을 더 키워주세요!</font>
			</td>
		</tr> 
		
		<tr>
			<td colspan=2 style="border-top: none;">		    
			<form action="board.bd?board=${boardConfirm }" method="post">
			<%String [] columns = {"all", "writer", "subject", "content"};
    		String [] values = {"제목+내용", "작성자", "제목", "내용"};%>
			<c:set var="column" value="<%= columns %>"/>
			<c:set var="value" value="<%= values %>"/>
    		<select name="whatColumn" class="boardSet3">
    			<c:forEach var="i" begin="0" end="${fn:length(column)-1 }" step="1">
    				<option value="${column[i] }">${value[i] }
    			</c:forEach>
    		</select>
    		<input type="text" name="keyword" class="searchBoard" placeholder="${boardName}게시판에서 검색">   
			</form>
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${boardName == 'QnA' }">
	<table class="boardSet QnAImg">
		<tr>
			<td class="boardSet1"><font size="6em" color="black">${boardName }게시판</font></td>
			<td class="boardSet2">
			<font style="padding-right: 10px; color: #5D5D5D;" size="4">유익한 답변이 질문을 기다리고 있어요!</font>
			</td>
		</tr> 
		
		<tr>
			<td colspan=2 style="border-top: none;">		    
			<form action="board.bd?board=${boardConfirm }" method="post">
			<%String [] columns = {"all", "writer", "subject", "content"};
    		String [] values = {"제목+내용", "작성자", "제목", "내용"};%>
			<c:set var="column" value="<%= columns %>"/>
			<c:set var="value" value="<%= values %>"/>
    		<select name="whatColumn" class="boardSet3">
    			<c:forEach var="i" begin="0" end="${fn:length(column)-1 }" step="1">
    				<option value="${column[i] }">${value[i] }
    			</c:forEach>
    		</select>
    		<input type="text" name="keyword" class="searchBoard" placeholder="${boardName}게시판에서 검색">  
			</form>
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${boardName == '수료생' }">
	<table class="boardSet GradImg">
		<tr>
			<td class="boardSet1"><font size="6em" color="black">${boardName }게시판</font></td>
			<td class="boardSet2">
			<font style="padding-right: 10px; color: #5D5D5D;" size="4">나의 코딩 친구는 언제나 이곳에!</font>
			</td>
		</tr> 
		
		<tr>
			<td colspan=2 style="border-top: none;">		    
			<form action="board.bd?board=${boardConfirm }" method="post">
			<%String [] columns = {"all", "writer", "subject", "content"};
    		String [] values = {"제목+내용", "작성자", "제목", "내용"};%>
			<c:set var="column" value="<%= columns %>"/>
			<c:set var="value" value="<%= values %>"/>
    		<select name="whatColumn" class="boardSet3">
    			<c:forEach var="i" begin="0" end="${fn:length(column)-1 }" step="1">
    				<option value="${column[i] }">${value[i] }
    			</c:forEach>
    		</select>
    		<input type="text" name="keyword" class="searchBoard" placeholder="${boardName}게시판에서 검색">
			</form>
			</td>
		</tr>
	</table>
	</c:if>
	</div>
	<!-- 휴~ 소개 페이지 끝! -->
	
	<div style="margin-bottom: 1px;">
	<button class="learn-more" type="button" onclick="insert()">
	<span class="circle" aria-hidden="true">
		<span class="icon arrow"></span>
	</span>
	<a href="insert.bd?board=${boardConfirm }"><span class="button-text">${boardName}게시판 글쓰기</span></a>
	</button>
	</div>
	
	<div>
	<c:if test="${fn:length(list) == 0 }">
		<table border=1 class="boardMain">
			<tr>
				<td style="text-align: center;"><b><font size="6">게시글이 아직 존재하지 않습니다</font></b></td>
			</tr>
		</table>
	</c:if>
	
	<c:forEach var="bd" items="${list }">
		<table border=1 class="boardMain">		
            <tr>
                <td class="boardTableTitle"><b><span style="font-size: 2.5em;"><a href = "detailList.bd?b_num=${bd.b_num }&ref=${bd.ref }&pageNumber=${pageInfo.pageNumber}&board=${boardConfirm}">${bd.subject }</a></span></b></td>
            </tr>
            
            <tr>
            	<td class="boardTableWriter"><a><b>${bd.writer }</b></a></td>
            </tr>
            
			<c:if test="${bd.taglist eq '태그없음'}">
            <tr>
            	<td class="boardTableTag" colspan=2>
            	작성된 태그가 없습니다
            	</td>
            </tr>
            </c:if>
            
            <c:if test="${bd.taglist != '태그없음'}">
            <c:set var="splitTag" value="${fn:split(bd.taglist, '-')}"/>
            <tr>
                <td class="boardTableTag" colspan=2>
                <c:forEach var="tag" items="${splitTag }">
                	 #${tag }&nbsp;&nbsp;
                </c:forEach>
                </td>
            </tr>
            </c:if>
        </table>
        <br>
        </c:forEach>
	</div>
	
	<center>
    	${pageInfo.pagingHtml }
    </center>