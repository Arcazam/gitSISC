<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "./../common/common.jsp" %>

<script>
	function insert(){
		location.href = "editor.pd"
	}
	submitPost = function() {
	    oEditors.getById["txt"].exec("UPDATE_CONTENTS_FIELD", []);

	    // 텍스트 에디터의 내용 가져오기
	    let content = document.getElementById("txt").value;

	    if (content == '<p>&nbsp;</p>') {
	        alert("내용을 입력해주세요.");
	        oEditors.getById["txt"].exec("FOCUS");
	        return;
	    } else {
	        // 이미지 업로드를 위한 FormData 생성
	        let formData = new FormData();
	        formData.append("file", document.getElementById("imageFile").files[0]);

	        // 이미지를 업로드할 URL (서버 사이드 이미지 업로드 메서드의 엔드포인트)
	        let uploadUrl = "/uploadImage";

	        // 이미지 업로드 요청
	        $.ajax({
	            url: uploadUrl,
	            type: "POST",
	            data: formData,
	            contentType: false,
	            processData: false,
	            success: function (imageUrl) {
	                // 이미지가 성공적으로 업로드되면 해당 이미지의 URL을 텍스트 에디터에 추가
	                oEditors.getById["txt"].exec("PASTE_HTML", [content + '<img src="' + imageUrl + '">']);
	                alert("이미지가 업로드되었습니다.");
	            },
	            error: function () {
	                alert("이미지 업로드에 실패했습니다.");
	            }
	        });
	    }
	}
</script>

<h2 align="center">게시글 화면</h2>


<form>
	<table border="1" style="margin: auto; width: 40%">
		<tr>
			<td colspan="9" align="right">
				<input type="button" value="추가하기" onclick="insert()" >
			</td>
		</tr>
		<tr>
			<th>게시글</th>
		</tr>
		<c:choose>
	<c:when test="${fn:length(list) eq 0}">
		<tr>
			<td colspan="9" align="center">
				등록된 게시글이 없습니다
			</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="ed" items="${list }">
			<tr>
				<td align="center">${ed.txt }</td>
			</tr>
		</c:forEach>
	</c:otherwise>
	</c:choose> 
	</table>
</form>

