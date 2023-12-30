/**
 * 
 */
 
 function checkBook(){
		
		if($('input[name="upload1"]').val()==""){
			alert('대표 겉표지 사진은 필수적으로 업로드 하셔야합니다');
			$('input[name="upload1"]').focus();
			return false;
		}
		
		if($('input[name="title"]').val()==""){
			alert('제목이 누락되었습니다');
			$('input[name="title"]').focus();
			return false;
		}
		
		if($('input[name="writer"]').val()==""){
			alert('저자가 누락되었습니다');
			$('input[name="writer"]').focus();
			return false;
		}
		 
		if($('input[name="publisher"]').val()==""){
			alert('출판사가 누락되었습니다');
			$('input[name="publisher"]').focus();
			return false;
		}
		
		if($('input[name="pub_date"]').val()==""){
			alert('출간일이 누락되었습니다');
			$('input[name="pub_date"]').focus();
			return false;
		}
		
		if($('input[name="dis_price"]').val()==""){
			alert('중고판매가 가 누락되었습니다');
			$('input[name="dis_price"]').focus();
			return false;
		}
		
		if(isNaN($('input[name="dis_price"]').val())) {
			alert('중고판매가는 숫자로 입력해주세요');
			$('input[name="dis_price"]').select();
			return false;
		}
		
		if($('input[name="tradeway"]').val()==""){
			alert('거래 방식이 누락되었습니다');
			$('input[name="tradeway"]').focus();
			return false;
		}
		
		if($('input[name="tradeplace"]').val()==""){
			alert('거래 장소가 누락되었습니다');
			$('input[name="tradeplace"]').focus();
			return false;
		}
		
	}
 