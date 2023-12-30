<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
    <%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
    <%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<script>
  // 페이지 로드 후 실행되는 스크립트
  document.addEventListener("DOMContentLoaded", function() {
    // 라디오 버튼을 찾아서 비활성화(disabled) 속성을 설정
    var radioButtons = document.getElementsByName("tradeway");
    
    for (var i = 0; i < radioButtons.length; i++) {
      // 비활성화 속성 설정
      radioButtons[i].disabled = true;
    }

    // 선택된 라디오 버튼도 비활성화
    var checkedRadioButton = document.querySelector('input[name="tradeway"]:checked');
    if (checkedRadioButton) {
      checkedRadioButton.disabled = true;
    }
  });
</script>


<style>

#BookDetailForm th {
  width: 130px;
}
table {
        width: 100%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
      }
      th, td {
        border-bottom: 1px solid #444444;
        padding: 10px;
        text-align: center;
      }
  .imageContainer {
    display: flex;
    flex-wrap: wrap;
  }

  .book_img {
    width: 170px;
    height:180px;
    margin-bottom: 20px;
    margin-left : 290px;
    #bookInsertTable th {
}


  .detailContainer {
    margin-left: 20px; /* 오른쪽 여백 조절 */
  }
  
  .form-control {
  width: 100%;
}
.author-publisher-inputs,
.price-inputs {
  display: flex;
  justify-content: space-between;
}
.author-publisher-inputs .form-group,
.price-inputs .form-group {
  flex: 1;
  margin-right: 10px; /* 입력 필드 간의 간격을 조절하려면 조절하세요 */
 
}

#dis_price {
  width: 80%;
}

.author-publisher-inputs .form-group input,
#BookDetailForm input[name="writer"],
#BookDetailForm input[name="publisher"],
#BookDetailForm input[name="dis_price"] {
  width: 80%;
}


</style>

<c:set var="bk" value="${bb}"/>

<div class="container mt-4">
  <div class="row">
    <div class="col-md-3">
      <!-- 왼쪽: 이미지 3행 -->
      <div class="imageContainer">
        <img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bk.b_image1 }">
        <c:choose>
          <c:when test="${not empty bk.b_image2}">
            <img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bk.b_image2 }">
          </c:when>
          <c:otherwise>
            <img class="book_img" src="<%=request.getContextPath()%>/resources/images/no.jpg">
          </c:otherwise>
        </c:choose>
        <c:choose>
          <c:when test="${not empty bk.b_image3}">
            <img class="book_img" src="<%=request.getContextPath()%>/resources/book/${bk.b_image3 }">
          </c:when>
          <c:otherwise>
            <img class="book_img" src="<%=request.getContextPath()%>/resources/images/no.jpg">
          </c:otherwise>
        </c:choose>
      </div>
    </div>
    <div class="col-md-9" style="width: 50%; height: 300px; margin-left: 150px;">
      <!-- 오른쪽: 디테일 -->
 	 <div class="detailContainer">
        <table id= "BookDetailTable"class="detailTable">
        
        <form:form name="BookDetailForm" commandName="bb" action="detail.bk" method="post" enctype="multipart/form-data">
  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <table id="BookDetailForm" class="table table-bordered">
          <tr>
            <th colspan="2" class="text-center">책 상세 사항
              <input type="hidden" name="seller" value="${mb.id}" readonly>
              <input type="hidden" name="seller" value="${bb.bk_num}" readonly>
            </th>
          </tr>
          <tr>
            <th>책 제목</th>
            <td class="author-publisher-inputs">
              <div class="form-group">
              	<input type="text" name="title" class="form-control" style="width: 50%" placeholder="제목을 입력하세요" value="${bb.title}" readonly>
              </div>
            </td>
          </tr>
         <tr>
		  <th>저자</th>
		  <td class="author-publisher-inputs">
		    <div class="form-group">
		      <input type="text" name="writer" id="writer" class="form-control" style="width: 50%" placeholder="작가를 입력하세요" value="${bb.writer}" readonly>
		    </div>
		  </td>
		</tr>
		      <tr>
		  <th>출판사</th>
		  <td class="author-publisher-inputs">
		    <div class="form-group">
		      <input type="text" name="publisher" id="publisher" class="form-control" style="width: 50%" placeholder="출판사를 입력하세요" value="${bb.publisher}" readonly>
		    </div>
		  </td>
		</tr>
          <tr>
  <th>중고판매가</th>
  <td class="price-inputs">
    <div class="form-group">
      <input type="text" name="dis_price" id="dis_price" class="form-control" style="width: 50%" placeholder="판매가를 입력해주세요" value="${bb.dis_price}" readonly>
    </div>
  </td>
</tr>
<tr>
  <th>판매 코멘트</th>
  <td>
    <textarea name="sell_content" class="form-control" rows="5" cols="20" readonly>${bb.sell_content}</textarea>
  </td>
</tr>

          <tr>
            <th>거래 방식</th>
            <td>
              <!-- 라디오 버튼 추가 -->
              <label><input type="radio" name="tradeway" value="직거래" ${bb.tradeway == '직거래' ? 'checked' : ''} readonly> 직거래</label>
              <label><input type="radio" name="tradeway" value="택배" ${bb.tradeway == '택배' ? 'checked' : ''} readonly> 택배</label>
            </td>
          </tr>
          <tr>
            <th>거래 장소</th>
            <td>
              <input type="text" name="tradeplace" class="form-control"   style="width: 40%" placeholder="거래 장소를 입력하세요" value="${bb.tradeplace}" readonly>
            </td>
          </tr>
          <tr>
            <th colspan="2" class="text-center">
   				<a href="update.bk?bk_num=${bk.bk_num}&pageNumber=${pageNumber}">
    			<button type="button" class="btn btn-primary" >수정</button>
			</a>
  				<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.bk?bk_num=${bk.bk_num}&pageNumber=${pageNumber}'">
            </th>
          </tr>
        </table>
      </div>
    </div>
  </div>
</form:form>
        
          <!-- 나머지 내용 -->
          <tr align="center">
        
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
<br><br><br><br><br><br><br><br>