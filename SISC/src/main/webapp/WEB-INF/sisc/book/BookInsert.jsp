<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#bookInsertTable {
		margin : 0 auto;
		width:50%;
		border-spacing:0px;
	}

	#bookInsertTable th {
		background-color : yellow;
		color : black;
	}

</style>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
<script>
	
	function checkBook(){
		
		if($('input[name="seller_name"]').val()==""){
			alert('판매자 이름이 누락되었습니다');
			$('input[name="seller_name"]').focus();
			return false;
		}
		
		if($('input[name="seller_pnum"]').val()==""){
			alert('판매자 연락처가 누락되었습니다');
			$('input[name="seller_pnum"]').focus();
			return false;
		}
		
		if($('input[name="upload"]').val()==""){
			alert('사진이 누락되었습니다');
			$('input[name="upload"]').focus();
			return false;
		}
		
		if($('input[name="title"]').val()==""){
			alert('제목이 누락되었습니다');
			$('input[name="title"]').focus();
			return false;
		}
		
		if($('input[name="writer"]').val()==""){
			alert('저자가 누락되었습니다');
			$('input[name="writer"]').focus();
			return false;
		}
		
		if($('input[name="publisher"]').val()==""){
			alert('출판사가 누락되었습니다');
			$('input[name="publisher"]').focus();
			return false;
		}
		
		if($('input[name="pub_date"]').val()==""){
			alert('출간일이 누락되었습니다');
			$('input[name="pub_date"]').focus();
			return false;
		}
		
		if($('input[name="pri_price"]').val()==""){
			alert('원가가 누락되었습니다');
			$('input[name="pri_price"]').focus();
			return false;
		}
		
		if(isNaN($('input[name="pri_price"]').val())) {
			alert('원가는 숫자로 입력해주세요');
			$('input[name="pri_price"]').select();
			return false;
		}
		
		if($('input[name="dis_price"]').val()==""){
			alert('중고판매가 가 누락되었습니다');
			$('input[name="dis_price"]').focus();
			return false;
		}
		
		if(isNaN($('input[name="dis_price"]').val())) {
			alert('중고판매가는 숫자로 입력해주세요');
			$('input[name="dis_price"]').select();
			return false;
		}
		
		if(!$('input[name="1"]').is(':checked')){
			alert('밑줄 흔적이 누락되었습니다');
			$('input[name="1"]').focus();
			return false;
		}
		
		if(!$('input[name="2"]').is(':checked')){
			alert('필기 흔적이 누락되었습니다');
			$('input[name="2"]').focus();
			return false;
		}
		
		if(!$('input[name="3"]').is(':checked')){
			alert('겉표지 상태가 누락되었습니다');
			$('input[name="3"]').focus();
			return false;
		}
		
		if(!$('input[name="4"]').is(':checked')){
			alert('이름 기입이 누락되었습니다');
			$('input[name="4"]').focus();
			return false;
		}
		
		if(!$('input[name="5"]').is(':checked')){
			alert('페이지 변색이 누락되었습니다');
			$('input[name="5"]').focus();
			return false;
		}
		
		if(!$('input[name="6"]').is(':checked')){
			alert('페이지 훼손이 누락되었습니다');
			$('input[name="6"]').focus();
			return false;
		}
		
		if($('textarea[name="sell_content"]').val()==""){
			alert('판매 코멘트가 누락되었습니다');
			$('textarea[name="sell_content"]').focus();
			return false;
		}
		
		if($('input[name="tradeway"]').val()==""){
			alert('거래 방식이 누락되었습니다');
			$('input[name="tradeway"]').focus();
			return false;
		}
		
		if($('input[name="tradeplace"]').val()==""){
			alert('거래 장소가 누락되었습니다');
			$('input[name="tradeplace"]').focus();
			return false;
		}
		
	}
	
</script>

