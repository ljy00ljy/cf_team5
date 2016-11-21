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

	<!-- login -->
	<div class="container">
		<div class="loginbox">
			<form method="post" action="${pageContext.request.contextPath }/member/login_ok.do">
				<div class="form-group">
					<label for="user_id">이메일</label> <input type="email" name="user_id"
						placeholder="이메일 주소 입력" />
				</div>
				<div class="form-group">
					<label for="user_pw">비밀번호</label> <input type="password"
						name="user_pw" placeholder="비밀번호 입력" />
				</div>
				<div class="forn-group">
					<button type="submit">로그인</button>
				</div>
				<div class="form-group">
					<a href="${pageContext.request.contextPath }/member/join_legal.do">회원가입</a>
					<a href="${pageContext.request.contextPath }/member/find_user.do">비밀번호 찾기</a>
				</div>
			</form>
		</div>
	</div>
	<!-- //login -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>