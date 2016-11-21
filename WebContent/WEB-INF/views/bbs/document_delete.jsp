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

	<!-- document_delete -->
	<div class="container">

		<form name="myform" method="post" action="${pageContext.request.contextPath }/bbs/document_list.do">

			<!-- 카테고리와 게시글 번호 상태유지 -->
			<input type="hidden" name="category" value="${category }" /> <input
				type="hidden" name="document_id" value="${documentId }" />

			<div style="width: 300px; margin: 50px auto;">

				<!-- 자신의 글에 대한 삭제 -->
				<p>정말 이 게시물을 삭제하시겠습니까?</p>

				<div class="form-group">
					<button type="submit" class="btn btn-danger btn-block">삭제하기</button>
					<button type="button" class="btn btn-primary btn-block"
						onclick="history.back()">삭제 취소</button>
				</div>
			</div>

		</form>
	</div>
	<!-- //document_delete -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>