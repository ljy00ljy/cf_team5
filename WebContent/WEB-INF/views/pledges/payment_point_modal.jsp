<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- http://java.sun.com/jsp/jstl/cored 에 정의된 JSTL 기능을 "c"라는 이름으로 정의 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form id="payment_point_modal" method="post" action="${pageContext.request.contextPath }/pledges/payment_ok.do">
	<!-- 상태유지 -->
	<input type="hidden" name="select_pay" value="${selectPay }" />
	<input type="hidden" name="project_id" value="${readPledges.projectId }"/>
	<input type="hidden" name="present_id" value="${readPledges.presentId }"/>
	<input type="hidden" name="member_id" value="${loginInfo.id }" />
	
	<!-- modal header -->
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title" id="myModalLabel">주영 페이</h4>
		<p>포인트 결제</p>
	</div>
	
	<!-- modal body -->
	<div class="modal-body">
		<p style="font-weight: bold; font-size: 2em; text-align: center;">준비중입니다.</p>
	</div>
	
	<!-- modal footer -->
	<!-- <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취  소</button>
		<button type="submit" class="btn btn-primary">결  제</button>
	</div> -->
</form>