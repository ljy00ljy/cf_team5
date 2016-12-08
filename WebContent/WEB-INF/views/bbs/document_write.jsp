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

<!-- ckeditor -->
<script src="http://cdn.ckeditor.com/4.6.0/full/ckeditor.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/inc/topnav.jsp"%>

	<div class="container">
		<h1 class="page-header">${bbsName}
			- <small>새 글 쓰기</small>
		</h1>
		<form class="form-horizontal" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/bbs/document_write_ok.do">
			<!-- 게시판 카테고리에 대한 상태유지  -->
			<input type="hidden" name="category" value="${category}" />
			
			<!-- 제목 -->
			<div class="form-group">
				<label for="subject" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="subject" name="subject">
				</div>
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea id="content" name="content" class="ckeditor"></textarea>
				</div>
			</div>
			<!-- 파일업로드 -->
			<div class="form-group">
				<label for="file" class="col-sm-2 control-label">파일첨부</label>
				<div class="col-sm-10">
					<input type="file" class="form-control" id="file" name="file" multiple>
				</div>
			</div>
			<!-- 버튼들 -->
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">저장하기</button>
					<button type="button" class="btn btn-danger" onclick="history.back();">작성취소</button>
				</div>
				
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>