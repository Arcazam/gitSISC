<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="loginForm" action="login.mb" method="post">

	아이디 : <input type="text" name="id"><br>
	비밀번호 : <input type="password" name="password"><br><br>

	<input type="submit" value="로그인">
	<input type="button" value="회원가입" onClick="location.href='insertMember.mb'">
	<input type="button" value="아이디 찾기" onClick="location.href='findMemberID.mb'">
	<input type="button" value="비밀번호 찾기" onClick="location.href='findMemberPW.mb'">

</form>