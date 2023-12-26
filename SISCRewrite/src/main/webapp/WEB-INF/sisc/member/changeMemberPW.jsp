<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <form name="ChangePWForm" action="changePW.mb" method="post">
		<input type="text" name="id" value="${ id }">
    	새 비밀번호 : <input type="password" name="pw"><br>
    	새 비밀번호 확인 : <input type="password" name="pwCheck"><br><br>
    	
    	<input type="submit" value="비밀번호 바꾸기"> 
    
    </form>