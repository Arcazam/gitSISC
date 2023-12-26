<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    
    
    <style>
    	
    	#QuizTable {
    		margin: 0 auto;
    		width:80%;
    		border-spacing:0px;
    	}
    	
    	#QuizTable th {
    		background-color : green;
			color : yellow;
    	}
    	
    	#quizCateList {
    		width : 10%;
    	}
    	
    </style>
    
<table id="QuizTable" border=1>

	<tr>
		<th colspan=2>퀴즈를 선택해주세요</th>
	</tr>
	<tr valign=top>
		<td id="quizCateList">
			<table>
				<c:if test="${ !empty qlist }">
					<c:forEach var="qb" items="${ qlist }">
						<tr>
							<td>
								<a href="makeAQ.qz?que_cate=${ qb.que_cate }">${ qb.que_cate }</a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</td>
		<td id="quizShow">
			<!-- ajax로 받아온 jsp를 출력 -->
		</td>
	</tr>

</table>