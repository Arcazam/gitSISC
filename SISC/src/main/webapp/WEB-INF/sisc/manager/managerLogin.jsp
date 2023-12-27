<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

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
<form name="ManagerLoginForm" action="manager_login.mag" method="post">
	<table id="ManagerLoginTable" border = 1>
		<tr>
			<th colspan=2>관리자 로그인</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type=text id="input_ID" name="manager_id" placeholder="관리자 아이디">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type=password id="input_PW" name="manager_pw" placeholder="관리자 비밀번호">
			</td>
		</tr>
		<tr>
			<th colspan=2>
				<input type=submit value="관리자 로그인" onClick="return check()">
				<input type=button value="관리자 아이디/비밀번호 찾기" onClick="alertAccount()">
			</th>
		</tr>
	</table>
</form>