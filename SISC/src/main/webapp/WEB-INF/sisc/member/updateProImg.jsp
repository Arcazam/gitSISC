<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>

<style>
    img {
        width: 100px;
        height: 100px;
    }
</style>

<body>
    <form id="updateForm" action="updateImg.mb" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${mb.id}">
        <c:if test="${loginInfo.pro_img eq 'defaultImg.png' }">
			<img id="preview" class="img-option" src="<%= request.getContextPath() %>/resources/member/pro_img/defaultImage.png">
		</c:if>
		<c:if test="${loginInfo.pro_img ne 'defaultImg.png' }">
			<img id="preview" id="profileImage" class="img-option" src="<%= request.getContextPath() %>/resources/member/${loginInfo.id }/pro_img/${loginInfo.pro_img}" />
		</c:if>
        <br>
        <input type="file" name="upload" value="${mb.pro_img}" onchange="previewImage(this);">
        <input type="hidden" name="upload2" value="${mb.pro_img}" onchange="previewImage(this);"><br>
        <input type="button" value="수정하기" onclick="saveAndClose('${id}','${pro_img}')" id="save">
    </form>
</body>

<script src="<%=request.getContextPath() %>/resources/js/jquery-1.11.3.min.js"></script>
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

        function saveAndClose(id,pro_img) {
            var formData = new FormData(document.getElementById("updateForm"));

            $.ajax({
                url: "updateImg.mb?id=" + id + "&pro_img=" + pro_img,
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    var updatedImageUrl = $('#preview').attr('src');
                    window.opener.updateProfileImage(updatedImageUrl);
                    self.close();
                },
                error: function(xhr, status, error) {
                    console.error(error); // 콘솔에 오류 메시지 출력
                    alert("데이터를 업데이트하는 중 오류가 발생했습니다.");
                }
            });
        }
    </script>