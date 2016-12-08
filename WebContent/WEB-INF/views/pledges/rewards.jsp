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
				<span>${loginInfo.name }</span> 님이 후원할 프로젝트 : <br />
				<span>${title }</span>
			</h5>
		</div>
	</div>
	<!-- //payment title -->
	
	<!-- rewards -->
	<div class="rewards">
		
		
		<!-- reward item -->
		<c:choose>
			<c:when test="${fn:length(readPresent) > 0 }">
				<c:forEach var="readPresent" items="${readPresent }">
					
					<div class="container">
						<form method="post" action="${pageContext.request.contextPath }/pledges/payment.do">
							<!-- 상태유지 -->
							<input type="hidden" name="project_id" value="${readPresent.projectId }" />
							<input type="hidden" name="present_id" value="${readPresent.id }" />
							<input type="hidden" name="title" value="${title }" />
							<input type="hidden" name="info" value="${readPresent.info }" />
							<div>
								<input type="number" name="fund_money" value="${readPresent.money }" min="${readPresent.money }" maxlength="12" /> 원
								<p>이 선물을 선택하기위한 최소 금액은 <strong>${readPresent.money }</strong>원 입니다.</p>
								<p>더 많이 입력하실 수 있습니다.</p>
							</div>
							<div>
								<button type="submit" class="btn btn-primary">선택하기</button>
								<button type="reset" class="btn btn-info">최소금액</button>
							</div>
						</form>
						<div>
							<p>
								${readPresent.info }
							</p>
						</div>
					</div>
					
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>조회된 선물 목록이 없습니다.</p>
			</c:otherwise>
		</c:choose>
		<!-- //reward item -->

	</div>
	<!-- //rewards -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
