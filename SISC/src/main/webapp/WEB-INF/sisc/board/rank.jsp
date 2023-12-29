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
   
   .rTable{
   border-collapse: collapse;
   border-radius : 30px;
      border-style : hidden;
      box-shadow : 0 0 0 1px #666;
   margin: auto;
   width:50%;
   height: 120px;
   }
   </style>
   
   <div class="title">
   <span style="font-size: 40px; color: black;">랭킹</span>
   <br>
   <span style="color: gray;">채택을 가장 많이 받은 사람들이에요!</span>
   <hr style="width: 500px;">
   </div>
   
   <div>
   <table border=1 class="rTable">
      <tr>
         <td style="padding-left: 10px;">
         <font size="5">랭킹자리입니다</font>
         </td>
      </tr>
   </table>
   </div>
   
    
   
    