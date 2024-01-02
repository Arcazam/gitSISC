<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object loginInfo = session.getAttribute("loginInfo");
	if(loginInfo == null){%>
		<%@ include file="../top&bottom/top.jsp"%>
	<%}else{%>
		<%@ include file="../top&bottom/topLogin.jsp"%>
	<%}%>
   
    
    <style>
    	
    	#QuizTable {
    		margin: 0 auto;
    		width:65%;
    		border-spacing:0px;
    	}
    	
    	#QuizTable th {
    		background-color : green;
			color : yellow;
    	}
    	
    	#quizCateList {
    		width : 10%;
    		font-size: 18px;
    	}
    	
    </style>
    
<table id="QuizTable" border=1>

	<tr>
		<th colspan=2>퀴즈를 선택 하세요	</th>
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
		<td id="quizShow" style="margin-left: 20px;">
		<h1 id = "firstShow"  style="text-align: center; margin-top: 70px;">퀴즈를 선택해주세요</h1>
			<h3>&nbsp;${ que_cate } <span id="answer" style="display: none;">문제</span> </h3>
			<c:forEach var="qb" items="${ list }">
				<h3>&nbsp;${ qb.question }</h3>
				<div id="checkAnswerMessage${ qb.qz_num }" style="display: none;"></div>
				<p>${ qb.qz_view }</p>
				<span id="answer${ qb.qz_num }" style="display: none;">
					&nbsp;답 : ${ qb.answer }
				</span>
				<p id="interpre${ qb.qz_num }" style="display: none;">
					&nbsp;해설 : ${ qb.interpre }
				</p>
				<br>
				<hr>	
			</c:forEach>
			<input type="button" id="sub" value="정답확인" style="display: none">
			<input type="button" id="show" value="다른문제풀기" onClick="reloadPage()" style="display: none">
		</td>
	</tr>
</table>

<script>

//다른문제풀기 버튼 클릭 시 동작
function reloadPage() {
    if (confirm("다른 문제를 불러오시겠습니까?")) {
        location.reload();	
        sessionStorage.setItem('showButton', 'true');
    } else {
        return;
    }
}


$(function () {

	var questNumListString = '${calculate_list}';
    questNumListString = questNumListString.substring(1, questNumListString.length - 1);
    var questNumList = questNumListString.split(',').map(Number);
    var questNumLength = questNumList.length;
    
 
    $('#sub').click(function () {

        for (var i = 0; i < questNumLength; i++) {
            var checkSelectedValue = 'q' + questNumList[i];
            var questSelectedValue = $('input[name="' + checkSelectedValue + '"]:checked');
            processAnswer(questNumList[i], i);
        }
        
    });

    function processAnswer(questNum,i) {
        var questRadioNum = "q" + questNum;
        var questSelected = $('input[name="' + questRadioNum + '"]:checked');        
        if (questSelected.length > 0) {
            var selectedValue = questSelected.val();

            $.ajax({
                url: "checkAnswer.qz",
                data: {
                    questionNumber: questNum,
                    selectedValue: selectedValue
                },
                success: function (data) {
                    var checkAnswerMessage = $('#checkAnswerMessage' + questNum);
                    var answerElement = $('#answer' + questNum);
                    var interpreElement = $('#interpre' + questNum);                    
                    
                    if ($.trim(data) === 'correct') {
                        checkAnswerMessage.html("<font color=blue>정답입니다</font>").show();
                        answerElement.show();
                        interpreElement.show();
                    } else {
                        checkAnswerMessage.html("<font color=red>오답입니다</font>").show();
                        answerElement.show();
                        interpreElement.show();
                    }
                },
                error: function (error) {
                    console.error("AJAX 요청 에러:", error);
                }
            });
        }
    }
});

$(function () {
    // 퀴즈 카테고리를 선택한 경우 버튼 영역을 보여줌
    $('#quizCateList a').click(function () {
        sessionStorage.setItem('showButton', 'true');
        $('#answer').show();
        $('#sub').show();
        $('#show').show();
        $('#firstShow').hide();
    });

    // 페이지 로드 시 저장된 상태에 따라 버튼 표시
    if (sessionStorage.getItem('showButton') === 'true') {
        $('#answer').show();
        $('#sub').show();
        $('#show').show();
        $('#firstShow').hide(); 
    }

    // 정답확인 버튼 클릭 시 동작
    $('#sub').click(function () {
        // 정답 확인 로직 구현
    });

});
</script>