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

.login{
margin: auto;
margin-top: 125px;
border-collapse: collapse;
text-align: center;
font-family: 'TAEBAEKfont';
}

.textSize{
width: 200px;
height: 35px;
}

input[type="submit"]:hover {
    color: 40CFFF;
}

#find {
   text-decoration-line: none;
   color: black;
}

#find:hover{
   color: #0095FF
}

#join {
   text-decoration-line: none;
   color: #0095FF;
}

#kakao{
   text-decoration-line: none;
   color: black;
}

#join:hover {
    color: black;
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

/* demo */
body {
  font-family: 'Poppins', sans-serif;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-size: 1.5rem;
}
</style>

<title>SISC</title>
<form name="loginForm" action="login.mb" method="post">
   <table class="login">
      <tr>
         <td><img class="logo" src="<%=request.getContextPath()%>/resources/images/logo.jpg" style="width:300px; height: 150px;"></td>
      </tr>
      
      <tr>
         <td style="padding-top: 10px;"><font size="6">SISC라는 이름의 나의 든든한 코딩친구!</font></td>
      </tr>
      
      <tr>
         <td style="padding-top: 10px;"><font color="gray">SISC커뮤니티가 처음이시라면 아래 <font color="#0095FF">회원가입</font>을 진행해주세요!</font></td>
      </tr>
   
      <tr>
         <td>
         <div class="form__group field" >
         	<input type="text" name="id" class="form__field" placeholder="아이디" class="textSize" required>
         	<label class="form__label">아이디</label>
         </div>
         </td>
      </tr>
      
      <tr>
         <td >
         <div class="form__group field">
         	<input type="password" name="password" class="form__field" placeholder="비밀번호" class="textSize" required>
         	<label class="form__label">비밀번호</label>
         </div>
         </td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;"><input type="submit" value="로그인" class="textSize" style="background: white;"></td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;">
         <a href="findMemberID.mb" id="find">아이디 찾기</a> | 
         <a href="findMemberPW.mb" id="find">비밀번호 찾기</a> | 
		<a href="insertMember.mb" id="join">회원가입</a>
         </td>
      </tr>
   </table>

</form>