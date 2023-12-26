<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>아이디 찾기</h2>

<br><br>

<form name="fintIDForm" action="findMemberID.mb" method="post">
	
	이름 : <input type="text" name="name"> <br>
	주민등록번호 : 
	<input type="text" name="joomin1" maxlength="6" size="6"> - 
	<input type="text" name="joomin2" maxlength="7" size="7">
	<br><br>
	
	<input type="submit" value="아이디 찾기">
	<input type="button" value="로그인" onClick="location.href='login.mb'">
	<input type="button" value="회원가입" onClick="location.href='insertMember.mb'">
	
</form>