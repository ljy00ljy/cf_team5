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
		<h3>커뮤니티</h3>
		<p>그냥 게시판</p>
	</div>
	<!-- //mypage_header -->
	
	<!-- comunity -->
	<div class="container">
		<div class="comunity_main row">
			<!-- item -->
			<div class="col-sm-4">
				<h4>1번 게시판</h4>
				<a href="${pageContext.request.contextPath }/bbs/document_list.do">더보기</a>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">1번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">2번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">3번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">4번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">5번 게시물 제목</a></p>
			</div>
			<!-- //item -->
			<!-- item -->
			<div class="col-sm-4">
				<h4>1번 게시판</h4>
				<a href="${pageContext.request.contextPath }/bbs/document_list.do">더보기</a>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">1번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">2번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">3번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">4번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_read.do">5번 게시물 제목</a></p>
			</div>
			<!-- //item -->
			<!-- item -->
			<div class="col-sm-4">
				<h4>1번 게시판</h4>
				<a href="${pageContext.request.contextPath }/bbs/document_list.do">더보기</a>
				<p><a href="${pageContext.request.contextPath }/bbs/document_list.do">1번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_list.do">1번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_list.do">1번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_list.do">1번 게시물 제목</a></p>
				<p><a href="${pageContext.request.contextPath }/bbs/document_list.do">1번 게시물 제목</a></p>
			</div>
			<!-- //item -->
		</div>
	</div>
	<!-- //comunity -->
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>