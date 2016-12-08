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

	<!-- payment ok -->
	<div class="container">
		<div class="start_project_ok">
			<h3>결제되었습니다.</h3>
			<p>${loginInfo.name } 님의 결제정보<br />
			상호 : ${company }<br />
			금액 : ${pledges.fundMoney }</p>
			<c:choose>
				<c:when test="${selectPay == 1}">
					<p>카드사 : ${cardBrand }<br />
					카드번호 : ${cardNumber }<br />
					유효기간 : ${cardYmd }<br />
					비밀번호 : ${cardPassword }</p>
				</c:when>
				<c:when test="${selectPay == 2}">
					<p>은행 : ${bankBrand }<br />
					계좌번호 : ${bankNumber }<br />
					비밀번호 : ${bankPassword }<br />
					주민번호 : ${juminNumber }</p>
				</c:when>
				<c:when test="${selectPay == 3}">
				
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			
			
			<a href="${pageContext.request.contextPath }/member/mypledges.do?member_id=${loginInfo.id }">내 후원현황 보러가기</a>
		</div>
	</div>
	<!-- //payment_ok -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
