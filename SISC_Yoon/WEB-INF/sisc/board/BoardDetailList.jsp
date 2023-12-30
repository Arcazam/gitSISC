<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top&bottom/top.jsp"%>

<style>
.detailTable {
	width: 60%;
	margin: auto;
	margin-top: 20px;
	border-collapse: collapse;
	font-family: 'Pretendard-Regular';
}

.detailTable td {
	border: 1px solid #ddd;
}

.detailTable tr:last-child a {
	color: blue;
	text-decoration: none;
	margin-right: 10px;
}

.commentsCount {
	width: 60%;
	margin: auto;
	margin-top: 40px;
	border-collapse: collapse;
	font-family: 'Pretendard-Regular';
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

.replyDesign {
	border-top: none;
	text-decoration: none;
	color: black;
}

.replyDesign:hover {
	text-decoration: none;
	color: #0095FF;
}

/* 문자 사이에 선 긋기 */
.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 12px;
	margin: 8px 0px;
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}
</style>

<!-- 원글 -->
<c:set var="bd" value="${bb}" />
 <div style="">
 
 </div>
	
 <div class="hr-sect">
 
 
 </div>
<table class="detailTable">
	<tr>
		<td height="50px;"><span style="font-size: 2em;">${bd.writer}</span></td>
		<td align="right" height="50px;"><img src="<%=request.getContextPath()%>/resources/images/readcount.png" style="width: 20px; height: 15px;"> ${bd.readcount}</td>
	</tr>
	<tr>
		<td height="50px;" colspan="2">${bd.subject}</td>
	</tr>
	<tr>
		<td height="150px;" colspan="2">${bd.content}</td>
	</tr>
	
	<tr>
		<td colspan=2 align="right">
		<fmt:parseDate var="reg_date" pattern="yyyy-MM-dd" value="${bd.reg_date}"/>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${reg_date}"/>
		</td>
	</tr>
	
	<c:if test="${bd.writer eq mb.id or mb.division eq 'manager'}">
	<tr align="center">
		<td height="20px;" colspan="2">
		<a href="update.bd?b_num=${bd.b_num}&pageNumber=${pageNumber}&board=${bd.b_cate}&writer=${bd.writer}">수정</a>| 
		<a href="delete.bd?b_num=${bd.b_num}">삭제</a>
		</td>
	</tr>
	</c:if>
</table>

<!-- 댓글 수 표시 -->
<table class="commentsCount">
	<tr>
		<td style="height: 10px; background: white;"><b><font size="6">${CommentTotaldSize }개의 댓글</font></b></td>
	</tr>
</table>

