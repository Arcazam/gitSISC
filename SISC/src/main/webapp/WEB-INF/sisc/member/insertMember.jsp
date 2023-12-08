<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
<script>

	$(function() {
		
		$('input[name="id"]').focus();
		
		var use = "";			// 아이디의 유효성검사
		var isCheck = false;	// 아이디의 유효성검사 유/무
		
		$('#idCheck').click(function() {
			
			isCheck = true;
			
			var checkId = $('input[name="id"]').val();
			
			$.ajax({
				url : "ajax.mb",
				data : ({
					userid : checkId 
				}),
				success : function(data){
					if ($.trim(data) == 'YES') {
						$('#idmessage').html("<font color=blue>사용가능한 아이디 입니다</font>");
						$('#idmessage').show();
						use = "possible";
					} else {
						$('#idmessage').html("<font color=red>이미 사용중인 아이디 입니다</font>");
						$('#idmessage').show();
						use = "impossible";
					}
				}
			});
			
		}); // 아이디 중복검사 버튼클릭
		
		$("input[name=id]").keydown(function() {
			isCheck = false;
			use = "";
			$('#idmessage').css('display', 'none');
		});
		
		$('#sub').click(function() {
			if (use == "impossible") {
				alert("이미 사용중인 아이디입니다.");
				return false;
			} else if (isCheck == false) {
				alert("중복체크를 하셔야합니다!");
				return false;
			}
		});
		
	});

	function check(){
		
		if($('input[name="id"]').val() == ""){
			alert('아이디가 누락되었습니다');
			$('input[name="id"]').focus();
			return false;
		}
		
		if($('input[name="password"]').val() == ""){
			alert('비밀번호가 누락되었습니다');
			$('input[name="password"]').focus();
			return false;
		}
		
		if($('input[name="name"]').val() == ""){
			alert('이름이 누락되었습니다');
			$('input[name="name"]').focus();
			return false;
		}
		
		if($('input[name="joomin1"]').val() == ""){
			alert('주민번호 앞자리가 누락되었습니다');
			$('input[name="joomin1"]').focus();
			return false;
		}
		
		if($('input[name="joomin2"]').val() == ""){
			alert('주민번호 뒷자리가 누락되었습니다');
			$('input[name="joomin2"]').focus();
			return false;
		}
		
		if (!$('input[name="gender"]').is(":checked")) {
			alert('성별을 체크하셔야합니다');
			$('input[name="gender"]').focus();
			return false;
		}
		
		var joomin2 = document.getElementsByName("joomin2")[0].value;
		var genderRadio = document.getElementsByName("gender");

		// 주민등록번호 뒷자리 첫번째 숫자 추출
		var genderDigit = parseInt(joomin2.charAt(0), 10);
		
		// 성별 라디오 버튼 선택 여부 확인
	    if ((genderDigit === 1 || genderDigit === 3) && !genderRadio[0].checked) {
	        alert("주민번호형식과 성별이 서로 맞지 않습니다");
	        $('input[name="joomin2"]').select();
	        return false;
	    } else if ((genderDigit === 2 || genderDigit === 4) && !genderRadio[1].checked) {
	    	alert("주민번호형식과 성별이 서로 맞지 않습니다");
	        $('input[name="joomin2"]').select();
	        return false;
	    }
		
		if($('input[name="address_main"]').val() == ""){
			alert('주소가 누락되었습니다');
			$('input[name="address_main"]').focus();
			return false;
		}
		
		if($('input[name="address_detail"]').val() == ""){
			alert('상세주소가 누락되었습니다');
			$('input[name="address_detail"]').focus();
			return false;
		}
		
		var hp1Val = $('input[name="hp1"]').val();
		var hp2Val = $('input[name="hp2"]').val();
		var hp3Val = $('input[name="hp3"]').val();
		
		if(hp1Val==""||hp2Val==""||hp3Val==""){
			alert('핸드폰번호가 누락되었습니다');
			$('input[name="hp1"]').focus();
			return false;
		}
		
		if ($('select option:selected').val() == "") {
			alert('반을 선택하셔야합니다');
			return false;
		}
		
	}

</script>

<form name="insertMemberForm" method="post" action="insertMember.mb" enctype="multipart/form-data">
	
	<font color="red">프로필 사진을 고르시지 않으면, 기본프로필 사진으로 대체됩니다</font>
	<br><br>
	
	프로필사진 : <input type="file" name="upload">
	<br><br>
	아이디 : <input type="text" name="id">
			<input type="button" id="idCheck" value="중복확인">
			<span id="idmessage" style="display:none;"></span>
			<br>
	
	비밀번호 : <input type="text" name="password"> <br>
	
	이름 : <input type="text" name="name"> <br>
	
	주민등록번호 : 
	<input type="text" name="joomin1" maxlength="6" size="6"> - 
	<input type="text" name="joomin2" maxlength="7" size="7">	
		
	성별 : <input type="radio" name="gender" value="M">남
		  <input type="radio" name="gender" value="W">여<br><br>
	
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
	<input type="text" name="hp1" maxlength="3" size="3" value="010"> - 
	<input type="text" name="hp2" maxlength="4" size="4"> -
	<input type="text" name="hp3" maxlength="4" size="4">
	<br><br>
	
	반 구분 :
	<select name="m_class">
		<option value="">선택</option>
		<option value="A">A</option>
		<option value="B">B</option>
		<option value="C">C</option>
		<option value="D">D</option>
		<option value="E">E</option>
		<option value="F">F</option>
		<option value="G">G</option>
		<option value="H">H</option>
		<option value="I">I</option>
	</select>
	<br><br>
			  
	<input type="submit" id="sub" value="회원가입" onClick="return check()">
		  
</form>