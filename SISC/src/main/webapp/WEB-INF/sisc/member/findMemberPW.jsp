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

.findPw{
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

.joominSize{
width: 94px;
height: 35px;
}

#find {
   text-decoration-line: none;
   color: #0095FF;
}

#find:hover{
   color: black;
}

#cancel {
   text-decoration-line: none;
   color: black;
}

#cancel:hover {
    color: #0095FF;
}
</style>    

<form name="fintPWForm" action="findMemberPW.mb" method="post">
	<table class="findPw">
		<tr>
      <td><img class="logo" src="<%=request.getContextPath()%>/resources/images/logo.png" style="width:150px; height: 150px;"></td>
   </tr>
   
   <tr>
      <td style="padding-top: 10px;"><font size="6">SISC <font color="#0095FF">비밀번호</font> 찾기</font></td>
   </tr>
   
   <tr>
      <td style="padding-top: 30px;"><input type="text" name="id" class="textSize" placeholder="아이디"></td>
   </tr>
   
   <tr>
      <td style="padding-top: 5px;"><input type="text" name="name" class="textSize" placeholder="이름"></td>
   </tr>
   
   <tr>
      <td style="padding-top: 5px;">
      <input type="text" name="joomin1" maxlength="6" class="joominSize" placeholder="주민등록번호"> - 
      <input type="text" name="joomin2" maxlength="7" class="joominSize" placeholder="주민등록번호">
      </td>
   </tr>
	
	<tr>
		<td>
			<input type="submit" id="find" value="아이디 찾기">
			<input type="button" id="cancel" value="취소" onClick="location.href='login.mb'">
		</td>
	</tr>
	</table>
</form>