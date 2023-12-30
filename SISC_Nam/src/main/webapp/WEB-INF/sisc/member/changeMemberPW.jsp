<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    
<script>
	$(function(){
		
		$("input[name=pwCheck]").keyup(function(){
			 if ($('input[name="pwCheck"]').val() == $('input[name="pw"]').val()) {
				$('#pwmessage').html("<font color=blue>비번 일치</font>");
			 } else {
				$('#pwmessage').html("<font color=red>비번 불일치</font>");
			 }
		 });
		
	});
</script>
    <form name="ChangePWForm" action="changePW.mb" method="post">
		<input type="hidden" name="id" value="${ id }">
		<h3>${ id } 님의 새로운 비밀번호를 입력해주세요</h3>
    	새 비밀번호 : <input type="password" name="pw"><br>
    	새 비밀번호 확인 : <input type="password" name="pwCheck">
    	<span id="pwmessage"></span><br><br>
    	
    	<input type="submit" value="비밀번호 바꾸기"> 
    
    </form>