<form:form name="BookInsertForm" commandName="bb" action="insert.bk" method="post" enctype="multipart/form-data">
	<input type="hidden" name="writer" value="${mb.id}">
	<table id="bookInsertTable" border=1>
		<tr>
			<th colspan=2>판매자 정보</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${mb.id}</td>
		</tr>
		<tr>
			<th>판매자 이름</th>
			<td>
				<input type="text" name="seller_name" placeholder="판매자 이름을 입력해주세요" value="${ bb.seller_name }">
			</td>
		</tr>
		<tr>
			<th>판매자 번호</th>
			<td>
				<input type="text" name="seller_pnum" placeholder="판매자 연락처를 입력해주세요" value="${ bb.seller_pnum }">
			</td>
		</tr>
		<tr>
			<th colspan=2>책 정보 입력</th>
		</tr>
		<tr>
			<th>책 사진</th>
			<td>
				<input type="file" name="upload" value="${ bb.b_image }"><br>
				<font color="red"><b>책의 표지가 잘 나와야하고, 화질이 너무 흐릿한 사진을 올려서는 안됩니다</b></font>
			</td>
		</tr>
		<tr>
			<th>책 제목</th>
			<td>
				<input type="text" name="title" placeholder="제목을 입력하세요" value="${ bb.title }">
			</td>
		</tr>
		<tr>
			<th>저자</th>
			<td>
				<input type="text" name="writer" placeholder="저자를 입력하세요" value="${ bb.writer }">
			</td>
		</tr>
		<tr>
			<th>출판사</th>
			<td>
				<input type="text" name="publisher" placeholder="출판사를 입력하세요" value="${ bb.publisher }">
			</td>
		</tr>
		<tr>
			<th>출간일</th>
			<td>
				<input type="date" name="pub_date" placeholder="출간일을 입력하세요" value="${ bb.pub_date }">
			</td>
		</tr>
		<tr>
			<th>판매일</th>
				<c:set var="currentDate" value="<%= new Date() %>" />
				<fmt:formatDate value="${currentDate}" pattern="yyyy-MM-dd" var="formattedDate" />
			<td>
				<input type="text" name="sell_date" value="${formattedDate}" readonly>
			</td>
		</tr>
		<tr>
			<th>원가</th>
			<td>
				<input type="text" name="pri_price" placeholder="원가를 입력해주세요" value="${ bb.pri_price }">
			</td>
		</tr>
		<tr>
			<th>중고판매가</th>
			<td>
				<input type="text" name="dis_price" placeholder="판매가를 입력해주세요" value="${ bb.dis_price }">
			</td>
		</tr>
		<tr>
			<th>책 상태</th>
			<td>
				밑줄 흔적 
				<!-- 1 : 밑줄 흔적 -->
				<input type="radio" name="1" value="A">없음
				<input type="radio" name="1" value="B">연필/샤프
				<input type="radio" name="1" value="C">볼펜/형광펜<br>
				
				필기 흔적
				<!-- 2 : 필기 흔적 -->
				<input type="radio" name="2" value="A">없음
				<input type="radio" name="2" value="B">연필/샤프
				<input type="radio" name="2" value="C">볼펜/형광펜<br>
				
				겉 표지
				<!-- 3 : 겉 표지 -->
				<input type="radio" name="3" value="A">없음
				<input type="radio" name="3" value="B">연필/샤프<br>
				
				이름 기입
				<!-- 4 : 이름 기입 -->
				<input type="radio" name="4" value="A">없음
				<input type="radio" name="4" value="B">있음<br>
				
				페이지 변색
				<!-- 5 : 페이지 변색 -->
				<input type="radio" name="5" value="A">없음
				<input type="radio" name="5" value="B">있음<br>
				
				페이지 훼손
				<!-- 6 : 페이지 훼손 -->
				<input type="radio" name="6" value="A">없음
				<input type="radio" name="6" value="B">있음<br>
			</td>
		</tr>
		<tr>
			<th>판매 코멘트</th>
			<td>
				<textarea name="sell_content" rows="30" cols="50">${ bb.sell_content }</textarea>
			</td>
		</tr>
		<tr>
			<th>거래 방식</th>
			<td>
				<input type="text" name="tradeway" placeholder="거래 방식을 입력하세요" value="${ bb.tradeway }">
			</td>
		</tr>
		<tr>
			<th>거래 장소</th>
			<td>
				<input type="text" name="tradeplace" placeholder="거래 장소를 입력하세요" value="${ bb.tradeplace }">
			</td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="submit" value="판매등록" onClick="return checkBook()">
				<input type="reset" value="취   소">
			</th>
		</tr>
	</table>
</form:form>