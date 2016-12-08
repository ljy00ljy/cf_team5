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
			- <small>수정하기</small>
		</h1>
		<form class="form-horizontal" method="post"
			enctype="multipart/form-data"
			action="${pageContext.request.contextPath }/bbs/document_edit_ok.do">
			<!-- 게시판 카테고리에 대한 상태유지 -->
			<input type="hidden" name="category" value="${category }" />
			<!-- 수정 대상에 대한 상태유지 -->
			<input type="hidden" name="document_id" value="${readDocument.id }" />
			<!-- 작성자, 비밀번호, 이메일은 자신의 글을 수정하는 경우만 생략한다. -->
			
				<!-- 제목  -->
				<div class="form-group">
					<label for="subject" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject"
							name="subject" value="${readDocument.subject}" />
					</div>
				</div>
				<!-- 내용  -->
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea class="ckeditor" id="content" name="content">
				${readDocument.content}</textarea>
					</div>
				</div>
				<!-- 파일 업로드 -->
				<div class="form-group">
					<label for="file" class="col-sm-2 control-label">파일첨부</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="file" name="file"
							multiple />
						<!-- 첨부 파일 리스트가 존재할 경우만 삭제할 항목 선택 가능 -->
						<c:if test="${fileLIst != null }">
							<c:forEach var="file" items="${fileList }">
								<!-- 이미지를 다운받기 위한URL구성 -->
								<c:url value="/download.do" var="downloadUrl">
									<c:param name="file" value="${file.fileDir}/${file.fileName}" />
								</c:url>
								<div class="checkbox">
									<label> <input type="checkbox" name="del_file"
										id="img_del" value="${file.id }" /> ${file.originName }삭제하기 <a
										href="${downloadUrl }">[다운받기]</a>
									</label>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
	
			<!-- 버튼들 -->
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">저장하기</button>
					<button type="button" class="btn btn-danger"
						onclick="history.back();">작성취소</button>
				</div>

			</div>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>