<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>

	#magQuizUpdateTable {
		width: 70%;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	#magQuizUpdateTable th {
		background-color: #49CAF2;
		color: black;
	}

</style>

<script type="text/javascript">

	function check(){
		
		if($('input[name="question"]').val()==""){
			alert('질문을 입력해주세요');
			$('input[name="question"]').focus();
			return false;
		}
		
		if($('input[name="qz_view1"]').val()==""){
			alert('선택지1을 입력해주세요');
			$('input[name="qz_view1"]').focus();
			return false;
		}
		
		if($('input[name="qz_view2"]').val()==""){
			alert('선택지2를 입력해주세요');
			$('input[name="qz_view2"]').focus();
			return false;
		}
		
		if($('input[name="qz_view3"]').val()==""){
			alert('선택지3을 입력해주세요');
			$('input[name="qz_view3"]').focus();
			return false;
		}
		
		if($('input[name="qz_view4"]').val()==""){
			alert('선택지4를 입력해주세요');
			$('input[name="qz_view4"]').focus();
			return false;
		}
		
		if($('input[name="answer"]').val()==""){
			alert('답을 입력해주세요');
			$('input[name="answer"]').focus();
			return false;
		}
		
		if($('textarea[name="interpre"]').val()==""){
			alert('답을 입력해주세요');
			$('textarea[name="answer"]').focus();
			return false;
		}
		
	}
	
	// 선택지 추가
    function addOption() {
        var container = document.getElementById("plusSelectOption");
        var optionCount = container.getElementsByTagName("div").length;

        // 최대 4개의 선택지까지만 추가 가능
        if (optionCount >= 4) {
            alert("최대 4개의 선택지까지만 추가할 수 있습니다.");
            return;
        }
 
        var newOption = document.createElement("div");
        newOption.innerHTML = "보기" + (optionCount + 1) + " : <input type='text' size='50' name='qz_view" + (optionCount + 1) + "' placeholder='선택지" + (optionCount + 1) + "'><br>";

        container.appendChild(newOption);
    }

    // 마지막 선택지 삭제
    function removeLastOption() {
        var container = document.getElementById("plusSelectOption");
        var optionCount = container.getElementsByTagName("div").length;

        // 선택지가 2개 이상이어야 삭제 가능
        if (optionCount > 1) {
            container.removeChild(container.lastChild);
        } else {
            alert("최소 1개의 선택지가 있어야 합니다.");
        }
    }

</script>

<form name="magQuizUpdateForm" method="post" action="quizUpdate.mag">
	<input type="hidden" name="qz_num" value="${ qz_num }">
	<input type="hidden" name="que_cate" value="${ quizCate }">
	<table id="magQuizUpdateTable" border=1>
		<tr>
			<th colspan=2>${ quizCate } 카테고리 ${ qz_num } 번 퀴즈 수정</th>
		</tr>
		<tr>
			<th>질문</th>
			<td>
				<input type="text" name="question" placeholder="질문을 입력해주세요" value="${ qb.question }">
			</td>
		</tr>
		<tr>
			<th>질문 선택지</th>
			<td id="quizOptionsContainer">
				<div id="plusSelectOption">
					<div>
						보기1 : <input type="text" size="50" name="qz_view1" placeholder="선택지1" value="${ qz_view1 }"><br>
					</div>
					<div>
						보기2 : <input type="text" size="50" name="qz_view2" placeholder="선택지2" value="${ qz_view2 }"><br>
					</div>
					<div>
						보기3 : <input type="text" size="50" name="qz_view3" placeholder="선택지3" value="${ qz_view3 }"><br>
					</div>
					<div>
						보기4 : <input type="text" size="50" name="qz_view4" placeholder="선택지4" value="${ qz_view4 }"><br>
					</div>
				</div>
				<div id="plusMinusButton">
					<input type="button" value="선택지 추가" onclick="addOption()">
            		<input type="button" value="선택지 삭제" onclick="removeLastOption()">
				</div>
			</td>
		</tr>
		<tr>
			<th>답</th>
			<td>
				<input type="text" name="answer" placeholder="답을 입력해주세요" value="${ qb.answer }">
			</td>		
		</tr>
		<tr>
			<th>해설</th>
			<td>
				<textarea name="interpre" cols="60" rows="10" style="resize: none;">${ qb.interpre }</textarea>
			</td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="submit" value="추가하기" onClick="return check()">			
			</th>
		</tr>
	</table>
</form>