<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Object loginInfo = session.getAttribute("loginInfo");
	if(loginInfo == null){%>
		<%@ include file="../top&bottom/top.jsp"%>
	<%}else{%>
		<%@ include file="../top&bottom/topLogin.jsp"%>
	<%}%>

<style>
 .card-title {
    font-size: 20px; /* 원하는 폰트 크기로 조정하세요 */
  }
  .card-text{
  	font-size: 16px;
  }



  .price-line {
    display: inline-block;
    position: relative;
  }

  .price-line::before {
    content: '';
    position: absolute;
    left: 50%;
    bottom: 0;
    width: 100%;
    border-bottom: 2px solid red; /* 빨간색 가로 선 */
    transform: translateX(-50%);
  }


img{
	width: 200px;
	height: 300px;;
}
</style>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Book List</title>
  <!-- 부트스트랩 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-6 text-center">
      <form action="list.bk" method="get" class="d-flex justify-content-center">
        <select name="whatColumn" class="form-select me-2" aria-label="책 검색 조건" style="width: 120px;">
          <option value="title">책 검색</option>
          <option value="writer">저자</option>
        </select>
        <input type="text" name="keyword" class="form-control" placeholder="검색어" style="width: 300px;">
        <button type="submit" class="btn btn-primary">검색</button>
      </form>
    </div>
  </div>
</div>





<div class="container mt-4" style="margin-right: 100px; width: 80%;">
    <div class="row row-cols-1 row-cols-md-4 g-5">
        <!-- 책 아이템 시작 -->
        <c:forEach var="bk" items="${book_list }">
            <table class="boardMain">
                <c:choose>
                    <c:when test="${fn:length(book_list) eq 0}">
                        <tr>
                            <td colspan="3" align="center" class="boardTableTitle">등록된 책이 없습니다</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="2" class="contentStyle">
                                <div class="boardTableContent">
                                    <a href="detail.bk?bk_num=${bk.bk_num }&pageNumber=${pageInfo.pageNumber}">
                                        <img src="<%=request.getContextPath()%>/resources/book/${bk.b_image1 }">
                                    </a>
                                </div>
                            </td>
                        </tr>

   <tr class="card-body">
    <td class="card-title"><b>${bk.title }</b></td>
</tr>
                    </c:otherwise>
                </c:choose>
            </table>
        </c:forEach>
    </div>
</div>


<br><br><br><br><br>

<div class="text-center" style="font-size: 15px; margin-right: 50px">${pageInfo.pagingHtml }</div>SS

<!-- 부트스트랩 JS 및 팝퍼 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
<br><br><br><br><br>



<%@ include file="../top&bottom/bookBottom.jsp"%>