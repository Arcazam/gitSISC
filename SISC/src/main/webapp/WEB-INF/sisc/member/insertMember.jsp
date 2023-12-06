<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
<script>

	function check(){
		
		
		
	}

</script>

<form name="insertMemberForm" action="insertMember.mb" method="post">
	아이디 : <input type="text" name="id"> <br>
	
	비밀번호 : <input type="text" name="password"> <br>
	
	이름 : <input type="text" name="name"> <br>
	
	생년월일 : <input type="date" name="birth"><br>
	
	성별 : <input type="radio" name="gender" value="M">남
		  <input type="radio" name="gender" value="W">여
	
	주소 : <input type="text" id="address_kakao" name="address_main" readonly /> <br>
	상세주소 : <input type="text" name="address_detail" /> <br><br>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		window.onload = function(){
		    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("address_kakao").value = data.address; // 주소 넣기
		                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
		            }
		        }).open();
		    });
		}
	</script>
	
	핸드폰 번호 : 
	<input type="text" name="hp1"> - 
	<input type="text" name="hp2"> -
	<input type="text" name="hp3">
	<br><br>
	
	반 구분 :
	<select name="u_class">
		<option value="A">A</option>
		<option value="B">B</option>
		<option value="C">C</option>
		<option value="D">D</option>
		<option value="E">E</option>
		<option value="F">F</option>
		<option value="G">G</option>
		<option value="H">H</option>
	</select>
			  
	<input type="submit" value="회원가입" onClick="return check()">
		  
</form>