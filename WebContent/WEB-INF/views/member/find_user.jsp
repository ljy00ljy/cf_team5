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
	
	<!-- find_user -->
	<div class="container">
		<div class="find_user">
			<h3>비밀번호 재설정</h3>
			<p>가입된 메일주소를 입력하시면 비밀번호 재설정 메일을 보내드립니다.</p>
			<form method="post" action="${pageContext.request.contextPath }/member/find_user_ok.do">
				<div class="form-group">
					<label for="user_id">이메일</label> <input type="email" name="user_id"
						placeholder="이메일 주소 입력" />
				</div>
				<div class="forn-group">
				<button type="submit">메일 발송</button>
				</div>
			</form>
		</div>
	</div>
	<!-- //find_user -->
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>


