<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object loginInfo = session.getAttribute("loginInfo");
	if(loginInfo == null){%>
		<%@ include file="../top&bottom/top.jsp"%>
	<%}else{%>
		<%@ include file="../top&bottom/topLogin.jsp"%>
	<%}%>
   
  <head>
    
    <style>
    
    /* "캐러셀 슬라이드" 설정 */
    .container{
    width: auto;
    }
    
    .carousel-inner {
    width: 100%;
    height: auto; /* 이미지 높이 변경 */
    }
    
    .carousel-inner img {
    width: 100%;
    height: auto;
    }
    
    /* "상단 메뉴 5개" 설정 */
    .menu{
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    font-family: 'TAEBAEKfont';
    }
    
    /* "인기태크" 설정 */
    .popStar{
    font-family: 'TAEBAEKfont';
    }
    
    /* "게시판 4개 div" 설정 */
    .middle{
    margin-top: 10px;
    display: flex;
    flex-direction: row;
    }
    
    /* "자유, Q&A 게시판" 설정 */
    .board_table {
      margin-left: 300px;
      width: 500px;
      height: 450px;
      border-collapse : collapse;
      border-radius : 30px;
      border-style : hidden;
      box-shadow : 0 0 0 1px #666;
      font-family: 'TAEBAEKfont';
      }
   
      /* "지식, 수료생 게시판" 설정 */
    .board_table2 {
      margin-left: 100px;
      width: 500px;
      border-collapse : collapse;
      border-radius : 30px;
      border-style : hidden;
      box-shadow : 0 0 0 1px #666;
      font-family: 'TAEBAEKfont';
      }
   
      /* "게시판 이름" 설정 */
      .tableBoard{
      height: 50px;
      padding-left: 20px;
      font-size: 1.5em;
      }
   
      /* "작성자 프로필 이미지" 설정 */
      .tableImg{
      width:25px;
      height: 25px;
      border-radius: 100px;
      margin-left: 5px;
      margin-top: 5px;
      }
   
      /* "댓글 모양 이미지" 설정 */
      .tableImg2{
      width:30px;
      height: 30px;
      border-radius: 100px;
      margin-left: 360px;
      }
   
      /* "게시글 제목" 설정 */
      .tableTitle{
      height: 30px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      max-width: 150px;
      padding-left: 5px;
      border-top: none;
      }
   
   /* "게시글 더보기" 설정 */
   #more{
   text-decoration-line: none;
   color: black;
   }
   #more:hover{
   color: #0095FF;
   }
   
   /* "중고 책방" div 설정 */
   .bottom{
    display: flex;
      flex-direction: row;
      margin-left: 300px;
    }
    
    /* "중고 책방 글씨" 설정 */
    .usedBook1{
    margin-left: 300px;
    font-size: 2.5em;
    font-family: 'TAEBAEKfont';
    }
    
    /* "중고 책방 더보기" 설정 */
    .usedBook2{
    margin-left: 875px;
    font-size: 2em;
    font-family: 'TAEBAEKfont';
    }
   
   /* 중고 책방 게시판 설정 */
   .book {
  position: relative;
  border-radius: 10px;
  width: 150px;
  height: 200px;
  background-color: whitesmoke;
  -webkit-box-shadow: 1px 1px 12px #000;
  box-shadow: 1px 1px 12px #000;
  -webkit-transform: preserve-3d;
  -ms-transform: preserve-3d;
  transform: preserve-3d;
  -webkit-perspective: 2000px;
  perspective: 2000px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  color: #000;
  margin-right: 40px;
}
img{
   width: 150px;
     height: 200px;
}
.cover {
  top: 0;
  position: absolute;
  background-color: lightgray;
  width: 100%;
  height: 100%;
  border-radius: 10px;
  cursor: pointer;
  -webkit-transition: all 0.5s;
  transition: all 0.5s;
  -webkit-transform-origin: 0;
  -ms-transform-origin: 0;
  transform-origin: 0;
  -webkit-box-shadow: 1px 1px 12px #000;
  box-shadow: 1px 1px 12px #000;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
}

.book:hover .cover {
  -webkit-transition: all 0.5s;
  transition: all 0.5s;
  -webkit-transform: rotatey(-80deg);
  -ms-transform: rotatey(-80deg);
  transform: rotatey(-80deg);
}

