<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">

<link href="<%=request.getContextPath() %>/resources/css/btn.css" rel="stylesheet" type="text/css" />

<%@ include file="../top&bottom/top.jsp"%>  

<style>
	.sbtn{
		background-color: #3D4C53;
		color: white; 
		border: none; 
		margin-top: 8px;
	}	

	#tagList {
   		white-space: nowrap;
    }

	.tag {
        display: inline-block;
        margin-right: 5px;
    }
</style>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
<script>

	function insertBoardcheck(){
		
		if ($('select option:selected').val() == "") {
			alert('게시판 카테고리를 선택하셔야합니다');
			return false;
		}
		
		if($('input[name="subject"]').val() == ""){
			alert('제목이 누락되었습니다');
			$('input[name="subject"]').focus();
			return false;
		}
		
		if($('input[name="content"]').val() == ""){
			alert('내용이 누락되었습니다');
			$('input[name="content"]').focus();
			return false;
		}
		
	}

</script>

<head>
  <title>SummerNoteExample</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
</head>

<body>
<br><br>
<form:form commandName="bb" class="container" method="post" action="insert.bd">
	<input type="text" name="writer" style="width: 40%;" value="${ mb.id }" readonly><br><br> 
	<select name="b_cate" style="float: right;">	
		<option value="">선택하세요</option>
		<option value="Free">자유</option>
		<option value="Know">지식</option>
		<option value="QnA">QnA</option>
		<option value="Grad">수료생</option>
	</select>
	<br><br>
	<input type="text" name="subject" style="width: 40%;" value="${ bb.subject }" placeholder="제목"/>
	<div id="charCount">(100/0)</div><br><br>
	 <script>
	 $(document).ready(function () {
		    $('input[name="subject"]').on('input', function () {
		        var inputText = $(this).val();
		        var byteCount = countBytes(inputText);

		        if (byteCount > 100) {
		            $('#charCount').text('글자수 제한을 초과하셨습니다').css('color', 'red');
		        } else {
		            $('#charCount').text('(100/' + byteCount + ')').css('color', 'black');
		        }
		    });

		    function countBytes(text) {
		        var totalCount = 0;
		        for (var i = 0; i < text.length; i++) {
		            var charCode = text.charCodeAt(i);
		            totalCount += (charCode < 128) ? 1 : 3; // ASCII 문자는 1바이트, 나머지는 3바이트로 계산
		        }
		        return totalCount;
		    }
		});
    </script>
	<textarea class="summernote" name="content">${ bb.content }</textarea>
	<br>
	
	<!-- 태그를 입력할 텍스트 필드 -->
	<input type="text" name="taginfo" size="30" placeholder="태그를 입력해주세요">
	
	<!-- 태그를 입력할수있는 버튼 -->
	<input type="button" id="tagInsert" value="태그입력"><br>
	
	<!-- 태그를 하나라도 입력했을 때 나타나는 메세지 -->
	<span id="tagMessage" style="display: none;"></span>
	
	<!-- 어떠한 태그가 입력이 되었는지 나타나는 영역 -->
	<div id="tagList"></div>
	
	<!-- input type hidden 으로 넘길 영역 -->
	<div id="tagValues" style="display: none;"></div>

	<script>
	
    // 동적 배열 선언
	var tagValues = [];
	
  $(function() {
    
    $(document).on('click', '.removeTag', function() {
      // 클릭한 태그를 제거
      $(this).parent().remove();
      
      // 클릭한 태그의 값도 배열에서 제거
      var removedTagValue = $(this).text().substring(1);
      var index = tagValues.indexOf(removedTagValue);
      if (index !== -1) {
        tagValues.splice(index, 1);
        if(tagValues==0){
        	$('#tagMessage').hide();
        }
      }
    });

    $('#tagInsert').click(function() {
    	
	    if($('input[name="taginfo"]').val() == ""){
	    	alert('태그입력칸이 누락되었습니다');
	    	$('input[name="taginfo"]').focus();
	    	return;
	    }	
    	
      var tagMessage = '<font color="black">태그를 삭제하시려면 클릭하시면 됩니다</font>';	
    
      $('#tagMessage').html(tagMessage);
      $('#tagMessage').show();
      
      // 사용자가 입력한 값을 가져오기
      var tagValue = $('input[name="taginfo"]').val();
      
      // 입력한 값 앞,뒤의 공백 없애버리기
      tagValue = $.trim(tagValue);
      
   	  // 중간에 생긴 공백을 언더스코어로 대체
      tagValue = tagValue.replace(/\s+/g, '_');

      // 기존의 HTML 내용 가져오기
      var currentHtml = $('#tagList').html();

   		// 이미 존재하는 태그인지 검사
      if (currentHtml.includes('<div class="removeTag" style="cursor: pointer; color: red;"><font color="blue">#' + tagValue + '</font></div>')) {
    	alert('이미 입력한 태그입니다.');
    	$('input[name="taginfo"]').select();
   		return; // 함수 종료
   		}

      // 현재 HTML에 포함된 태그의 개수 확인
      var tagCount = $(currentHtml).find('font[color="blue"]').length;

      // 최대 태그 개수
      var maxTagCount = 6;

      if (tagCount < maxTagCount) {
        // 새로운 HTML 내용 추가
        var newHtml = '<div class="tag">' +
          '<div class="removeTag" style="cursor: pointer; color: red;"><font color="blue">#' + tagValue + '</font></div>' +
          '</div>' + currentHtml;

        // 변경된 HTML 내용을 #tagList에 설정
        $('#tagList').html(newHtml);

        // 입력 필드 비우기
        $('input[name="taginfo"]').val('');

        // 배열에 tagValue 추가
        tagValues.push(tagValue);
//      alert(tagValues .join(', ')); -> 값 성공적으로 들어옴
      } else {
        // 경고 메시지 표시
        alert('최대 ' + maxTagCount + '개의 태그까지만 입력할 수 있습니다.');
     	// 입력 필드 비우기
        $('input[name="taginfo"]').val('');
      }
    });
    
    $('#sub').click(function() {
        if (tagValues.length > 0) {
            // JSON 배열 형식으로 변환하여 hidden input에 추가
            var tagHidden = '<input type="hidden" name="tagValues" value=\'["' + tagValues.join('","') + '"]\'>';
            $('#tagValues').append(tagHidden);
        }
    });
    
  });
  
</script>
	<br><br>
	<input type="submit" id="sub" value="저장하기" class="studysave" onClick="return insertBoardcheck()">
</form:form>
</body>
<script>
$(document).ready(function() {
	$('.summernote').summernote({
 		placeholder: '내용',
	    minHeight: 370,
	    maxHeight: null,
	    focus: true, 
	    lang : 'ko-KR'
	});
});
</script>
</html>
