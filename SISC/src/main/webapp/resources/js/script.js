/**
 * 
 */
 
 function checkBook(){
		
		if($('input[name="seller_name"]').val()==""){
			alert('판매자 이름이 누락되었습니다');
			$('input[name="seller_name"]').focus();
			return false;
		}
		
		if($('input[name="seller_pnum1"]').val()==""||$('input[name="seller_pnum2"]').val()==""||$('input[name="seller_pnum3"]').val()==""){
			alert('판매자 연락처가 누락되었습니다');
			$('input[name="seller_pnum1"]').focus();
			return false;
		}
		
		if(isNaN($('input[name="seller_pnum2"]').val() || $('input[name="seller_pnum3"]').val())) {
			alert('핸드폰 번호는 숫자로 입력해주세요');
			$('input[name="seller_pnum2"]').select();
			return false;
		}
		
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
		
		if($('input[name="pri_price"]').val()==""){
			alert('원가가 누락되었습니다');
			$('input[name="pri_price"]').focus();
			return false;
		}
		
		if(isNaN($('input[name="pri_price"]').val())) {
			alert('원가는 숫자로 입력해주세요');
			$('input[name="pri_price"]').select();
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
		
		if(!$('input[name="kind1"]').is(':checked')){
			alert('밑줄 흔적이 누락되었습니다');
			$('input[name="kind1"]').focus();
			return false;
		}
		
		if(!$('input[name="kind2"]').is(':checked')){
			alert('필기 흔적이 누락되었습니다');
			$('input[name="kind2"]').focus();
			return false;
		}
		
		if(!$('input[name="kind3"]').is(':checked')){
			alert('겉표지 상태가 누락되었습니다');
			$('input[name="kind3"]').focus();
			return false;
		}
		
		if(!$('input[name="kind4"]').is(':checked')){
			alert('이름 기입이 누락되었습니다');
			$('input[name="kind4"]').focus();
			return false;
		}
		
		if(!$('input[name="kind5"]').is(':checked')){
			alert('페이지 변색이 누락되었습니다');
			$('input[name="kind5"]').focus();
			return false;
		}
		
		if(!$('input[name="kind6"]').is(':checked')){
			alert('페이지 훼손이 누락되었습니다');
			$('input[name="kind6"]').focus();
			return false;
		}
		
		if($('textarea[name="sell_content"]').val()==""){
			alert('판매 코멘트가 누락되었습니다');
			$('textarea[name="sell_content"]').focus();
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
 