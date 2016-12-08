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
	
	<!-- 최신 게시물 목록 영역 -->
<div class="container">
	<div class="row">
		<%-- 공지사항 --%>
		<div class="col-md-3 article-item">
			<div class="page-header clearfix ">
				<h4 class="pull-left"><strong>공지사항</strong></h4>
				<div class="pull-right ">
					<a href="${pageContext.request.contextPath}
						/bbs/document_list.do?category=notice"
						class="btn btn-danger btn-xs">more</a>
				</div>
			</div>
			<ul class="list-group" >
				<c:forEach var="document" items="${noticeList}">
						<li class="list-group-item list-group-item-info" style="border:0;">
							<a href="${pageContext.request.contextPath}
								/bbs/document_read.do?category=${document.category}
								&document_id=${document.id}">${document.subject}</a>
						</li>
				</c:forEach>
			</ul>
		</div>
		<%-- 캘러리 --%>
		<div class="col-md-3 article-item">
			<div class="page-header clearfix">
				<h4 class="pull-left"><strong>갤러리</strong></h4>
				<div class="pull-right">
					<a href="${pageContext.request.contextPath}
						/bbs/document_list.do?category=gallery"
						class="btn btn-danger btn-xs">more</a>
				</div>
			</div>
			<ul class="list-group">
				<c:forEach var="document" items="${galleryList}">
						<li class="list-group-item list-group-item-warning" style="border:0">
							<a href="${pageContext.request.contextPath}
								/bbs/document_read.do?category=${document.category}
								&document_id=${document.id}">${document.subject}</a>
						</li>
				</c:forEach>
			</ul>
		</div>
		
		
		
		<%-- 자유게시판 --%>
		<div class="col-md-3 article-item">
			<div class="page-header clearfix">
				<h4 class="pull-left"><strong>자유게시판</strong></h4>
				<div class="pull-right">
					<a href="${pageContext.request.contextPath}
						/bbs/document_list.do?category=free"
						class="btn btn-danger btn-xs">more</a>
				</div>
			</div>
			<ul class="list-group">
				<c:forEach var="document" items="${freeList}">
						<li class="list-group-item list-group-item-success" style="border:0;">
							<a href="${pageContext.request.contextPath}
								/bbs/document_read.do?category=${document.category}
								&document_id=${document.id}">${document.subject}</a>
						</li>
				</c:forEach>
			</ul>
		</div>
		<%-- 질문답변 --%>
		<div class="col-md-3 article-item">
			<div class="page-header clearfix">
				<h4 class="pull-left"><strong>질문답변</strong></h4>
				<div class="pull-right">
					<a href="${pageContext.request.contextPath}
						/bbs/document_list.do?category=qna"
						class="btn btn-danger btn-xs">more</a>
				</div>
			</div>
			<ul class="list-group">
				<c:forEach var="document" items="${qnaList}">
						<li class="list-group-item" style="border:0;">
							<a href="${pageContext.request.contextPath}
								/bbs/document_read.do?category=${document.category}
								&document_id=${document.id}">${document.subject}</a>
						</li>
				</c:forEach>
			</ul>
		</div>

	</div>
</div>
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<!--  jQuery 1.7+  -->
<script src="jquery-1.9.1.min.js"></script>
</body>
</html>