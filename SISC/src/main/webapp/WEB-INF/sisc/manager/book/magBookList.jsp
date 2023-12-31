<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../common/common.jsp" %>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SISC Community</title>

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath() %>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath() %>/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="memberList.mag">
                <div class="sidebar-brand-text mx-3">SISC Community </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-table"></i>
                    <span>테이블</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리하기</h6>
                        <a class="collapse-item" href="memberList.mag">사용자 관리</a>
                        <a class="collapse-item" href="boardList.mag">게시판 관리</a>
                        <a class="collapse-item" href="bookList.mag">책방 관리</a>
                        <a class="collapse-item" href="quizList.mag">퀴즈 관리</a>
                        <a class="collapse-item" href="surList.mag">설문 관리</a>
                    </div>
                </div>
            </li>
             <li class="nav-item">
		        <a class="nav-link" href="SiscMain.view">
		            <i class="fas fa-sign-out-alt"></i>
		            <span>로그아웃</span>
		        </a>
		    </li>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- 검색 폼: 게시판 검색 -->
					<form name="magBookSearchForm" method="get" action="bookList.mag" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					    <div class="input-group">
					        <select name="whatColumn" class="form-control bg-light border-0 small">
					            <option value="all">전체검색</option>
								<option value="seller">판매자(아이디)</option>
								<option value="title">제목</option>
								<option value="sellstatus">판매상태</option>	
					        </select>
					        <input type="text" name="keyword" class="form-control bg-light border-0 small" style="display: inline; width: 150px;">
					        <div class="input-group-append">
					            <input type="submit" class="btn btn-primary btn-sm" value="검색">
					        </div>
					    </div>
					</form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                    </ul>
                </nav>
                <center style="margin-top: 10px; margin-bottom: 30px;"><h1>책방 리스트(${pageInfo.totalCount}개)</h1></center>
			<form name="magBookListForm" action="delSelBook.mag">
				<div class="container-fluid">
                    <div class="row">
                    	<table class="table">
						  <thead>
						    <tr align="center">
						      <th>
								  <input type="checkbox" name="allcheck" onClick="allDelete(this)">
							  </th>
						      <th scope="col">책 번호</th>
						      <th scope="col">판매자(아이디)</th>
						      <th scope="col">제목</th>
						      <th scope="col">할인가</th>
						      <th scope="col">거래 방식</th>
						      <th scope="col">거래 장소</th>
						      <th scope="col">판매 상태</th>
						      <th scope="col">삭제</th>
						    </tr>
						  </thead>
						  <tbody>
						  <c:if test="${ !empty book_list }">
							<c:forEach var="bb" items="${ book_list }">
								<tr align="center">
									<td>
										<input type="checkbox" name="rowcheck" value=${ bb.bk_num }>
									</td>
									<td>${ bb.bk_num }</td>
									<td>
										<a href="dListBook.mag?bk_num=${ bb.bk_num }&pageNumber=${ pageInfo.pageNumber }">
											${ bb.seller }
										</a>
									</td>
									<td>${ bb.title }</td>
									<td>
										<fmt:formatNumber value="${ bb.dis_price }" pattern="#,###" /> 원
									</td>
									<td>${ bb.tradeway }</td>
									<td>${ bb.tradeplace }</td>
									<td>${ bb.sellstatus }</td>
									<td>
										<input type="button" value="삭제" class="btn btn-primary" onClick="deleteBook(${ bb.bk_num },'${ pageInfo.pageNumber }')">
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${ empty book_list }">
							<tr align="center">
								<td colspan="9">
									책 정보가 없습니다
								</td>
							</tr>
						</c:if>
						<tr>
							<th align="right" colspan="9">
								<input type="button" class="btn btn-primary" value="선택한 항목 삭제" onClick="selectedDel()">
							</th>
						</tr>
					</table>
                    </div>
                    <center style="margin-top: 30px;">
						${pageInfo.pagingHtml}
					</center>
            </div>
			</form>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
<script src="<%=request.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath() %>/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="<%=request.getContextPath() %>/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath() %>/resources/js/demo/chart-area-demo.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/demo/chart-pie-demo.js"></script>
</body>
</html>

<script type="text/javascript">

	function allDelete(obj) {
	
		check = obj.checked;
	
		rcheck = document.getElementsByName("rowcheck");
	
		if (check) {
			for (var i = 0; i < rcheck.length; i++) {
				rcheck[i].checked = true;
			}
		} else {
			for (var i = 0; i < rcheck.length; i++) {
				rcheck[i].checked = false;
			}
	
		}
	
	}//allDelete
	
	function selectedDel() {
		flag = false;
		rcheck = document.getElementsByName("rowcheck");
		for (var i = 0; i < rcheck.length; i++) {
			if (rcheck[i].checked) {
				flag = true;
			}
		}
		if (!flag) {
			alert('선택할 레코드를 최소한 하나를 선택하셔야 합니다');
			return;
		}
	
		if (confirm('선택한 레코드를 삭제하시겠습니까?')) {
			document.magBookListForm.submit();
		} else {
			return;
		}

	}
	
	function deleteBook(b_num,pageNumber){
		location.href="bookDelete.mag?bk_num="+bk_num+"&pageNumber="+pageNumber;
	}
	
</script>