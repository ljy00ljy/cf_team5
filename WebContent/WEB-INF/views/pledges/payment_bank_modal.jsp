<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- http://java.sun.com/jsp/jstl/cored 에 정의된 JSTL 기능을 "c"라는 이름으로 정의 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form id="payment_bank_modal" method="post" 
action="${pageContext.request.contextPath }/pledges/payment_ok.do">
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
		<p>인터넷뱅킹 결제</p>
	</div>
	
	<!-- modal body -->
	<div class="modal-body">
		<div class="form-group">
			<label for="fund_money">금액 : </label>
			<input type="number" name="fund_money" id="fund_money" 
			value="${readPledges.fundMoney }" readonly />
		</div>
		<div class="form-group">
			<label for="company">업체 : </label>
			<input type="text" name="company" id="company" 
			value="주영사" readonly />
		</div>
		<div class="form-group">
			<label for="bank_brand">은행명 : </label>
			<select name="bank_brand" id="bank_brand">
				<option label="0">-- 은행을 선택하세요 --</option>
				<option value="1">하나은행</option>
				<option value="2">두울은행</option>
				<option value="3">세엣은행</option>
				<option value="4">네엣은행</option>
				<option value="5">다섯은행</option>
				<option value="6">여섯은행</option>
				<option value="7">일곱은행</option>
			</select>
		</div>
		<div class="form-group">
			<label for="bank_number">계좌번호 : </label>
			<input type="number" name="bank_number" id="bank_number" />
		</div>
		<div class="form-group">
			<label for="bank_password">계좌비밀번호 : </label>
			<input type="password" name="bank_password" id="bank_password" />
		</div>
		<div class="form-group">
			<label for="jumin_number">주민등록번호 : </label>
			<input type="number" name="jumin_number" id="jumin_number" />
		</div>
	</div>
	
	<!-- modal footer -->
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취  소</button>
		<button type="submit" class="btn btn-primary">결  제</button>
	</div>
</form>