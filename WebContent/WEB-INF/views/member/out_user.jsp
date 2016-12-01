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

	<!-- out_user -->
	<div class="container">
		<div class="find_user">
			<h3>회원탈퇴</h3>
			<p>회원 탈퇴 비밀번호 입력하세요</p>
			<form method="post" action="${pageContext.request.contextPath }/member/out_user_ok.do">
				<div class="form-group">
					<label for="user_pw">비밀번호</label> <input type="password"
						name="user_pw" placeholder="비밀번호입력" />
				</div>
				<div class="forn-group">
					<button type="submit">회원탈퇴</button>
				</div>
			</form>
		</div>
	</div>
	<!-- //out_user -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
