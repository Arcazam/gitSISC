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
					<div id="loginBoxTitle" style="font-size: 30px; margin-left: 45%;">Quiz Detail</div>
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
			<form name="magQuizUpdateForm" method="post" action="quizUpdate.mag">
				<input type="hidden" name="qz_num" value="${ qz_num }">
				<input type="hidden" name="que_cate" value="${ qb.que_cate }">
				<div class="container-fluid">
                    <div class="row">
                    	<table class="table" style="width: 50%; margin: auto; margin-top: 50px;">
                    		<tr>
			<th colspan=2>${ quizCate } 카테고리 ${ qz_num } 번 퀴즈 수정</th>
				</tr>
				<tr>
					<th>질문</th>
					<td>
						<input type="text" name="question" placeholder="질문을 입력해주세요" value="${ qb.question }">
					</td>
				</tr>
				<tr>
					<th>질문 선택지</th>
					<td id="quizOptionsContainer">
						<div id="plusSelectOption">
							<div>
								보기1 : <input type="text" size="50" name="qz_view1" placeholder="선택지1" value="${ qz_view1 }"><br>
							</div>
							<div>
								보기2 : <input type="text" size="50" name="qz_view2" placeholder="선택지2" value="${ qz_view2 }"><br>
							</div>
							<div>
								보기3 : <input type="text" size="50" name="qz_view3" placeholder="선택지3" value="${ qz_view3 }"><br>
							</div>
							<div>
								보기4 : <input type="text" size="50" name="qz_view4" placeholder="선택지4" value="${ qz_view4 }"><br>
							</div>
						</div>
						<div id="plusMinusButton" style="margin-top: 10px; text-align: center;">
							<input type="button" class = "btn btn-info" value="선택지 추가" onclick="addOption()">
		            		<input type="button" class = "btn btn-danger" value="선택지 삭제" onclick="removeLastOption()">
						</div>
					</td>
				</tr>
				<tr>
					<th>답</th>
					<td>
						<input type="text" name="answer" placeholder="답을 입력해주세요" value="${ qb.answer }">
					</td>		
				</tr>
				<tr>
					<th>해설</th>
					<td>
						<textarea name="interpre" cols="60" rows="10" style="resize: none;">${ qb.interpre }</textarea>
					</td>
				</tr>
				<tr>
					<th colspan=2 style="text-align: center;">
						<input type="submit" class = "btn btn-primary" value="수정하기" onClick="return check()">			
					</th>
				</tr>
					</table>
                    </div>
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

	function check(){
		
		if($('input[name="question"]').val()==""){
			alert('질문을 입력해주세요');
			$('input[name="question"]').focus();
			return false;
		}
		
		if($('input[name="qz_view1"]').val()==""){
			alert('선택지1을 입력해주세요');
			$('input[name="qz_view1"]').focus();
			return false;
		}
		
		if($('input[name="qz_view2"]').val()==""){
			alert('선택지2를 입력해주세요');
			$('input[name="qz_view2"]').focus();
			return false;
		}
		
		if($('input[name="qz_view3"]').val()==""){
			alert('선택지3을 입력해주세요');
			$('input[name="qz_view3"]').focus();
			return false;
		}
		
		if($('input[name="qz_view4"]').val()==""){
			alert('선택지4를 입력해주세요');
			$('input[name="qz_view4"]').focus();
			return false;
		}
		
		if($('input[name="answer"]').val()==""){
			alert('답을 입력해주세요');
			$('input[name="answer"]').focus();
			return false;
		}
		
		if($('textarea[name="interpre"]').val()==""){
			alert('답을 입력해주세요');
			$('textarea[name="answer"]').focus();
			return false;
		}
		
	}
	
	// 선택지 추가
    function addOption() {
        var container = document.getElementById("plusSelectOption");
        var optionCount = container.getElementsByTagName("div").length;

        // 최대 4개의 선택지까지만 추가 가능
        if (optionCount >= 4) {
            alert("최대 4개의 선택지까지만 추가할 수 있습니다.");
            return;
        }
 
        var newOption = document.createElement("div");
        newOption.innerHTML = "보기" + (optionCount + 1) + " : <input type='text' size='50' name='qz_view" + (optionCount + 1) + "' placeholder='선택지" + (optionCount + 1) + "'><br>";

        container.appendChild(newOption);
    }

    // 마지막 선택지 삭제
    function removeLastOption() {
        var container = document.getElementById("plusSelectOption");
        var optionCount = container.getElementsByTagName("div").length;

        // 선택지가 2개 이상이어야 삭제 가능
        if (optionCount > 1) {
            container.removeChild(container.lastChild);
        } else {
            alert("최소 1개의 선택지가 있어야 합니다.");
        }
    }

</script>