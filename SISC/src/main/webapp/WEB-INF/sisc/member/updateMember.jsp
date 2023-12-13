<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../top&bottom/topLogin.jsp"%>
<style>
@font-face {
   font-family: 'TAEBAEKfont';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/TAEBAEKfont.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

.insert{
border-collapse : collapse;
margin: auto;
margin-top: 200px;
text-align: center;
font-family: 'TAEBAEKfont';
}
img{
	width: 150px;
}
</style>

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
      
      if($('input[name="birth"]').val() == ""){
         alert('생일이 누락되었습니다');
         $('input[name="birth"]').focus();
         return false;
      }
      
      if (!$('input[name="gender"]').is(":checked")) {
         alert('성별을 체크하셔야합니다');
         $('input[name="gender"]').focus();
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

<form name="insertMemberForm" method="post" action="update.mb">
<input type="hidden" name="id" value="${mb.id }">
   <table class="insert">
      <tr>
         <td>
         <img src="<%= request.getContextPath() %>/resources/member/pro_img/${contrastMB.pro_img }"><br>
         [프로필 사진]
         </td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;">
         아이디 : ${mb.id }
         <span id="idmessage" style="display:none;"></span>
         </td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;">   
         패스워드 : <input type="text" name="password" value="${mb.password }" style="width: 150px; height: 35px;">
         </td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;">
         이름 : <input type="text" name="name" value="${mb.name }" style="width: 150px; height: 35px;">
         </td>
      </tr>   
      
      <tr>
         <td style="padding-top: 30px;">
		    <input type="radio" name="gender" value="M" <c:if test="${mb.gender eq 'M'}">checked</c:if>>남성
		    <input type="radio" name="gender" value="W" <c:if test="${mb.gender eq 'W'}">checked</c:if>>여성
		</td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;"> 
		 <fmt:parseDate value='${mb.birth}' pattern="yyyy-MM-dd" var='day' /> 
		 <fmt:formatDate value="${day}" pattern="yyyy-MM-dd" />
         생년월일 <input type="date" name="birth" value="${day }" pattern="yyyy-MM-dd" style="width: 130px; height: 35px;">
         </td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;">
         주민번호 : ${mb.joomin }
         </td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;">
         핸드폰 번호 : ${mb.phone }
         </td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;">
         <input type="text" id="address_kakao" name="address_main" value="${mb.address }" readonly style="width: 150px; height: 35px;"/>
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
         </td>
      </tr>
      
      <tr>
         <td style="padding-top: 30px;">
         <input type="text" name="address_detail" style="width: 150px; height: 35px;"/>
         </td>
      </tr>   
      
      <tr>
         <td style="padding-top: 30px;">           
         <input type="submit" id="sub" value="정보수정" onClick="return check()" style="width: 150px; height: 35px;">
         </td>
      </tr>
   </table>
   
   <br><br><br><br>     
</form>