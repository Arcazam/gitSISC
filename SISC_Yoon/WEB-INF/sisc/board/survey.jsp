<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top&bottom/top.jsp" %>
	
	<style>
	@font-face {
   	font-family: 'TAEBAEKfont';
   	src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/TAEBAEKfont.woff2')
      format('woff2');
   	font-weight: normal;
   	font-style: normal;
	}
	
	.title{
	margin: auto;
	margin-top: 50px;
	text-align: center;
	font-family: 'TAEBAEKfont';
	}
	
	.rTable{
	margin: auto;
	width:50%;
	}
	</style>
	
	<div class="title">
	<span style="font-size: 40px; color: black;">설문</span>
	<br>
	<span style="color: gray;">더 나은 SISC와 SIST를 위한 설문이에요!</span>
	<hr style="width: 500px;">
	</div>
	
	<div>
	<form method="post" action="">
	<table class="rTable">
		<tr>
			<th style="font-size: 19px;">1. SISC커뮤니티가 교육에 도움이 되시나요? 되신다면 특히 어떤 것이 도움이 될까요?</th>
		</tr>
		<tr>
			<td>
			<textarea name="text1" rows="5" cols="115" style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr>
			<th style="font-size: 19px; padding-top: 20px;">2. 커뮤니티에서 질문을 많이 하는 편인가요, 답변을 많이 하는 편인가요?</th>
		</tr>
		<tr>
			<td>
			<textarea name="text2" rows="5" cols="115" style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr>
			<th style="font-size: 19px; padding-top: 20px;">3. 취업 정보는 유용하다고 생각되시나요?</th>
		</tr>
		<tr>
			<td>
			<textarea name="text3" rows="5" cols="115" style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr>
			<th style="font-size: 19px; padding-top: 20px;">4. SISC커뮤니티를 이용하기 전과 후, 교육 난이도는 어떻게 변화했을까요?</th>
		</tr>
		<tr>
			<td>
			<textarea name="text4" rows="5" cols="115" style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr>
			<th style="font-size: 19px; padding-top: 20px;">5. 마지막으로 하고 싶은 말이 있을까요?</th>
		</tr>
		<tr>
			<td>
			<textarea name="text5" rows="5" cols="115" style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr>
			<td style="text-align: center; padding-top: 20px;"><input type="submit" value="제출하기"></td>
		</tr>
	</table>
	</form>
	</div>
	
    <br><br><br><br>
    <br><br><br><br>
	
    
	
    