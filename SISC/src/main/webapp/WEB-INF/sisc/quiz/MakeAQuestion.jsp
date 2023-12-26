<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<script>

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


function reloadPage() {
    if (confirm("다른 문제를 불러오시겠습니까?")) {
        location.reload();
    } else {
        return;
    }
}


</script>

	<h3>${ que_cate } 문제 </h3>
		<c:forEach var="qb" items="${ list }">
			<h3>${ qb.question }</h3>
			<div id="checkAnswerMessage${ qb.qz_num }" style="display: none;"></div>
			<p>${ qb.qz_view }</p>
			<span id="answer${ qb.qz_num }" style="display: none;">
				답 : ${ qb.answer }
			</span>
			<p id="interpre${ qb.qz_num }" style="display: none;">
				해설 : ${ qb.interpre }
			</p>
			<br>
			<hr>	
		</c:forEach>
		
		<input type="button" id="sub" value="정답확인">
		<input type="button" value="다른문제풀기" onClick="reloadPage()">