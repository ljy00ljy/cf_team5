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
		<p>1번 게시판</p>
	</div>
	<!-- //mypage_header -->

	<!-- document_list -->
	<div class="container">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<td class="text-center" style="width: 100px">번호</td>
						<td class="text-center">제목</td>
						<td class="text-center visible-lg visible-md" style="width: 120px">작성자</td>
						<td class="text-center visible-lg visible-md" style="width: 100px">조회수</td>
						<td class="text-center visible-lg visible-md" style="width: 120px">작성일</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center">3</td>
						<td><a href="${pageContext.request.contextPath }/bbs/document_read.do">제목</a></td>
						<td class="text-center">글쓴이</td>
						<td class="text-center">55</td>
						<td class="text-center">2016-11-25 20:00:00</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td><a href="${pageContext.request.contextPath }/bbs/document_read.do">제목</a></td>
						<td class="text-center">글쓴이</td>
						<td class="text-center">55</td>
						<td class="text-center">2016-11-25 20:00:00</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td><a href="${pageContext.request.contextPath }/bbs/document_read.do">제목</a></td>
						<td class="text-center">글쓴이</td>
						<td class="text-center">55</td>
						<td class="text-center">2016-11-25 20:00:00</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 버튼들  -->
		<div class="clearfix">
			<div class="pull-right">
				<a href="${pageContext.request.contextPath }/content/comunity.do" class="btn btn-success">커뮤니티 목록</a><a
					href="${pageContext.request.contextPath }/bbs/document_write.do" class="btn btn-primary">글쓰기</a>
			</div>
		</div>
		<!-- //버튼틀 -->

	</div>
	<!-- //document_list -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>