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

<form:form name="BookInsertForm" commandName="bb" action="insert.bk" method="post" enctype="multipart/form-data">
	<table id="bookInsertTable" border=1>
		<tr>
			<th colspan=2>판매자 정보</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="seller" value="${ mb.id }" readonly></td>
		</tr>
		<tr>
			<th>판매자 이름</th>
			<td>
				<input type="text" name="seller_name" placeholder="판매자 이름을 입력해주세요" value="${ mb.name }">
			</td>
		</tr>
		<tr>
			<th>판매자 번호</th>
			<td>
				<c:set var="seller_pnum" value="${mb.phone}" />
				<c:set var="seller_pnum_arr" value="${fn:split(seller_pnum, '-')}"/>
				
				<c:set var="seller_pnum1" value="${seller_pnum_arr[0]}" />
				<c:set var="seller_pnum2" value="${seller_pnum_arr[1]}" />
				<c:set var="seller_pnum3" value="${seller_pnum_arr[2]}" />

				<input type="tel" name="seller_pnum1" size="3" maxlength="3" value="${seller_pnum1 }"> -
				<input type="tel" name="seller_pnum2" size="4" maxlength="4" value="${seller_pnum2 }"> -
				<input type="tel" name="seller_pnum3" size="4" maxlength="4" value="${seller_pnum3 }">
			</td>
		</tr>
		<tr>
			<th colspan=2>책 정보 입력</th>
		</tr>
		<tr>
			<th>책 사진</th>
			<td>
				<b>책의 사진은 최대 3장의 사진을 올리실수 있습니다</b><br>
				1)겉표지 <input type="file" name="upload1"><br>
				2)내부1 <input type="file" name="upload2"><br>
				3)내부2 <input type="file" name="upload3"><br>
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
		        <input type="date" name="pub_date" placeholder="출간일을 입력하세요" value="${bb.pub_date}">
		    </td>
		</tr>
		<tr>
		    <th>판매일</th>
		    <c:set var="currentDate" value="<%= new Date() %>" />
		    <fmt:formatDate value="${currentDate}" pattern="yyyy-MM-dd" var="formattedDate" />
		    <td>
		       <input type="date" name="sell_date" placeholder="판매일을 입력하세요" value="${formattedDate}" readonly>
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
				<input type="radio" name="kind1" value="A">없음
				<input type="radio" name="kind1" value="B">연필/샤프
				<input type="radio" name="kind1" value="C">볼펜/형광펜<br>
				
				필기 흔적
				<!-- 2 : 필기 흔적 -->
				<input type="radio" name="kind2" value="A">없음
				<input type="radio" name="kind2" value="B">연필/샤프
				<input type="radio" name="kind2" value="C">볼펜/형광펜<br>
				
				겉 표지
				<!-- 3 : 겉 표지 -->
				<input type="radio" name="kind3" value="A">기스없음
				<input type="radio" name="kind3" value="B">기스있음<br>
				
				이름 기입
				<!-- 4 : 이름 기입 -->
				<input type="radio" name="kind4" value="A">없음
				<input type="radio" name="kind4" value="B">있음<br>
				
				페이지 변색
				<!-- 5 : 페이지 변색 -->
				<input type="radio" name="kind5" value="A">없음
				<input type="radio" name="kind5" value="B">있음<br>
				
				페이지 훼손
				<!-- 6 : 페이지 훼손 -->
				<input type="radio" name="kind6" value="A">없음
				<input type="radio" name="kind6" value="B">있음<br>
			</td>
		</tr>
		<tr>
			<th>판매 코멘트</th>
			<td>
				<textarea name="sell_content" rows="15" cols="30">${ bb.sell_content }</textarea>
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
				<input type="submit" value="판매등록" ">
				<input type="reset" value="취   소">
			</th>
		</tr>
	</table>
</form:form>