<!-- 댓글 -->
<table class="detailTable">
	<c:forEach var="bd2" items="${numCommentsList }">
		<!-- 댓글 내용 표시 -->
		
		<tr>
			<td colspan="4" <c:if test="${bd2.re_level > 1}"> style="background: #f2f2f2; border-bottom: none;" </c:if> <c:if test="${bd2.re_level == 1}"> style="border-bottom: none;" </c:if>>
			${bd2.writer}
			
			<!-- 글쓴이가 댓글을 달면 옆에 작성자라고 알려주기 -->
			<c:if test="${bd.writer eq bd2.writer }">
			<span style="color: #0095FF;">작성자</span>
			</c:if>
			
			<!-- 추천하기 -->
			<c:if test="${bd2.comments_check eq 'O' }">
				<font color="blue">추천됨</font>
			</c:if>
			
			<!-- 로그인한 아이디와 원글 작성자가 같을 때면서 -->
			<c:if test="${bd.writer == mb.id }">
			<!-- 댓글 작성자가 로그인한 아이디가 같지 않을 때 (본인에게 추천하기를 안띄우기 위함)-->
			<c:if test="${bd2.writer != mb.id}">
			
			<c:if test="${bd2.comments_check eq 'X' }">
				<a href="detailList.bd?b_num=${bd.b_num }&ref=${bd.ref }&pageNumber=${pageNumber}&board=${board}&check=check&b_num2=${bd2.b_num}&com_writer=${bd2.writer}">추천하기</a>
			</c:if>
			
			</c:if>
			</c:if>
			
			<!-- 댓글 등록 날짜 보여주기 -->
			<span style="float: right;">
			| <fmt:parseDate var="reg_date" pattern="yyyy-MM-dd" value="${bd.reg_date}"/>
			<fmt:formatDate pattern="yyyy-MM-dd" value="${reg_date}"/>
			</span>
			
			<c:if test="${bd2.writer eq mb.id or mb.division eq 'manager'}">
			<c:if test="${bd2.re_level == 1 }"> <!-- 댓글일 때 지우면 답글까지 전부 삭제 -->
			<a style="float: right;" href="deleteComments.bd?b_num=${bd2.b_num}&pageNumber=${pageNumber}&ref=${bd.ref}&ref2=${bd2.ref2}&orib_num=${bd.b_num}&board=${board}">삭제&nbsp;</a>
			<a id="commentLinkUpdate_${bd2.b_num}" href="#" style="float: right;">수정&nbsp;</a>
			</c:if>
			
			<c:if test="${bd2.re_level == 2 }"> <!-- 답글일 때 지우면 해당 답글만 삭제 -->
			<a style="float: right;" href="deleteReply.bd?b_num=${bd2.b_num}&pageNumber=${pageNumber}&ref=${bd.ref}&orib_num=${bd.b_num}&board=${board}">삭제&nbsp;</a>
			<a id="commentLinkUpdate_${bd2.b_num}" href="#" style="float: right;">수정&nbsp;</a>
			</c:if>
			</c:if>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" style="padding: 0; margin: 0; border-top: none; border-bottom: none;">
			<div id="commentSectionUpdate_${bd2.b_num}" style="display: none;">
				<form action="updateComments.bd" method="post">
					<!-- 여기에 필요한 hidden input들 -->
					<input type="hidden" name="orib_num" value="${bd.b_num }">
					<input type="hidden" name="b_num" value="${bd2.b_num }">
					<input type="hidden" name="ref" value="${bd.ref }">
					<input type="hidden" name="pageNumber" value="${pageNumber }">
					<input type="hidden" name="board" value="${board}">
					
					<textarea style="width: 100%;" rows="3" name="content" style="resize: none;">${bd2.content }</textarea>
					
					<input class="btn btn-success" style="float: right;" type="submit" value="수정">
				</form>
			</div>
			</td>
		</tr>
		<!-- 댓글 수정 클릭 시 텍스트 창 보이도록 하는 JavaScript -->
		<script>
        document.addEventListener('DOMContentLoaded', function () {
            const commentLinkUpdate = document.querySelector('#commentLinkUpdate_${bd2.b_num}');
            const commentSectionUpdate = document.querySelector('#commentSectionUpdate_${bd2.b_num}');
            const contents = document.querySelector('#contents_${bd2.b_num }')
            let isFormVisible = false; // 폼이 표시되었는지 여부를 저장할 변수
            
            commentLinkUpdate.addEventListener('click', function (event) {
            event.preventDefault();
            
         	// 폼이 표시되었으면 숨기고, 표시되지 않았으면 보이도록 설정
            if (isFormVisible) {
            	commentSectionUpdate.style.display = 'none';
                contents.style.display = 'block';
            } else {
            	commentSectionUpdate.style.display = 'block';
                contents.style.display = 'none';
            }
            
            // 폼의 표시 여부를 토글
            isFormVisible = !isFormVisible;
            
         	// 클릭한 후에 밑줄 스타일을 추가하지 않도록 수정
            commentLinkUpdate.style.textDecoration = 'none';
            });
        });
    </script>
		
		<tr>
			<c:if test="${bd2.re_level == 1}">
			<td colspan="4" style="border-top: none;">
			<div id="contents_${bd2.b_num }">
				<a id="commentLink_${bd2.b_num}" href="#" class="replyDesign">
				<span style="font-size: 1.5em;">${bd2.content}</span>
				</a>
			</div>
			</td>
			</c:if>
		
			<c:if test="${bd2.re_level > 1}">
			<td colspan="4" style="background: #f2f2f2; border-top: none;">
			<div id="contents_${bd2.b_num }">
				<img src="<%=request.getContextPath() %>/resources/images/reply.png" style="width: 20px; height: 20px;">
				<span style="font-size: 1.5em;">${bd2.content}</span>
			</div>
			</td>
			</c:if>
		</tr>
		
		<!-- 답글 작성 폼 -->
		<c:if test="${bd2.re_level == 1 }"> <!-- 답글에 답글은 못달게 설정 -->
		<tr>
			<td colspan="4" style="padding: 0; margin: 0; border-top: none; border-bottom: none;">
			<div id="commentSection_${bd2.b_num}" style="display: none;">
				<form action="insertReply.bd" method="post">
					<!-- 여기에 필요한 hidden input들 -->
					<input type="hidden" name="b_num" value="${bd.b_num }">
					<input type="hidden" name="b_cate" value="${bd2.b_cate }">
					<input type="hidden" name="ref" value="${bd.ref }">
					<input type="hidden" name="ref2" value="${bd2.ref2 }">
					<input type="hidden" name="re_level" value="${bd2.re_level }">
					<input type="hidden" name="re_step" value="${bd2.re_step }">
					<input type="hidden" name="pageNumber" value="${pageNumber }">
					<input type="hidden" name="board" value="${board}">
					
					<c:if test="${mb.id == null }">
					<textarea style="width: 100%;" rows="3" name="content" placeholder="로그인을 해야 답글을 작성하실 수 있습니다" style="resize: none;"></textarea>
					</c:if>
					
					<c:if test="${mb.id != null }">
					<textarea style="width: 100%;" rows="3" name="content" placeholder="${mb.id }로 답글 작성" style="resize: none;"></textarea>
					</c:if>
					
					<input class="btn btn-success" style="float: right;" type="submit" value="등록">
				</form>
			</div>
			</td>
		</tr>
		</c:if>
		<!-- 댓글 내용 클릭 시 텍스트 창 보이도록 하는 JavaScript -->
		<script>
        document.addEventListener('DOMContentLoaded', function () {
            const commentLink = document.querySelector('#commentLink_${bd2.b_num}');
            const commentSection = document.querySelector('#commentSection_${bd2.b_num}');
            let isFormVisible = false; // 폼이 표시되었는지 여부를 저장할 변수
            
            commentLink.addEventListener('click', function (event) {
            event.preventDefault();
            
         	// 폼이 표시되었으면 숨기고, 표시되지 않았으면 보이도록 설정
            if (isFormVisible) {
                commentSection.style.display = 'none';
            } else {
                commentSection.style.display = 'block';
            }
            
            // 폼의 표시 여부를 토글
            isFormVisible = !isFormVisible;
            
         	// 클릭한 후에 밑줄 스타일을 추가하지 않도록 수정
            commentLink.style.textDecoration = 'none';
            });
        });
    </script>
	</c:forEach>
</table>

<!-- 페이지 설정 -->
<center>${pageInfo.pagingHtml}</center>

<!-- 댓글 작성 폼 -->
<div class="container">
	<form action="insertComments.bd" method="post"
		style="width: 40%; margin-left: 210px;">
		<input type="hidden" name="b_num" value="${bd.b_num }">
		<input type="hidden" name="b_cate" value="${bd.b_cate }">
		<input type="hidden" name="ref" value="${bd.ref }">
		<input type="hidden" name="board" value="${board}">
		<input type="hidden" name="pageNumber" value="${pageNumber }">
		<br><br>
		<div>
			<div id="commentSection">
				<table class="table">
					<tr>
						<td width="50">
							<c:choose>
								<c:when test="${empty mb.id}">
                                    로그인을 해야 댓글을 작성하실 수 있습니다
                                </c:when>
								<c:otherwise>
                                    ${mb.id}로 댓글 작성
                                </c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td><textarea id="commentText" style="width: 700px; resize: none;" rows="4" cols="30" name="content" placeholder="댓글을 입력하세요"></textarea> <br>
							<div>
								<input class="btn pull-right btn-success" type="submit" value="등록">
							</div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>