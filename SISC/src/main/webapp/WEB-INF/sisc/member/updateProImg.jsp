<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jQuery 라이브러리 추가 -->
<script src="<%=request.getContextPath() %>/resources/js/jquery-1.11.3.min.js"></script>
<style>
    img {
        width: 100px;
        height: 100px;
    }
</style>

<script>
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#preview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]); // 읽어온 파일을 Data URL로 변환하여 이미지에 적용
        }
    }
</script>

<form action="updateImg.mb" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${mb.id }">
    <img id="preview" class="img-option" src="<%= request.getContextPath() %>/resources/member/pro_img/${loginInfo.pro_img }"><br>
    <input type="file" name="upload" value="${mb.pro_img }">
    <input type="hidden" name="upload2" value="${mb.pro_img }" onchange="previewImage(this);"><br>
    <input type="submit" value="수정하기">
</form>

