<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<style>
    .detailTable {
        width: 40%;
        margin: auto;
        margin-top: 50px;
        border-collapse: collapse;
        font-family: 'Pretendard-Regular';
    }

    .detailTable td {
        border: 1px solid #ddd;
        padding: 10px;
    }

    .detailTable tr:first-child {
        background-color: #f2f2f2;
    }

    .detailTable tr:last-child a {
        color: blue;
        text-decoration: none;
        margin-right: 10px;
    }
    
    @font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	a{
		color: black;
	}
	
</style>

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>


<c:set var="bd" value="${bb}"/>
<table class="detailTable">
    <tr>
        <td height="50px;">${bd.writer}</td>
        <td align="right" height="50px;">조회수 ${bd.readcount}</td>
    </tr>
    <tr>
        <td colspan="2" style="font-size: 20px;">${bd.b_cate}</td>
    </tr>
    <tr>
        <td height="50px;" colspan="2">${bd.subject}</td>
    </tr>
    <tr>
        <td height="150px;" colspan="2">${bd.content}</td>
    </tr>
    <tr align="center">
        <td height="20px;" colspan="2">
            <a href="update.bd?b_num=${bd.b_num}&pageNumber=${pageNumber}&board=${bd.b_cate}&writer=${bd.writer}">수정</a>|
            <a href="delete.bd?b_num=${bd.b_num}&pageNumber=${pageNumber}&board=${bd.b_cate}">삭제</a>
        </td>
    </tr>
</table>

<table class="detailTable">
<c:forEach var="bd2" items="${numCommentsList}">
        <!-- 댓글 내용 표시 -->
        <tr>
        	<td colspan="4">
        		작성자: ${bd2.writer}
        		<a style="float: right;" href="deleteComments.bd?b_num=${bd2.b_num}&pageNumber=${pageNumber}&ref=${bd2.ref}&originalb_num=${originalb_num}">삭제</a>
                
        	</td>
        </tr>
         <tr>
        	<td colspan="4">
        		<c:set var = "wid" value="0"/>
				<c:if test="${bd2.re_level > 0}">
					<c:set var = "wid" value="${bd2.re_level * 20}"/>
						<c:set var = "wid" value="${bd2.re_level * 20}"/>
						<img src="<%=request.getContextPath() %>/resources/images/level.gif" width="${wid }">
						<img src="<%=request.getContextPath() %>/resources/images/re.gif">
					</c:if>
        		${bd2.content}
        	</td>
        </tr>
        <!-- 댓글 작성 폼 -->
        <tr>
            <td colspan="4">
                <a id="commentLink_${bd2.b_num}" href="#">댓글달기</a>
                <div id="commentSection_${bd2.b_num}" style="display: none;">
                    <form action="insertComments2.bd" method="post">
                        <!-- 여기에 필요한 hidden input들 -->
                        <input type="hidden" name = "b_num" value="${bd.b_num }">
				        <input type="hidden" name = "b_cate" value="${bd.b_cate }">
				        <input type="hidden" name = "writer" maxlength="10" value="${bd.writer }">
				        <input type="hidden" name = "subject" maxlength="50" value="${bd.subject }">
				        <input type="hidden" name = "pageNumber" value="${pageNumber }">
				        <input type="hidden" name = "ref" value="${bd.ref }">
				        <input type="hidden" name = "re_level" value="${bd2.re_level }">
				        <input type="hidden" name = "re_step" value="${bd.re_step }">
				        <input type="hidden" name = "id" value="${mb.id }">
				        
                        <textarea style="width: 100%;" rows="3" name="content" placeholder="댓글을 입력하세요"></textarea>
                        <input class="btn btn-success" type="submit" value="등록">
                    </form>
                </div>
            </td>
        </tr>
    <!-- 댓글 달기 클릭 시 텍스트 창 보이도록 하는 JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const commentLink_${bd2.b_num} = document.querySelector('#commentLink_${bd2.b_num}');
            const commentSection_${bd2.b_num} = document.querySelector('#commentSection_${bd2.b_num}');

            commentLink_${bd2.b_num}.addEventListener('click', function (event) {
                event.preventDefault();
                commentSection_${bd2.b_num}.style.display = 'block';
            });
        });
    </script>
</c:forEach>
    </table>
    
<div class="container" style = "margin-left: 850px;">
    <form action="insertComments.bd" method="post" style="width: 40%; margin-left: 210px;">
        <input type="hidden" name = "pageNumber" value="${pageNumber }">
        <input type="hidden" name = "board" value="${bd.b_cate}">
        <input type="hidden" name = "re_level" value="${bd.re_level}">
        <br><br>
        <div>
            <div id="commentSection" style="display: none;">
                <table class="table">
                    <tr>
                        <td width="50">작성자 :
                            <c:choose>
                                <c:when test="${empty mb.name}">
                                    로그인을 해야 댓글을 쓸수 있습니다
                                </c:when>
                                <c:otherwise>
                                    ${mb.name}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="commentText" style="width: 700px;" rows="3" cols="30" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                               <input class="btn pull-right btn-success" type="submit" value="등록">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</div>
   <center >${pageInfo.pagingHtml}</center>
<div class="container">
    <form action="insertComments.bd" method="post" style="width: 40%; margin-left: 210px;">
        <input type="hidden" name = "b_num" value="${bd.b_num }">
        <input type="hidden" name = "b_cate" value="${bd.b_cate }">
        <input type="hidden" name = "writer" maxlength="10" value="${bd.writer }">
        <input type="hidden" name = "subject" maxlength="50" value="${bd.subject }">
        <input type="hidden" name = "pageNumber" value="${pageNumber }">
        <input type="hidden" name = "ref" value="${bd.ref }">
        <input type="hidden" name = "re_level" value="${bd.re_level }">
        <input type="hidden" name = "re_step" value="${bd.re_step }">
        <input type="hidden" name = "id" value="${mb.id }">
        <input type="hidden" name = "board" value="${bd.b_cate}">
        <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div id="commentSection">
                <table class="table">
                    <tr>
                        <td width="50">작성자 :
                            <c:choose>
                                <c:when test="${empty mb.name}">
                                    로그인을 해야 댓글을 쓸수 있습니다
                                </c:when>
                                <c:otherwise>
                                    ${mb.name}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="commentText" style="width: 700px" rows="3" cols="30" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                               <input class="btn pull-right btn-success" type="submit" value="등록">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const commentLink = document.querySelector('#commentLink');
        const commentSection = document.querySelector('#commentSection');

        commentLink.addEventListener('click', function (event) {
            event.preventDefault(); // 링크의 기본 동작 방지
            commentSection.style.display = 'block'; // 텍스트 창 보이기
        });
    });
</script>
