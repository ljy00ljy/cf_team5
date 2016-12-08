<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- http://java.sun.com/jsp/jstl/cored 에 정의된 JSTL 기능을 "c"라는 이름으로 정의 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form id="payment_card_modal" method="post" 
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
		<p>신용 / 체크카드 결제</p>
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
			<label for="card_brand">카드사명 : </label>
			<select name="card_brand" id="card_brand">
				<option value="0">-- 카드를 선택하세요 --</option>
				<option value="1">&spades;A</option>
				<option value="2">&spades;K</option>
				<option value="3">&spades;Q</option>
				<option value="4">&spades;J</option>
				<option value="5">&spades;10</option>
				<option value="6">&spades;9</option>
				<option value="7">&spades;8</option>
				<option value="7">&spades;7</option>
				<option value="7">&spades;6</option>
				<option value="7">&spades;5</option>
				<option value="7">&spades;4</option>
				<option value="7">&spades;3</option>
				<option value="7">&spades;2</option>
			</select>
		</div>
		<div class="form-group">
			<label for="card_number">카드번호 : </label>
			<input type="number" name="card_number" id="card_number" maxlength="20"/>
		</div>
		<div class="form-group">
			<label for="card_ymd">유효기간 : </label>
			<input type="date" name="card_ymd" id="card_ymd" />
		</div>
		<div class="form-group">
			<label for="card_password">비밀번호 : </label>
			<input type="password" name="card_password" id="card_password" />
		</div>
		
	</div>
	
	<!-- modal footer -->
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취  소</button>
		<button type="submit" class="btn btn-primary">결  제</button>
	</div>
</form>