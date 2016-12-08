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
	
	<!-- start_project_ok -->
	<div class="container">
		<div class="start_project_ok">
			<h3>등록 완료</h3>
			<p>운영자의 검토 후 승인되면 프로젝트가 공개되고 등록된 모집일부터 펀딩이 시작됩니다.</p>
			<a href="${pageContext.request.contextPath }/member/myprojects.do?member_id=${memberId }">내 프로젝트 보러가기</a>
		</div>
	</div>
	<!-- //start_project_ok -->
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>