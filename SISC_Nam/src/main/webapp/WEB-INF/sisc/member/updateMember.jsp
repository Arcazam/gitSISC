<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/main2.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/forms.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/tabs.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/ui-css.css" rel="stylesheet" type="text/css" />

<%
Object loginInfo = session.getAttribute("loginInfo");
if(loginInfo == null){%>
	<%@ include file="../top&bottom/top.jsp"%>
<%}else{%>
	<%@ include file="../top&bottom/topLogin.jsp"%>
<%}%>

<style>
@font-face {
   font-family: 'TAEBAEKfont';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/TAEBAEKfont.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}
.body-container {
	max-width: 800px;
	margin-left: 200px;
}

input{
	margin-bottom: 20px;
}

.col-sm-3.fix {
    width: 40%;
}
img{
	width: 100px;
	height: 100px;
}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-ko_KR.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
<script>

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
	
	if($('input[name="birth"]').val() == ""){
		alert('생일입력이 누락되었습니다');
		$('input[name="birth"]').focus();
		return false;
	}
	
	var dbirth = new Date($('input[name="birth"]').val());
	var dtoday = new Date();

	if(dtoday <= dbirth){
		alert('올바른 생일을 입력해주세요');
		$('input[name="birth"]').select();
		return false;
	}
	
	// 주민등록번호 앞 6자리
	var joomin1 = $('input[name="joomin1"]').val();
	// 생년월일 (예: '1998-01-01')
	var birthStr = $('input[name="birth"]').val();
	
	var jooYear = joomin1.substr(0, 2);
	var jooMon = joomin1.substr(2, 2);
	var jooDay = joomin1.substr(4, 2);
	
	var birthYear = birthStr.substr(2, 2);
	var birthMon = birthStr.substr(5, 2);
	var birthDay = birthStr.substr(8, 2);
	
	var compareJoomin = jooYear+jooMon+jooDay;
	var compareBirth = birthYear+birthMon+birthDay;

	if (compareJoomin !== compareBirth){
		alert('주민번호와 생년월일 형식이 맞지않습니다');
		$('input[name="joomin1"]').focus();
		return false;
	}
	
	function isValidDate(dateStr) {
	    // 날짜 형식 'yymmdd' 정규표현식
	    var datePattern = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
	    return datePattern.test(dateStr);
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
}
</script>

<script src="https://kit.fontawesome.com/3a115195d8.js" crossorigin="anonymous"></script>

<div class = "container">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="fa-solid fa-user"></i> <strong>정보수정</strong> </h3>
		</div>
		
		<div class="body-main">
				<form name="insertMemberForm" method="post" action="update.mb" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${mb.id }">
				         <div class="row" style="margin-left: 3px;">
				         	<img id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/${loginInfo.id}/pro_img/${loginInfo.pro_img}" /><br>
					         &nbsp;&nbsp;<strong>[프로필 사진]</strong>
				         </div>
				      
				      	 <div class="row" style="margin-top: 20px; margin-bottom: 20px;">
				         	<div class="input-group-prepend">
				         		<label class="col-sm-2 col-form-label">아이디</label>
				                 <div class="col-sm-3 pe-1">
									<span>${mb.id }</span>
								</div>
							</div>  
						</div>
				      
				         <div class="row">
				         	<div class="input-group-prepend">
				         		<label class="col-sm-2 col-form-label">비밀번호</label>
				                 <div class="col-sm-3 pe-1">
									<input type="password" class="form-control" name="password" value="${mb.password }" maxlength="12" placeholder="비밀번호">
								</div>
							</div>  
						</div>
				      
				         <div class="row" style="margin-top: 20px; margin-bottom: 20px;">
				         	<label class="col-sm-2 col-form-label">이름</label>
				         	<div class="col-sm-3 pe-1">
				            	<span>${mb.name }</span>
				         	</div>
				         </div>
				      
				         <div class="row" style="margin-bottom: 20px;">
				         	<label class="col-sm-2 col-form-label">성 별</label>
				         	<div class="form-check">
				         		<div class="col-sm-3 pe-1">
								  <input class="form-check-input" type="radio" name="gender" value="M" <c:if test="${mb.gender == 'M' }">checked</c:if> disabled>
								  <label class="form-check-label">남성</label>
								 </div>
								 <div class="col-sm-3 pe-1">
								 	<input class="form-check-input" type="radio" name="gender" value="W" <c:if test="${mb.gender == 'W' }">checked</c:if> disabled>
							  		<label class="form-check-label">여성</label>
								 </div>
							</div>
				         </div>
				         
				         <div class="row mb-3">
					        <label class="col-sm-2 col-form-label">생년월일</label>
					        <div class="col-sm-10">
					            <input type="date" name="birth" id="birth" class="form-control" value="${mb.birth}" placeholder="생년월일">
					            <!-- 출력 해결법 : bean에서 String을 Date로 수정-->
					            <small class="form-control-plaintext" style="margin-bottom: 10px;">생년월일은 2000-01-01 형식으로 입력 합니다.</small>
					        </div>
					    </div>
				         
				         <div class="row">
				             <label class="col-sm-2 col-form-label">주민등록번호</label>
				             <div class="input-group-prepend">
				                 	<div class="col-sm-3 pe-1">
				                 		<c:set var="joominValues" value="${fn:split(mb.joomin, '-')}"/>
										<c:set var="firstJoomin" value="${joominValues[0]}"/>
										<input type="text" class="form-control" name="joomin1" value="${firstJoomin }" maxlength="6" placeholder="주민번호 앞자리">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 pe-1">
										<c:set var="secondJoomin" value="${joominValues[1]}"/>
										<input type="text" class="form-control" name="joomin2" value="${secondJoomin }" maxlength="7" placeholder="주민번호 뒷자리">
									</div>
							  </div>
				         </div>
				         
				         <div class="row">
				             <label class="col-sm-2 col-form-label">핸드폰번호</label>
				             <div class="input-group-prepend">
				                 	<div class="col-sm-3 pe-1">
				                 		<c:set var="PhoneValues" value="${fn:split(mb.phone, '-')}"/>
										<c:set var="firstPhone" value="${PhoneValues[0]}"/>
										<input type="text" name="hp1" value="${firstPhone }" class="form-control" maxlength="3">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 pe-1">
										<c:set var="secondPhone" value="${PhoneValues[1]}"/>
										<input type="text" name="hp2" value="${secondPhone }" class="form-control" maxlength="4">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 pe-1">
										<c:set var="thirdPhone" value="${PhoneValues[2]}"/>
										<input type="text" name="hp3" value="${thirdPhone }" class="form-control" maxlength="4">
									</div>
							  </div>
						 </div>
						 
				         <div class="row mb-3">
				         	<label class="col-sm-2 col-form-label">주소</label>
				            <div class="col-sm-10">
				            	<input type="text" id="address_kakao" class="form-control" name="address_main" value="${mb.address }" maxlength="10" placeholder="주소">
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
				            </div>
				         </div>
				         
				         <div class="row mb-3">
				         	<label class="col-sm-2 col-form-label"></label>
				            <div class="col-sm-10">
				            	<input type="text" class="form-control" name="address_detail" maxlength="10" placeholder="상세주소">
				            </div>
				         </div>
				          <div class="text-center">
				             <input class="btn btn-primary" type="submit" value="정보수정" onClick="return check()">
				         </div>
				   <br><br><br><br>     
				</form>
		</div>
	</div>
</div>