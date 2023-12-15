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
    font-size: 14px; /* 원하는 폰트 크기로 조정하세요 */
  }
.inner {
  position: relative;
  width: 600px;
  height: 40px;
  margin: 20px auto;
  border: 1px solid #bdc1c6;
  border-radius: 20px;
}

.search {
  width: 90%;
  height: 100%;
  border-color: #bdc1c6;
  border: 0px;
  font-size: 16px;
  outline: none;
}

.searching {
  position: absolute;
  left: 10px;
  top: 20%;
}

i:hover {
  cursor: pointer;
}

.icon_ect {
  position: absolute;
  right: 10px;
  top: 20%;
}

.fa-keyboard {
  margin-right: 10px;
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


<center>

  <form action="list.bk" method="get">
    <div class="inner">
      <input type="search"  name="keyword" class="search" placeholder="책 제목을 입력하세요.">
      <div class="searching">
        <i class="fas fa-search"></i>
      </div>
      <div class="icon_ect">
        <i class="fas fa-keyboard"></i>
      </div>
    </div>
      <input type="button" value="추가하기" onclick="insert()">
  </form>
</center>



<div class="container mt-5">
  <div class="row row-cols-1 row-cols-md-4 g-4">
    <!-- 책 아이템 시작 -->
    <div class="col">
      <div class="card">
       <a href="detail.bk"> 
       <img src="<%=request.getContextPath() %>/resources/bookImg/1.jpg" class="card-img-top" alt="Book 1"></a>
        <div class="card-body">
          <h5 class="card-title">한권으로 끝내는 웹 기본 교과서</h5>
          <p class="card-text">Book description goes here.</p>
          <p class="card-text">Book description goes here.</p>
        </div>
      </div>
    </div>
     <div class="col">
      <div class="card">
        <img src="book1.jpg" class="card-img-top" alt="Book 1">
        <div class="card-body">
          <h5 class="card-title">Book Title 1</h5>
          <p class="card-text">Book description goes here.</p>
        </div>
      </div>
    </div>
     <div class="col">
      <div class="card">
        <img src="book1.jpg" class="card-img-top" alt="Book 1">
        <div class="card-body">
          <h5 class="card-title">Book Title 1</h5>
          <p class="card-text">Book description goes here.</p>
        </div>
      </div>
    </div>
    
     <div class="col">
      <div class="card">
        <img src="book1.jpg" class="card-img-top" alt="Book 1">
        <div class="card-body">
          <h5 class="card-title">Book Title 1</h5>
          <p class="card-text">Book description goes here.</p>
        </div>
      </div>
    </div>
    
      <div class="col">
      <div class="card">
        <img src="book1.jpg" class="card-img-top" alt="Book 1">
        <div class="card-body">
          <h5 class="card-title">Book Title 1</h5>
          <p class="card-text">Book description goes here.</p>
        </div>
      </div>
    </div>
    
     <div class="col">
      <div class="card">
        <img src="book1.jpg" class="card-img-top" alt="Book 1">
        <div class="card-body">
          <h5 class="card-title">Book Title 1</h5>
          <p class="card-text">Book description goes here.</p>
        </div>
      </div>
    </div>
     <div class="col">
      <div class="card">
        <img src="book1.jpg" class="card-img-top" alt="Book 1">
        <div class="card-body">
          <h5 class="card-title">Book Title 1</h5>
          <p class="card-text">Book description goes here.</p>
        </div>
      </div>
    </div>
     <div class="col">
      <div class="card">
        <img src="book1.jpg" class="card-img-top" alt="Book 1">
        <div class="card-body">
          <h5 class="card-title">Book Title 1</h5>
          <p class="card-text">Book description goes here.</p>
        </div>
      </div>
    </div>
  </div>
</div>
<center>
${pageInfo.pagingHtml }
</center>

<!-- 부트스트랩 JS 및 팝퍼 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
<br><br><br><br><br>



<%@ include file="../top&bottom/bookBottom.jsp"%>

<script>
	function insert(){
		location.href = "insert.bk"
	}
</script>