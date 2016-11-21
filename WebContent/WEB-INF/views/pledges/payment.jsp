<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- http://java.sun.com/jsp/jstl/cored 에 정의된 JSTL 기능을 "c"라는 이름으로 정의 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>



</head>
<body>
	<%@ include file="/WEB-INF/views/inc/topnav.jsp"%>

	<!-- payment title -->
	<div class="payment_title">
		<div class="container">
			<h5>
				이주영 님이 후원할 프로젝트 : <br />
				<span>고양이 밥먹이기 고양이 밥먹이기 고양이 밥먹이기</span>
			</h5>
			<p>
				후원금액 : <span>10,000</span>원
			</p>
			<p>보상품 : 선물1 / 선물2 / 선물3</p>
		</div>
	</div>
	<!-- //payment title -->
	<!-- payment -->
	<div class="payment">
		<div class="container">
			<p>결제 수단을 선택하세요</p>
			<a href="#">신용 / 체크 카드</a>
		</div>
	</div>
	<!-- //payment -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
