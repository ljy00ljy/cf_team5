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
			<p>aaaa@bbb.ccc 메일로 발송된 인증번호를 입력하세요.</p>
			
			<form method="post" action="${pageContext.request.contextPath }/member/find_user_re_ok.do">
				<div class="form-group">
					<label for="user_pw_mail">인증번호</label> <input type="email" name="user_pw_mail"
						placeholder="인증번호 입력" />
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