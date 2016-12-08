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

	<!-- mypage_header -->
	<div class="mypage_header">
		<h3>회원가입</h3>
		<p>어서와</p>
	</div>
	<!-- //mypage_header -->

	<!-- join -->
	<div class="container">


		<form class="form-horizontal" method="post"
			action="${pageContext.request.contextPath }/member/email.do">

			<div class="form-group">
				<label class="col-sm-2" for="inputEmail">이메일(아이디)인증*</label>
				<div class="col-sm-10">
					<div class="input-group ">
						<input class="form-control" name="inputEmail" id="inputEmail"
							type="email" placeholder="이메일"> <span
							class="input-group-btn">
							<button class="btn btn-success " type="submit">인증번호 전송</button>

						</span>

					</div>
				</div>
			</div>
		</form>
		<form class="form-horizontal" method="post"
			action="${pageContext.request.contextPath }/member/EmailOk.do">
			<div class="form-group">
				<label class="col-sm-2" for="inputNumberCheck">인증번호 확인*</label>
				<div class="col-sm-10">
					<div class="input-group">
						<input class="form-control" name="inputNumberCheck"
							id="inputNumberCheck" type="text" placeholder="인증번호 ">
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit">
								인증번호 확인<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
					
					<!-- 인증메일인  경우 -->
					
					<p class="help-block"></p>
					
							<p>
								<i class='glyphicon glyphicon-pencil btn btn-info btn-xs'></i>인증번호
								입력해주세요!
							</p>
					
				</div>
			</div>
		</form>

		<hr>

		
</div>


	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	
</body>
</html>
