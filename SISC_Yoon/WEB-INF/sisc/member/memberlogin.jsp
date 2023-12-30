<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
@font-face {
   font-family: 'TAEBAEKfont';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/TAEBAEKfont.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

.login{
margin: auto;
margin-top: 100px;
border-collapse: collapse;
text-align: center;
font-family: 'TAEBAEKfont';
}

.textSize{
width: 200px;
height: 35px;
}

input[type="submit"]:hover {
    color: 40CFFF;
}

#find {
   text-decoration-line: none;
   color: black;
}

#find:hover{
	color: #0095FF
}

#join {
   text-decoration-line: none;
   color: #0095FF;
}

#join:hover {
    color: black;
}
</style>


<form name="loginForm" action="login.mb" method="post">
	<table class="login">
		<tr>
			<td><img class="logo" src="<%=request.getContextPath()%>/resources/images/logo.jpg" style="width:300px; height: 150px;"></td>
		</tr>
		
		<tr>
			<td style="padding-top: 10px;"><font size="6">SISC라는 이름의 나의 든든한 코딩친구!</font></td>
		</tr>
		
		<tr>
			<td style="padding-top: 10px;"><font color="gray">SISC커뮤니티가 처음이시라면 아래 <font color="#0095FF">회원가입</font>을 진행해주세요!</font></td>
		</tr>
	
		<tr>
			<td style="padding-top: 30px;"><input type="text" name="id" placeholder="아이디" class="textSize"></td>
		</tr>
		
		<tr>
			<td style="padding-top: 5px;"><input type="password" name="password" placeholder="비밀번호" class="textSize"></td>
		</tr>
		
		<tr>
			<td style="padding-top: 30px;"><input type="submit" value="로그인" class="textSize" style="background: #0095FF;"></td>
		</tr>
		
		<tr>
			<td style="padding-top: 30px;">
			<a href="findMemberID.mb" id="find">아이디 찾기</a> | 
			<a href="findMemberPW.mb" id="find">비밀번호 찾기</a> | 
			<a href="insertMember.mb" id="join">회원가입</a>
			</td>
		</tr>
	</table>

</form>