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

<script type="text/javascript">
	$(function() {
		/** 결제 모달 */
		$(document).on(function(e) {
			e.preventDefault();
			
			// 강제호출
			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}
			});// end ajaxSubmit
		});// end on
	}); // end jquery
</script>

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
			<p>후원금액 : <span>${readPledges.fundMoney }</span>원</p>
			<p>
				<c:choose>
					<c:when test="${readPledges.presentId>0}">
						선물 : <span>${info }</span>
					</c:when>
					<c:otherwise>
						선물을 선택하지 않았습니다.
					</c:otherwise>
				</c:choose>
			</p>
		</div>
	</div>
	<!-- //payment title -->
	<!-- payment -->
	<div class="payment">
		<div class="container">
			<p>결제 수단을 선택하세요</p>
			
			<a href="${pageContext.request.contextPath }
			/pledges/payment_select.do
			?select_pay=1&member_id=${loginInfo.id }
			&project_id=${readPledges.projectId }
			&present_id=${readPledges.presentId }
			&fund_money=${readPledges.fundMoney }"
			data-toggle="modal" data-target="#payment_card_modal">신용 / 체크 카드</a>
			
			<a href="${pageContext.request.contextPath }
			/pledges/payment_select.do
			?select_pay=2&member_id=${loginInfo.id }
			&project_id=${readPledges.projectId }
			&present_id=${readPledges.presentId }
			&fund_money=${readPledges.fundMoney }"
			data-toggle="modal" data-target="#payment_bank_modal">은행 결제</a>
			
			<a href="${pageContext.request.contextPath }
			/pledges/payment_select.do
			?select_pay=3&member_id=${loginInfo.id }
			&project_id=${readPledges.projectId }
			&present_id=${readPledges.presentId }
			&fund_money=${readPledges.fundMoney }"
			data-toggle="modal" data-target="#payment_point_modal">포인트 결제</a>
		</div>
	</div>
	<!-- //payment -->
	
	<!-- 카드결제모듈 모달 -->
	<div class="modal fade" id="payment_card_modal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				
			</div>
		</div>
	</div>
	
	<!-- 은행결제모듈 모달 -->
	<div class="modal fade" id="payment_bank_modal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				
			</div>
		</div>
	</div>
	
	<!-- 포인트결제모듈 모달 -->
	<div class="modal fade" id="payment_point_modal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				
			</div>
		</div>
	</div>
	
	

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
