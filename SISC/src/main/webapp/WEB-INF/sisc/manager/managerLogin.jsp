<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

	#ManagerLoginTable {
		margin: 0 auto;
		width: 40%;
		border-spacing : none; 
	}
	
	#ManagerLoginTable th {
		background-color : blue;
		color : yellow;
	}
* { padding: 0; margin: 0; }

html, body {
  height: 100%;
  background: #ffffff;
}

#container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  height: 100%;
}

#loginBox {
  width: 300px;
  text-align: center;
  background-color: #ffffff;
}
.input-form-box {
  border: 0px solid #ff0000;
  display: flex;
  margin-bottom: 5px;
}
.input-form-box > span {
  display: block;
  text-align: left;
  padding-top: 5px;
  min-width: 65px;
}
.button-login-box {
  margin: 10px 0;
}
#loginBoxTitle {
  color:#000000;
  font-weight: bold;
  font-size: 32px;
  text-transform: uppercase;
  padding: 5px;
  margin-bottom: 20px;
  background: linear-gradient(to right, #270a09, #8ca6ce);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
#inputBox {
  margin: 10px;
}

#inputBox button {
  padding: 3px 5px;
}
</style>

<script>

	function check(){
		
		if($('input[name="manager_id"]').val()=="" || $('input[name="manager_pw"]').val()==""){
			alert('관리자 계정정보를 입력하셔야합니다');
			$('input[name="manager_id"]').focus();
			return false;
		}
		
	}
	
	function alertAccount(){
		alert('관리자 계정정보는 상위관리자에게 문의해주세요!\n관리자 전화번호(010-0000-0000)');
	}

</script>
<%
	application.setAttribute("flag", false);
	System.out.println("flag값"+application.getAttribute("flag"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- 나의 스타일 추가 -->
    <link rel="stylesheet" href="css/login.css?v=1234">
</head>
<body class="text-center">
    <!--  html 전체 영역을 지정하는 container -->
    <div id="container">
        <!--  login 폼 영역을 : loginBox -->
        <form name="ManagerLoginForm" action="manager_login.mag" method="post">
            <div id="loginBox">
                <!-- 로그인 페이지 타이틀 -->
                <div id="loginBoxTitle">SISC Community Login</div>
                <!-- 아이디, 비번, 버튼 박스 -->
                <div id="inputBox">
                    <div class="input-form-box">
                        <span>아이디 </span>
                        <input type="text" id="input_ID" name="manager_id" class="form-control">
                    </div>
                    <div class="input-form-box">
                        <span>비밀번호 </span>
                        <input type="password" id="input_PW" name="manager_pw" class="form-control">
                    </div>
                    <div class="button-login-box">
                        <input type=submit class="btn btn-primary" value="관리자 로그인" onClick="return check()" style="margin-bottom: 10px; width: 235px;">
						<input type=button class="btn btn-primary" value="관리자 아이디/비밀번호 찾기" onClick="alertAccount()">
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>