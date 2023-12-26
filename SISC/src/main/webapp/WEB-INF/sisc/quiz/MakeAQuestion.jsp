<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<script>

	$(function () {
		
		// Java 배열을 문자열로 변환
        var questNumListString = '${calculate_list}';
        questNumListString = questNumListString.substring(1, questNumListString.length - 1);
        var questNumList = questNumListString.split(',').map(Number);
        var questNumLength = questNumList.length;
        
        var selectedData = []; // 데이터를 담을 배열 선언
		
		 $('#sub').click(function() {
			 
			 for (var i = 0; i < questNumLength; i++) {
				 
				 var questNum = questNumList[i];	// 실제 시퀀스 값이자 primary값
				 var questRadioNum = "q"+questNum;
				 var questSelected = $('input[name="'+questRadioNum+'"]:checked');
				 // 실제로 선택된 해당 radio 그룹의 선택된 값
				 
				 if (questSelected.length > 0) {
						var selectedValue = questSelected.val();
						
						$.ajax({
							
							url : "checkAnswer.qz",
							data : ({
								questionNumber: questNum,
			                    selectedValue: selectedValue
							}),
							success : function(data){
								if($.trim(data) == 'correct'){
									$('#checkAnswerMessage').html("<font color=blue>정답입니다</font>")
									$('#checkAnswerMessage').show();
									$('#answer').show();
									$('#interpre').show();
								} else {
									$('#checkAnswerMessage').html("<font color=red>오답입니다</font>")
									$('#checkAnswerMessage').show();
									$('#answer').show();
									$('#interpre').show();
								}
							}
							
						});
						
					} else {
						// 라디오 버튼이 선택되지 않았을 경우 알림 표시
						alert('미 선택된 문제가 있습니다. 확인후 다시 제출해주세요');
						return;  // 선택이 필요한 질문이 하나라도 있으면 종료
					}
				 
			 }
			 
		 });
			 
	});

</script>

	<h3>${ que_cate } 문제 </h3>
		<c:forEach var="qb" items="${ list }">
			<h3>${ qb.question }</h3>
			<div id="checkAnswerMessage${ qb.qz_num }" style="display: none;"></div>
			<p>${ qb.qz_view }</p>
			<span id="answer" style="display: none;">
				답 : ${ qb.answer }
			</span>
			<p id="interpre" style="display: none;">
				해설 : ${ qb.interpre }
			</p>
			<br>
			<hr>	
		</c:forEach>
		
		<input type="button" id="sub" value="정답확인">