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
	
	.iTable{
	margin: auto;
	}
	</style>
	
	<div class="title">
	<span style="font-size: 40px; color: black;">문의</span>
	<br>
	<span style="color: gray;">더욱 노력하는 SISC가 되겠습니다!</span>
	<hr style="width: 500px;">
	</div>
	
	<div>
	<form action="" method="post">
	<table class="iTable">
		<tr>
			<td>
			<textarea name="inquiry" rows="8" cols="115" style="resize: none;" placeholder="문의사항을 적어주세요"></textarea>
			</td>
		</tr>
		
		<tr>
			<td style="text-align: right;"><input type="submit" value="제출하기"></td>
		</tr>
	</table>
	</form>
	</div>
	
    
	
    