
$(function() {
	// 로딩 이미지를 표시하기 위한 div 를 jquery 로 추가하기
	var loader = $('<div>').addClass('ajax-loader');
	loader.hide();
	$("body").prepend(loader);
	
	$.ajaxSetup({
		/** ajax 기본 옵션 */
		cache: false,
		dataType: 'json', // html, xml, json
		timeout: 30000,
		
		beforeSend: function() {
			// 현재 통신중인 대상 페이지를 로그로 출력함
			console.log(">> ajax 통신 시작 >> "+this.url);
			loader.show();
		},
		error: function(error) {
			console.log(">> 에러!!! >> "+error.status);
			
			var error_msg = "["+error.status+"]"+error.statusText;
			var code = parseInt(error.status / 100);
			if(code == 4) { // 400 번대 에러
				error_msg = "잘못된 요청입니다.\n" + error_msg;
			} else if (code == 5) {
				error_msg = "서버의 응답이 없습니다.\n" + error_msg;
			} else if (code == 2 || code == 0) {
				error_msg = "서버의 응답이 잘못되었습니다.\n" + error_msg;
			}
			/**
			 * 404 : page not found
			 * $.ajax() 함수에 명시한 url 속성이 잘못되었거나, 서버에 해당 url 에 대한 페이지 없을 경우
			 * 
			 * 403 : 권한 없음
			 * url 이 폴더까지만 지정된 경우, 해당 폴더에 index 페이지가 없으면 발생
			 * 
			 * 500~ : 서버 프로그램 오류(java)
			 * 
			 * 200, 0 : 서버의 결과를 잘 받아온 경우,
			 * 통신에 성공했음에도 에러가 발생하는 이유는 서버에서 전달된 응답의 내용이 $.ajax 에서 정의한 dataType 속성의
			 * 형식에 맞지 않아서
			 */
			alert(error_msg);
		},
		complete: function() {
			console.log(">> ajax 통신 종료 >>");
			loader.hide();
		}
	});
	
	
	
	
	
});


//html 특수문자를 원래의 구문으로 되돌리는 함수.
	function htmlspecialchar_decode(content) {
		// 임의의 html 태그를 생성하여 내용을 출력시킨다.
		// -> append 등의 출력 처리를 하지 않았으므로 화면에 표시되지는 않는다
		var div = $("<div>").html(content);
		// 브라우저에 표시될 내용을 리턴한다.
		return div.text();
	}


