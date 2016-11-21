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

	<!-- rewards -->
	<div class="rewards">
		<!-- reward item -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath }/pledges/payment.do">
				<div>
					<input type="text" name="" id="" value="1000" /> 원
					<p>더 많이 입력하실 수 있습니다.</p>
				</div>
				<div>
					<button type="submit" class="btn btn-primary">선택하기</button>
					<button type="reset" class="btn btn-info">최소금액</button>
				</div>
			</form>
			<div>
				<p>선물을 선택하지 않음.</p>
			</div>
		</div>
		<!-- //reward item -->
		<!-- reward item -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath }/pledges/payment.do">
				<div>
					<input type="text" name="" id="" value="10000" /> 원
					<p>더 많이 입력하실 수 있습니다.</p>
				</div>
				<div>
					<button type="submit" class="btn btn-primary">선택하기</button>
					<button type="reset" class="btn btn-info">최소금액</button>
				</div>
			</form>
			<div>
				<p>
					선물1<br />선물선물2<br />선물선물선물3
				</p>
				<p>
					<span>300</span> 명이 선택함
				</p>
			</div>
		</div>
		<!-- //reward item -->
		<!-- reward item -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath }/pledges/payment.do">
				<div>
					<input type="text" name="" id="" value="10000" /> 원
					<p>더 많이 입력하실 수 있습니다.</p>
				</div>
				<div>
					<button type="submit" class="btn btn-primary">선택하기</button>
					<button type="reset" class="btn btn-info">최소금액</button>
				</div>
			</form>
			<div>
				<p>
					선물1<br />선물선물2<br />선물선물선물3
				</p>
				<p>
					<span>300</span> 명이 선택함
				</p>
			</div>
		</div>
		<!-- //reward item -->
		<!-- reward item -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath }/pledges/payment.do">
				<div>
					<input type="text" name="" id="" value="10000" /> 원
					<p>더 많이 입력하실 수 있습니다.</p>
				</div>
				<div>
					<button type="submit" class="btn btn-primary">선택하기</button>
					<button type="reset" class="btn btn-info">최소금액</button>
				</div>
			</form>
			<div>
				<p>
					선물1<br />선물선물2<br />선물선물선물3
				</p>
				<p>
					<span>300</span> 명이 선택함
				</p>
			</div>
		</div>
		<!-- //reward item -->
		<!-- reward item -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath }/pledges/payment.do">
				<div>
					<input type="text" name="" id="" value="10000" /> 원
					<p>더 많이 입력하실 수 있습니다.</p>
				</div>
				<div>
					<button type="submit" class="btn btn-primary">선택하기</button>
					<button type="reset" class="btn btn-info">최소금액</button>
				</div>
			</form>
			<div>
				<p>
					선물1<br />선물선물2<br />선물선물선물3
				</p>
				<p>
					<span>300</span> 명이 선택함
				</p>
			</div>
		</div>
		<!-- //reward item -->
		<!-- reward item -->
		<div class="container">
			<form method="post" action="${pageContext.request.contextPath }/pledges/payment.do">
				<div>
					<input type="text" name="" id="" value="10000" /> 원
					<p>더 많이 입력하실 수 있습니다.</p>
				</div>
				<div>
					<button type="submit" class="btn btn-primary">선택하기</button>
					<button type="reset" class="btn btn-info">최소금액</button>
				</div>
			</form>
			<div>
				<p>
					선물1<br />선물선물2<br />선물선물선물3
				</p>
				<p>
					<span>300</span> 명이 선택함
				</p>
			</div>
		</div>
		<!-- //reward item -->

	</div>
	<!-- //rewards -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
