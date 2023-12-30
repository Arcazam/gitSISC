<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/main2.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/forms.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/tabs.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/css/ui-css.css" rel="stylesheet" type="text/css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-ko_KR.min.js"></script>
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

</style>

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
		
		if ($('select[name="curriculum"] option:selected').val() == "") {
			alert('커리큘럼을 선택하셔야합니다');
			return false;
		}
		
		if ($('select[name="m_class"] option:selected').val() == "") {
			alert('반을 선택하셔야합니다');
			return false;
		}
		
		 if($('input[name="division"]').val() == ""){
	         alert('학생, 매니저, 강사 중 반드시 하나를 선택해야 합니다');
	         $('input[name="division"]').focus();
	         return false;
	      }
	      
	      if($('input[name="start_day"]').val() == ""){
	         alert('교육시작일이 누락되었습니다');
	         $('input[name="start_day"]').focus();
	         return false;
	      }
	      
	      if($('input[name="end_day"]').val() == ""){
	         alert('교육종료일이 누락되었습니다');
	         $('input[name="end_day"]').focus();
	         return false;
	      }
	      
	      var startDay = new Date($('input[name="start_day"]').val());
	      var endDay = new Date($('input[name="end_day"]').val());

	      if (endDay < startDay) {
	          alert('교육일자를 잘못 입력하셨습니다');
	          $('input[name="start_day"]').select();
	          return false;
	      }

	      if($('input[name="code"]').val() == ""){
	         alert('코드가 누락되었습니다');
	         $('input[name="code"]').focus();
	         return false;
	      }

		
	}

	 function showMenu(division) {
	       var managerLecturerMenu = document.getElementById("managerLecturerMenu");
	       var allMenu = document.getElementById("allMenu");

	       if (division === "student") {          
	           allMenu.style.display = "block";
	           managerLecturerMenu.style.display = "none";
	       } else if (division === "manager" || division === "lecturer") {
	           allMenu.style.display = "block";
	           managerLecturerMenu.style.display = "block";
	       }
	   }
	 document.querySelector('input[type="file"]').addEventListener('change', function() {
			alert(1)
		    var file = this.files[0]; // 선택된 파일
		    if (file) {
		        var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체 생성

		        reader.onload = function(e) {
		            // 선택된 파일의 URL을 이미지 태그의 src에 할당하여 미리보기로 표시
		            document.getElementById('previewImage').setAttribute('src', e.target.result);
		        }

		        // 파일을 읽음
		        reader.readAsDataURL(file);
		    }
		});

</script>

