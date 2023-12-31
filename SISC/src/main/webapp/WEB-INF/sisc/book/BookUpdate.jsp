<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<%
Object loginInfo = session.getAttribute("loginInfo");
if (loginInfo == null) {
    %>
    <%@ include file="../top&bottom/top.jsp"%>
<%} else {
    %>
    <%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Book Update</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/kfonts2.css" rel="stylesheet">
    <style>
    
  
        #BookUpdateForm {
            margin: 0 auto;
            width: 90%; /* 전체 너비 조절 */
            display: flex; /* Flexbox 설정 */
            flex-direction: row; /* 수평으로 정렬 */
            justify-content: center; /* 가운데 정렬 추가 */
            margin-left: 200px;
        }

        .images-container {
            display: flex;
            flex-direction: column;
            align-items: center; /* 이미지를 수직 방향으로 가운데 정렬 */
            margin-right: 20px; /* 이미지와 폼 사이 여백 조절 */
        }

        .images-container img {
            width: 200px;
            height: 230px;
            margin-bottom: 10px;
        }

        .updateContainer {
            width: 50%; /* 오른쪽 테이블 영역 너비 조절 */
        }

        table {
            border: 1px #a39485 solid;
            font-size: .9em;
            box-shadow: 0 2px 5px rgba(0,0,0,.25);
            width: 100%;
            border-collapse: collapse;
            border-radius: 5px;
            overflow: hidden;
        }

        th {
            text-align: left;
        }

        thead {
            font-weight: bold;
            color: #fff;
            background: #73685d;
        }

        td, th {
            padding: 1em .5em;
            vertical-align: middle;
        }

        td {
            border-bottom: 1px solid rgba(0,0,0,.1);
            background: #fff;
        }

        @media all and (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            th {
                text-align: right;
            }

            table {
                position: relative;
                padding-bottom: 0;
                border: none;
                box-shadow: 0 0 10px rgba(0,0,0,.2);
            }

            thead {
                float: left;
                white-space: nowrap;
            }

            tbody {
                overflow-x: auto;
                overflow-y: hidden;
                position: relative;
                white-space: nowrap;
            }

            tr {
                display: inline-block;
                vertical-align: top;
            }

            th {
                border-bottom: 1px solid #a39485;
            }

            td {
                border-bottom: 1px solid #e5e5e5;
            }
        }

        #BookUpdateForm img {
            width: 200px;
            height: 230px;
            margin: 10px;
        }

        #BookUpdateForm .updateContainer {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
             margin-left: 50px; /* 왼쪽 여백 조절 */
    		margin-right: 10px; /* 오른쪽 여백 조절 */
        }
        
  #BookUpdateForm .container {
    margin-right: 20px; /* 오른쪽 여백 조절 */
}

#BookUpdateForm .images-container,
#BookUpdateForm .updateContainer {
    margin-right: 20px; /* 오른쪽 여백 조절 */
}
    </style>
</head>
<body>

<c:set var="bk" value="${bb}"/>

<div id="BookUpdateForm">
    <div class="images-container">
        <img src="<%=request.getContextPath()%>/resources/book/${bk.b_image1 }">
        <c:choose>
            <c:when test="${not empty bk.b_image2}">
                <img src="<%=request.getContextPath()%>/resources/book/${bk.b_image2 }">
            </c:when>
            <c:otherwise>
                <img src="<%=request.getContextPath()%>/resources/images/no.jpg">
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${not empty bk.b_image3}">
                <img src="<%=request.getContextPath()%>/resources/book/${bk.b_image3 }">
            </c:when>
            <c:otherwise>
                <img src="<%=request.getContextPath()%>/resources/images/no.jpg">
            </c:otherwise>
        </c:choose>
    </div>

    <div class="updateContainer">
        <form:form name="BookUpdate" commandName="bookBean" action="update.bk" method="post" enctype="multipart/form-data">
        <table class="table table-bordered" style="width: 70%;">
          <tr>
            <th colspan="2" class="text-center">책 정보 입력
              <input type="hidden" name="seller" value="${mb.id}" readonly>
                 <input type="hidden" name="bk_num" value="${bk_num}">
              
            </th>
          </tr>
          <tr>
            <th>책 사진</th>
            <td>
              <b>책의 사진은 최대 3장의 사진을 올리실수 있습니다</b><br>
              1)겉표지 <input type="file" name="upload1"><br>
              2)내부1 <input type="file" name="upload2"><br>
              3)내부2 <input type="file" name="upload3"><br>
              <font color="red"><b>책의 표지가 잘 나와야하고, 화질이 너무 흐릿한 사진을 올려서는 안됩니다</b></font>
              <c:set var="seller_pnum" value="${mb.phone}" />
             
              <input type="text" name="seller_pnum_arr" value="${mb.phone}" readonly>
              
            </td>
          </tr>
          <!-- 나머지 부분 추가 -->
          <tr>
            <th>책 제목</th>
            <td>
              <input type="text" name="title" class="form-control" style="width: 50%" placeholder="제목을 입력하세요" value="${bb.title}">
            </td>
          </tr>
      <tr>
  <th style="width: 10%;">저자/출판사</th>
  <td class="author-publisher-inputs" style="width: 50%;">
    <div class="form-group" style="width: 50%; display: inline-block;">
      <label for="writer">저자</label>
      <input type="text" name="writer" id="writer" class="form-control" placeholder="작가를 입력하세요" value="${bb.writer}">
    </div>
    <div class="form-group" style="width: 50%; display: inline-block;">
      <label for="publisher">출판사</label>
      <input type="text" name="publisher" id="publisher" class="form-control" placeholder="출판사를 입력하세요" value="${bb.publisher}">
    </div>
  </td>
</tr>
<tr>
  <th>중고판매가</th>
  <td class="price-inputs" style="width: 50%;">
    <div class="form-group" style="width: 50%; display: inline-block;">
      <label for="dis_price">판매가</label>
      <input type="text" name="dis_price" id="dis_price" class="form-control" placeholder="판매가를 입력해주세요" value="${bb.dis_price}" style="width: 70%;">
    </div>
  </td>
</tr>
<tr>
  <th>판매 코멘트</th>
  <td>
    <textarea name="sell_content" class="form-control" rows="10" cols="10">${bb.sell_content}</textarea>
  </td>
</tr>
          <tr>
            <th>거래 방식</th>
            <td>
              <!-- 라디오 버튼 추가 -->
              <label><input type="radio" name="tradeway" value="직거래" ${bb.tradeway == '직거래' ? 'checked' : ''}> 직거래</label>
              <label><input type="radio" name="tradeway" value="택배" ${bb.tradeway == '택배' ? 'checked' : ''}> 택배</label>
            </td>
          </tr>
          <tr>
            <th>거래 장소</th>
            <td>
              <input type="text" name="tradeplace" class="form-control"   style="width: 40%" placeholder="거래 장소를 입력하세요" value="${bb.tradeplace}">
            </td>
          </tr>
          <tr>
            <th colspan="2" class="text-center">
              <input type="submit" value="판매등록" class="btn btn-primary" onClick="return checkBook()">
              <input type="reset" value="취 소" class="btn btn-secondary">
          </th>
          </tr>
        
     </table>
          </form:form>
    </div>
</div>

<!-- 부트스트랩 JS 및 팝퍼 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
<%@ include file="../top&bottom/bookBottom.jsp"%>