p {
  font-size: 20px;
  font-weight: bolder;
}
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script>
      $('.carousel').carousel()  /* 1 */
    </script>
    
    <script>
    function changeTextColor(index, isMouseOver) {
        var menuText = document.getElementById("menuText" + index);
        if (isMouseOver) {
            menuText.style.color = "#0095FF";
        } else {
            menuText.style.color = ""; // 빈 문자열로 설정하면 원래 스타일로 돌아갑니다.
        }
    }
   </script>
    
  </head>
    
    <!-- 이 위부터는 style과 script 설정입니다 -->
    
     <div class="container" style="padding-left: 0px; padding-right: 0px;">
        <div id="carousel-example-generic" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img src="<%=request.getContextPath() %>/resources/images/test1.jpg" class="slideImg" alt="First slide">
                </div>

                <div class="item">
                    <img src="<%=request.getContextPath() %>/resources/images/test2.jpg" alt="Second slide">
                </div>

                <div class="item">
                    <img src="<%=request.getContextPath() %>/resources/images/test1.jpg" alt="Third slide">
                </div>

                <div class="item">
                    <img src="<%=request.getContextPath() %>/resources/images/test2.jpg" alt="Fourth slide">
                </div>

                <div class="item">
                    <img src="<%=request.getContextPath() %>/resources/images/test1.jpg" alt="Fifth slide">
                </div>
            </div>

            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="icon-prev"></span>
            </a>

            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="icon-next"></span>
            </a>
        </div>
    </div> <!-- 캐러쉘 슬라이드 끝 -->
     
     <br><br>
     
     <div class="menu">
     <%
     String [] menus = {"공지사항", "랭킹", "설문", "취업정보", "문의"};
     String [] menuImgs = {"test1.jpg", "test2.jpg", "logo.jpg", "logo.jpg", "logo.jpg"};     
     %>
     
     <c:set var="menu" value="<%= menus %>"/>
     <c:set var="menuImg" value="<%= menuImgs %>"/>
     
     <c:forEach var="i" begin="0" end="${fn:length(menu) -1}" step="1">
     <div class="menu-item">
        <table>
           <tr>
              <td style="text-align: center;">
              <c:if test="${menu == '공지사항' }">
              <c:set var="link" value="findMemberID.mb"/>
              </c:if>
              
              <c:if test="${menu == '랭킹' }">
              <c:set var="link" value="insertMember.mb"/>
              </c:if>
                 <a href="${link }"><img src="<%=request.getContextPath()%>/resources/images/${menuImg[i]}" class="menu-image" 
                 onmouseover="changeTextColor(${i}, true)" onmouseout="changeTextColor(${i}, false)"
                 style="width:60px; height: 60px; border-radius: 100px;"></a>
              </td>
           </tr>
           
           <tr>
              <td style="text-align: center;">
                 <span id="menuText${i}" class="menu-text" style="font-size: 17px;">${menu[i]}</span>
              </td>
           </tr>
        </table>
     </div>
     </c:forEach>
     </div> <!-- 메뉴 설정 끝 -->
     
     <br><br>
     
     <div class="popStar">
     <center>
     <span style="font-size: 2.5em;">작성자 <font style="color: yellowgreen;">TOP</font>21</span>
     
     <hr style="width: 500px; size: 10px; color: green;">
     
     <table border=1 style="width: 1100px; height: 300px;">
        <tr>
           <td style="text-align:center;" colspan=2>1위</td>
           <td style="text-align:center;" colspan=2>2위</td>
           <td style="text-align:center;" colspan=2>3위</td>
        </tr>
        
        <tr>
           <td style="text-align:center;">4</td>
           <td style="text-align:center;">5</td>
           <td style="text-align:center;">6</td>
           <td style="text-align:center;">7</td>
           <td style="text-align:center;">8</td>
           <td style="text-align:center;">9</td>
        </tr>
        
        <tr>
           <td style="text-align:center;">10</td>
           <td style="text-align:center;">11</td>
           <td style="text-align:center;">12</td>
           <td style="text-align:center;">13</td>
           <td style="text-align:center;">14</td>
           <td style="text-align:center;">15</td>
        </tr>
        
        <tr>
           <td style="text-align:center;">16</td>
           <td style="text-align:center;">17</td>
           <td style="text-align:center;">18</td>
           <td style="text-align:center;">19</td>
           <td style="text-align:center;">20</td>
           <td style="text-align:center;">21</td>
        </tr>
     </table>
     </center>
     </div> <!-- 인기태그 끝 -->
     
     <br><br>
    
    <div class="middle">
      <table class="board_table" border=1>
         <tr>
            <td colspan=4 class="tableBoard">자유</td>
         </tr>
         
         <c:forEach var="i" begin="0" end="4" step="1">
        <tr>
            <td style="border-bottom: none;">
            <a href=""><img src="<%=request.getContextPath()%>/resources/images/logo.jpg" class="tableImg"></a>
            <span style="padding-top: 5px;"><a href="" id="more">작성자</a></span>
            <img src="<%=request.getContextPath()%>/resources/images/댓글.png" class="tableImg2">7
            </td>
         </tr>
         <tr>
            <td class="tableTitle">
            <a href="" id="more">제목 자리입니다. 제목 자리입니다. 제목 자리입니다. 제목 자리입니다. 제목 자리입니다.</a>
            </td>
         </tr>
         </c:forEach>
         
         <tr>
            <td style="height: 30px; text-align: center;"><a href="" id="more">더보기</a></td>
         </tr>
      </table>
      
      
      <table class="board_table2" border=1>
         <tr>
            <td colspan=4 class="tableBoard">지식</td>
         </tr>
         
         <c:forEach var="i" begin="0" end="4" step="1">
        <tr>
            <td style="border-bottom: none;">
            <a href=""><img src="<%=request.getContextPath()%>/resources/images/logo.jpg" class="tableImg"></a>
            <span style="padding-top: 5px;"><a href="" id="more">작성자</a></span>
            <img src="<%=request.getContextPath()%>/resources/images/댓글.png" class="tableImg2">7
            </td>
         </tr>
         <tr>
            <td class="tableTitle">
            <a href="" id="more">제목 자리입니다. 제목 자리입니다. 제목 자리입니다. 제목 자리입니다. 제목 자리입니다.</a>
            </td>
         </tr>
         </c:forEach>

         <tr>
            <td style="height: 30px; text-align: center;"><a href="" id="more">더보기</a></td>
         </tr>
      </table>
      </div> <!-- 자유 지식 게시글 끝 -->
      
      <br><br><br>
    
    <div class="middle">
      <table class="board_table" border=1>
         <tr>
            <td colspan=4 class="tableBoard">Q&A</td>
         </tr>
         
         <c:forEach var="i" begin="0" end="4" step="1">
        <tr>
            <td style="border-bottom: none;">
            <a href=""><img src="<%=request.getContextPath()%>/resources/images/logo.jpg" class="tableImg"></a>
            <span style="padding-top: 5px;"><a href="" id="more">작성자</a></span>
            <img src="<%=request.getContextPath()%>/resources/images/댓글.png" class="tableImg2">7
            </td>
         </tr>
         <tr>
            <td class="tableTitle">
            <a href="" id="more">코딩 뉴비 질문드립니다!</a>
            </td>
         </tr>
         </c:forEach>
         
         <tr>
            <td style="height: 30px; text-align: center;"><a href="" id="more">더보기</a></td>
         </tr>
      </table>
      
      <table class="board_table2" border=1>
         <tr>
            <td colspan=4 class="tableBoard">수료생</td>
         </tr>
         
         <c:forEach var="i" begin="0" end="4" step="1">
        <tr>
            <td style="border-bottom: none;">
            <a href=""><img src="<%=request.getContextPath()%>/resources/images/logo.jpg" class="tableImg"></a>
            <span style="padding-top: 5px;"><a href="" id="more">작성자</a></span>
            <img src="<%=request.getContextPath()%>/resources/images/댓글.png" class="tableImg2">7
            </td>
         </tr>
         <tr>
            <td class="tableTitle">
            <a href="" id="more">제목 자리입니다. 제목 자리입니다. 제목 자리입니다. 제목 자리입니다. 제목 자리입니다.</a>
            </td>
         </tr>
         </c:forEach>
         
         <tr>
            <td style="height: 30px; text-align: center;"><a href="" id="more">더보기</a></td>
         </tr>
      </table>
      </div> <!-- Q&A 수료생 게시글 끝 -->
    
    <br><br>
    
    <span class="usedBook1">중고책방</span>
    <span class="usedBook2"><a href="list.bk" id="more">더보기</a></span>
    <br><br>
    
    <div class="bottom">
    <c:forEach var="i" begin="0" end="5" step="1">
    <c:if test="${i < 6 }">
       <div class="book">
         <p>asd</p>
         <div class="cover">
            <p><img src="<%=request.getContextPath()%>/resources/bookImg/1.webp"></p>
          </div>
      </div>
    </c:if>
    </c:forEach>
    </div>
    <br><br>
    <div class="bottom">
    <c:forEach var="i" begin="0" end="5" step="1">
    <c:if test="${i < 6 }">
       <div class="book">
         <p>qwe</p>
         <div class="cover">
            <p><img src="<%=request.getContextPath()%>/resources/bookImg/2.webp"></p>
          </div>
      </div>
    </c:if>
    </c:forEach>
    </div>
    
    <br>
        
     <hr>
        
     <div style="padding-left: 100px;">
        SISC |
        이용약관 |
        개인정보처리방침 |
        고객센터 |
        상담 |
        광고·사업문의
        
       <a style="margin-left: 500px;">서비스 약관 | </a>
       <a href="">광고안내 | </a>
       <a href="">제휴문의 | </a>
       <a href="">고객센터 | </a>
       <a href="">찾아오시는 길</a>  
       
       <br><br>
       
       사업자등록번호 669-86-01888 통신판매업 신고번호 2020-성남분당B-0719 (사업자정보 확인) 대표이사 김예찬 웹사업자 쌍용비즈니스플랫폼
      <br>
      주소 경기도 성남시 분당구 분당내곡로 131 판교테크원 타워1, 11-12층 고객센터 1588-3820 이메일 ccnaver@naver.com
       <br><br>
       모든 콘텐츠의 저작권은 저작권자 또는 제공처에 있으며, 이를 무단으로 이용하는 경우 관련 법령에 따라 법적 책임을 질 수 있습니다.       
     </div>
     
     <br>
    
    </body>