<div class = "container">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="bi bi-person-square"></i> 회원가입 </h3>
		</div>
		
		<div class="body-main">
				<form name="insertMemberForm" method="post" action="insertMember.mb" enctype="multipart/form-data">
				         <div class="row">
				         	<img id="previewImage" src="<%=request.getContextPath()%>/resources/member/pro_img/defaultImage.png" style="margin-left:22px; width:50px; height: 50px;">
					         [프로필 사진]
					         <input type="file" name="upload" style="margin-left: 30px;">
					         <font color="red" style="margin-left: 15px; font-size: 9px;">프로필 사진을 고르지 않을 시, 기본프로필 사진으로 대체됩니다</font>
				         </div>
				      
				      	 <div class="row" style="margin-top: 20px;">
				         	<div class="input-group-prepend">
				         		<label class="col-sm-2 col-form-label">아이디</label>
				                 <div class="col-sm-3 pe-1">
									<input type="text" class="form-control" name="id" maxlength="12" placeholder="아이디">
								</div>
								<div class="pe-1 col-sm-3.fix">
									<input type="button" id="idCheck" value="중복확인" style="height: 35px; width: 100px; background-color: white;">
						         	<span id="idmessage" style="display:none; dis"></span>
								</div>
							</div>  
						</div>
				      
				         <div class="row">
				         	<div class="input-group-prepend">
				         		<label class="col-sm-2 col-form-label">비밀번호</label>
				                 <div class="col-sm-3 pe-1">
									<input type="password" class="form-control" name="password" maxlength="12" placeholder="비밀번호">
								</div>
							</div>  
						</div>
				      
				         <div class="row">
				         	<label class="col-sm-2 col-form-label">이름</label>
				         	<div class="col-sm-3 pe-1">
				            	<input type="text" class="form-control" name="name" maxlength="10" placeholder="이름">
				         	</div>
				         </div>
				      
				         <div class="row" style="margin-bottom: 20px;">
				         	<label class="col-sm-2 col-form-label">성 별</label>
				         	<div class="form-check">
				         		<div class="col-sm-3 pe-1">
								  <input class="form-check-input" type="radio" name="gender" value="M">
								  <label class="form-check-label">남성</label>
								 </div>
								 <div class="col-sm-3 pe-1">
								 	<input class="form-check-input" type="radio" name="gender" value="W">
							  		<label class="form-check-label">여성</label>
								 </div>
							</div>
				         </div>
				         
				         <div class="row mb-3">
					        <label class="col-sm-2 col-form-label">생년월일</label>
					        <div class="col-sm-10">
					            <input type="date" name="birth" id="birth" class="form-control" value="${dto.birth}" placeholder="생년월일">
					            <small class="form-control-plaintext" style="margin-bottom: 10px;">생년월일은 2000-01-01 형식으로 입력 합니다.</small>
					        </div>
					    </div>
				         
				         <div class="row">
				             <label class="col-sm-2 col-form-label">주민등록번호</label>
				             <div class="input-group-prepend">
				                 	<div class="col-sm-3 pe-1">
										<input type="text" class="form-control" name="joomin1" maxlength="6" placeholder="주민번호 앞자리">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 pe-1">
										<input type="text" class="form-control" name="joomin2" maxlength="7" placeholder="주민번호 뒷자리">
									</div>
							  </div>
				         </div>
				         
				         <div class="row">
				             <label class="col-sm-2 col-form-label">핸드폰번호</label>
				             <div class="input-group-prepend">
				                 	<div class="col-sm-3 pe-1">
										<input type="text" name="hp1" class="form-control" maxlength="3">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 pe-1">
										<input type="text" name="hp2" class="form-control" maxlength="4">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 pe-1">
										<input type="text" name="hp3" class="form-control" maxlength="4">
									</div>
							  </div>
						 </div>
				         <div class="row mb-3">
				         	<label class="col-sm-2 col-form-label">주소</label>
				            <div class="col-sm-10">
				            	<input type="text" id="address_kakao" class="form-control" name="address_main" maxlength="10" placeholder="주소">
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
				         
				        <div class="row" style="margin-bottom: 20px;">
						    <label class="col-sm-2 col-form-label">직급</label>
						    <div class="form-check">
						        <div class="col-sm-3 pe-1">
						            <input class="form-check-input" type="radio" name="division" value="student" onclick="showMenu(division.value)">
						            <label class="form-check-label">학생</label>
						        </div>
						        <div class="col-sm-3 pe-1">
						            <input class="form-check-input" type="radio" name="division" value="manager" onclick="showMenu(division.value)">
						            <label class="form-check-label">매니저</label>
						        </div>
						        <div class="col-sm-3 pe-1">
						            <input class="form-check-input" type="radio" name="division" value="lecturer" onclick="showMenu(division.value)">
						            <label class="form-check-label">강사</label>
						        </div>
						    </div>
						</div>
				         
				        <div class="row" id="allMenu" style="display: none;">
				        	<label class="col-sm-2 col-form-label">커리큘럼</label>
				           <select name="curriculum" style="width: 330px; height: 35px; margin-left: 20px;">
				           		<option value="">커리큘럼 선택</option>
				           		<option value="자바&스프링기반 AWS클라우드 융합 개발자 양성과정">자바&스프링기반 AWS클라우드 융합 개발자 양성과정</option>
				           		<option value="실무 프로젝트 기반 빅데이터 서비스 솔루션 개발자 양성과정">실무 프로젝트 기반 빅데이터 서비스 솔루션 개발자 양성과정</option>
				           		<option value="AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정">AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정</option>
				           		<option value="(디지털컨버전스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정">(디지털컨버전스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정</option>
				           </select>
				           
				            <select name="m_class" style="width: 330px; height: 35px;">
				                <option value="">현재 소속된 반 선택</option>
				                <option value="A">A</option>
				                <option value="B">B</option>
				                <option value="C">C</option>
				                <option value="D">D</option>
				                <option value="E">E</option>
				                <option value="F">F</option>
				            </select>
				            <br><br>
				            
				            <div class="row mb-3">
					            <label class="col-sm-2 col-form-label">교육시작일</label>
					            <div class="col-sm-10">
					            <input type="date" class="form-control" name="start_day" style="margin-left: 15px;">
					            </div>
				            </div> 
				            
				            <div class="row mb-3">
					            <label class="col-sm-2 col-form-label">교육종료일</label>
					            <div class="col-sm-10">
					            	<input type="date" class="form-control" name="end_day" style="margin-left: 15px;">
					            </div>
				            </div>
				        </div>
				        
				        <div class = "row" id="managerLecturerMenu" style="display: none;">
				           <br>
				           <input type="text" name="code" value="코드 입력" style="width: 150px; height: 35px; margin-left: 20px;">
				        </div>
				          <div class="text-center">
				             <input class="btn btn-primary" type="submit" value="회원가입" onClick="return check()">
				         	 <input type="button" class="btn btn-danger" value="가입취소" onclick="location.href='SiscMain.view'">
				         </div>
				   <br><br><br><br>     
				</form>
		</div>
	</div>
</div>