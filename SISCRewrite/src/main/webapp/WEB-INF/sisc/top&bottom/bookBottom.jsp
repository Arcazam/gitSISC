<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
body {
    margin: 0; /* 기본 마진 초기화 */
    padding: 0; /* 기본 패딩 초기화 */
}

.footer {
    position: sticky;
    bottom: 0;
    width: 100%;
    border-top: 1px solid #e4e4e4;
    background-color: #f8f9fa;
    padding: 1rem 0;
    display: flex;
    flex-direction: row;
    justify-content: space-around; /* 수정: 아이템 간격을 조절하여 가운데로 모이게 함 */
}

.footer-item {
    font-size: 0.9rem;
    color: #545e6f;
    margin: 0.4rem 1rem; /* 왼쪽과 오른쪽 마진 조절 */
}

.footer-item img {
    display: block; /* 이미지를 블록 요소로 설정하여 다른 요소와 분리 */
    width: 24px; /* 이미지 너비 조절 */
    height: 24px; /* 이미지 높이 조절 */
    margin-bottom: 0.2rem; /* 이미지 아래 여백 조절 */
}
</style>

<footer class="footer">
  <div class="footer-item">
    <div>
        <table style="text-align: center; margin: 0 auto;">
            <tr>
                <td>
                    <img src="<%=request.getContextPath()%>/resources/images/책방홈페이지이미지.png" alt="Home Icon" style="display: block; margin: 0 auto;">
                </td>
            </tr>
            <tr>
                <td>
                    홈
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="footer-item">
    <div>
        <table style="text-align: center;">
            <tr>
                <td>
                       <img src="<%=request.getContextPath()%>/resources/images/판매하기.png" alt="Sell Icon" style="display: block; margin: 0 auto;">
                </td>
            </tr>
            <tr>
                <td>
                    판매하기
                </td>
            </tr>
        </table>
    </div>
</div>
    	
    <div class="footer-item" >
        <div><div><table style="text-align: center;">
        <tr>
        <td>
            <img src="<%=request.getContextPath()%>/resources/images/마이페이지.png" alt="MyPage Icon" style="display: block; margin: 0 auto;">
            </td>
            <tr>
            <td>
            마이페이지
            </td>
            </tr>
            </table>
        </div>
    </div>
</footer>
