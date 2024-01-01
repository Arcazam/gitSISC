<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
</style>

<form action="findMemberID.mb" method="post">
	<table class="findId">
	   <tr>
	      <td><img class="logo" src="<%=request.getContextPath()%>/resources/images/logo.png" style="width:150px; height: 150px;"></td>
	   </tr>
	   
	   <tr>
	      <td style="padding-top: 10px;"><font size="6">SISC <font color="#0095FF">아이디</font> 찾기</font></td>
	   </tr>
	
	  <tr>
         <td>
         <div class="form__group field">
         	<input type="text" name="name" class="form__field" placeholder="이름" class="textSize" required>
         	<label class="form__label">이름</label>
         </div>
         </td>
      </tr>
      
      <tr>
         <td> 
         <div class="form__group field">
         	<input type="text" name="joomin1" maxlength="6" class="form__field" placeholder="비밀번호" class="joominSize" required>
         	<label class="form__label">주민번호 앞자리</label>
         </div>
         
         <div class="form__group field">
         	<input type="text" name="joomin2" maxlength="7" class="form__field" placeholder="비밀번호" class="joominSize" required>
         	<label class="form__label">주민번호 뒷자리</label>
         </div>
         </td>
      </tr>
      
	   <tr>
	      <td style="padding-top: 30px;">
		      <input type="submit" value="아이디 찾기" style="background-color: white;">
		      <input type="button" value="취소" onclick="location.href='login.mb'" style="background-color: white;">
	      </td>
	   </tr>
	</table>
</form>
