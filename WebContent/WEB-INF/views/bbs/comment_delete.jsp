<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="comment_delete_form" method="post" 
	action="${pageContext.request.contextPath}/bbs/comment_delete_ok.do">
	<input type="hidden" name="comment_id" value="${commentId}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" 
			aria-label="Close"><span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">덧글 삭제</h4>
	</div>
	<div class="modal-body">
		<c:choose>
			<c:when test="${myComment == true}">
				<!-- 자신의 글에 대한 삭제 -->
				<p>정말 이 덧글을 삭제하시겠습니까?</p>
			</c:when>
		
		</c:choose>
	</div>
	<div class="modal-footer" style="margin-top:10px;">
		<button type='button' class='btn btn-primary btn-block' data-dismiss="modal">취소</button>
		<button type='submit' class='btn btn-danger btn-block'>삭제</button>
	</div>
</form>