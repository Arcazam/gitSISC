<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null) {
    %>
    <%@ include file="../top&bottom/top.jsp"%>
<%} else{%>
    <%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Book List</title>
    <style>
        .container {
            max-width: 70%;
            margin-left: 400px;
        }

        body {
            padding: 1.5em;
            margin-left: 50px; /* 필요에 따라 조정하세요 */
        }


        table {
            border: 1px #a39485 solid;
            font-size: .9em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
            width: 100%;
            border-collapse: collapse;
            border-radius: 5px;
            overflow: hidden;
            margin-top: 1em;
            margin-left: 0px; /* 필요에 따라 조정하세요 */
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
            border-bottom: 1px solid rgba(0, 0, 0, .1);
            background: #fff;
        }

        a {
            color: #73685d;
        }

        @media all and (max-width: 768px) {
            /* 필요한 경우 미디어 쿼리 스타일 추가 */
        }
    </style>
</head>
<body>
    
<form:form name="BookInsertForm" commandName="bb" action="insert.bk" method="post" enctype="multipart/form-data">
    <div class="container mt-5">
        <div class="col-md-8 mx-auto">
           <table id="bookInsertTable" class="table table-bordered">
          <tr>
            <th colspan="2" class="text-center">책 정보 입력
              <input type="hidden" name="seller" value="${mb.id}" readonly>
              
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
              <input type="hidden" name="seller_pnum_arr" value="${mb.phone}" readonly>
              
              <c:set var="seller_pnum" value="${mb.phone}" />
            <c:set var="seller_pnum_arr" value="${fn:split(seller_pnum, '-')}"/>
            
            <c:set var="seller_pnum1" value="${seller_pnum_arr[0]}" />
            <c:set var="seller_pnum2" value="${seller_pnum_arr[1]}" />
            <c:set var="seller_pnum3" value="${seller_pnum_arr[2]}" />
              <input type="hidden" name="seller_pnum1" size="3" maxlength="3" value="${seller_pnum1}">
              <input type="hidden" name="seller_pnum2" size="4" maxlength="4" value="${seller_pnum2}">
              <input type="hidden" name="seller_pnum3" size="4" maxlength="4" value="${seller_pnum3}">
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
  <th>저자/출판사</th>
  <td class="author-publisher-inputs">
    <div class="form-group">
      <label for="writer">저자</label>
      <input type="text" name="writer" id="writer" class="form-control" placeholder="작가를 입력하세요" value="${bb.writer}">
    </div>
    <div class="form-group">
      <label for="publisher">출판사</label>
      <input type="text" name="publisher" id="publisher" class="form-control" placeholder="출판사를 입력하세요" value="${bb.publisher}">
    </div>
  </td>
</tr>
          <tr>
  <th>중고판매가</th>
  <td class="price-inputs">
    <div class="form-group">
      <label for="dis_price">판매가</label>
      <input type="text" name="dis_price" id="dis_price" class="form-control" placeholder="판매가를 입력해주세요" value="${bb.dis_price}">
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
      </div>
    </div>
  </div>
</form:form>

 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>