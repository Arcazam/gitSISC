<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top&bottom/top.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<link href="<%=request.getContextPath() %>/resources/css/btn.css" rel="stylesheet" type="text/css" /> 

<style>
@font-face {
	font-family: 'TAEBAEKfont';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/TAEBAEKfont.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.sbtn {
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

.tagBtn{
font-family: 'TAEBAEKfont';
height: 40px;
font-size: 20px;
border-radius: 10px;
margin-left: 10px;
background-color : rgb(255,255,255,0.4);
}

.selectSet{
float: right;
width: 140px;
height: 40px;
font-size: 20px;
border-radius: 10px;
}
</style>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
<script>

   function updateBoardcheck(){
      
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

<!-- 다른 페이지와 똑같은 스타일 적용을 위해 추가한 부분 -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/kfonts2.css" rel="stylesheet">

<body>
<br><br>
<form:form commandName="updatebb" class="container" method="post" action="update.bd" enctype="multipart/form-data">
   <div style="margin-top: -10px; font-family: 'TAEBAEKfont';">
   <b><font size="6">${updateBoardName }게시판에서 수정 중</font></b>
   <input type="hidden" name="b_num" value="${updatebb.b_num }">
   <input type="hidden" name="pageNumber" value="${pageNumber }">
   <input type="hidden" name="writer" style="width: 40%;" value="${ mb.id }" readonly>
   <select name="b_cate" class="selectSet">
       <option value="">게시판 선택</option>
       <option value="Free" <c:if test="${ board == 'Free'}">selected</c:if>>자유</option>
       <option value="Know" <c:if test="${ board == 'Know'}">selected</c:if>>지식</option>
       <option value="QnA" <c:if test="${ board == 'QnA'}">selected</c:if>>QnA</option>
       <option value="Grad" <c:if test="${ board == 'Grad'}">selected</c:if>>수료생</option>
   </select>
   <br>
   </div>

   <br><br>
   <input type="text" name="subject" style="width: 47%; height: 40px; font-size: 20px; border-radius: 10px;" value="${ updatebb.subject }" placeholder="제목"/>
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
   <textarea class="summernote" name="content">${ updatebb.content }</textarea>
   <br>
   
   <table>
   
   <tr>
   <td>
   <!-- 태그를 입력할 텍스트 필드 -->
   <input type="text" name="taginfo" style="height: 40px; font-size: 20px; border-radius: 10px;" placeholder="태그를 입력해주세요">
   </td>
   <td>
   <!-- 태그를 입력할수있는 버튼 -->
   <input type="button" id="tagInsert" class="tagBtn" value="추가"><br>
   </td>
   </tr>
   
   <tr>
   <td colspan=2>
   <!-- 태그를 하나라도 입력했을 때 나타나는 메세지 -->
   <span id="tagMessage">
   </span>
   </td>
   </tr>
   
   <tr>
   <td colspan=2>
   <!-- 어떠한 태그가 입력이 되었는지 나타나는 영역 -->
   <div id="tagList"></div>
   </td>
   </tr>
   
   <tr>
   <td>
   <!-- input type hidden 으로 넘길 영역 -->
   <div id="tagValues">
    	<c:if test="${not empty updatebb.taglist}">
        	<c:forEach var="tag" items="${updatebb.taglist}">
            	<div class="removeTag" style="cursor: pointer; color: red;">
                	<font color="blue">#${tag}</font>
            	</div>
	        </c:forEach>
	    </c:if>
	</div>
   </td>
   </tr>
   
   </table>
   
   <br><br>
   <input type="submit" id="sub" value="저장하기" class="studysave" onClick="return updateBoardcheck()">
   
   <br><br><br><br>
   <br><br><br><br>
   
</form:form>
</body>


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
        if(tagValues.length == 0){
           var tagHidden = '<input type="hidden" name="tagValues" value="noTag">';
            $('#tagValues').append(tagHidden);
        }
    });
    
  });
  
</script>

<script>
$(document).ready(function() {
    $('.summernote').summernote({
      placeholder: '스타일 코드 입력시 줄바꿈은 shift + enter를 누르셔야 합니다.',
      minHeight: 370,
      maxHeight: 1000,
      focus: true,
      lang: 'ko-KR',
      callbacks: {
        onImageUpload: function(files) {
          // 이미지 업로드 콜백
          for (var i = 0; i < files.length; i++) {
            uploadImage(files[i]);
          }
        }
      }
    });
  });

  function uploadImage(file) {
    var reader = new FileReader();
    reader.onloadend = function() {
      var img = new Image();
      img.src = reader.result;
      img.onload = function() {
        var maxWidth = 600; // 이미지 최대 폭
        var maxHeight = 400; // 이미지 최대 높이

        var ratio = 1; // 비율 초기화
        if (img.width > maxWidth) {
          ratio = maxWidth / img.width; // 너비에 따른 비율 계산
        } else if (img.height > maxHeight) {
          ratio = maxHeight / img.height; // 높이에 따른 비율 계산
        }

        // 새로운 크기 계산
        var newWidth = img.width * ratio / 3;
        var newHeight = img.height * ratio / 3;

        var canvas = document.createElement('canvas');
        var ctx = canvas.getContext('2d');
        canvas.width = newWidth;
        canvas.height = newHeight;
        ctx.drawImage(img, 0, 0, newWidth, newHeight);

        var dataURL = canvas.toDataURL('image/jpeg');

        // Summernote에 이미지 삽입
        $('.summernote').summernote('editor.insertImage', dataURL);
        
      };
    };
    reader.readAsDataURL(file);
  }
</script>
</html>