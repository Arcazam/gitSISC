<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    

<style>
@font-face {
   font-family: 'TAEBAEKfont';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/TAEBAEKfont.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

.findId{
margin: auto;
margin-top: 200px;
border-collapse: collapse;
text-align: center;
font-family: 'TAEBAEKfont';
width: 550px;
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

.form__group {
  position: relative;
  padding: 15px 0 0;
  margin-top: 10px;
  width: 50%;
  margin-top: 30px;
}

.form__field {
  font-family: inherit;
  width: 100%;
  border: 0;
  border-bottom: 2px solid #9b9b9b;
  outline: 0;
  padding: 7px 0;
  background: transparent;
  transition: border-color 0.2s;
  margin-left: 140px;
}

.form__field::placeholder {
  color: transparent;
}

.form__field:placeholder-shown ~ .form__label {
  font-size: 1.0rem;
  cursor: text;
  top: 20px;
  
}

.form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: #9b9b9b;
  margin-left: 140px;
}

.form__field:focus ~ .form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: #0095FF;
  font-weight: 700;
}

.form__field:focus {
  padding-bottom: 6px;
  font-weight: 700;
  border-width: 3px;
  border-image: linear-gradient(to right, #0095FF, #38ef7d);
  border-image-slice: 1;
}

/* reset input */
.form__field:required,
.form__field:invalid {
  box-shadow: none;
}

.main{
	margin-left: 150px;
	margin-top: 150px;
}
</style>

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
	<table class="findId">
	   <tr>
	      <td><img class="logo" src="<%=request.getContextPath()%>/resources/images/logo.png" style="width:150px; height: 150px;"></td>
	   </tr>
	   
	   <tr>
	      <td style="padding-top: 10px;"><font size="6">
		      <input type="hidden" name="id" value="${ id }">
		      ${ id } 님의 새로운 비밀번호를 입력해주세요</font>
	      </td>
	   </tr>
	
	  <tr>
	  	<td>
	  		<div class="form__group field">
         	<input type="password" name="pw" class="form__field" placeholder="새 비밀번호" class="textSize" required>
         	<label class="form__label">새 비밀번호</label>
       </div>
	  	</td>
	  </tr>
       
       <tr>
	  	<td>
	  		<div class="form__group field">
         	<input type="password" name="pwCheck" class="form__field" placeholder="새 비밀번호 확인" class="textSize" required>
         	<label class="form__label">새 비밀번호 확인</label>
       </div>
       <span id="pwmessage"></span><br><br>
	  	</td>
	  </tr>
      
	   <tr>
	      <td style="padding-top: 30px;">
		      <input type="submit" style="background: white;" value="비밀번호 바꾸기"> 
	      </td>
	   </tr>
	</table>
</form>
