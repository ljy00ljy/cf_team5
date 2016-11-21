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

	<!-- document_read -->
	<div class="container">

		<!-- 게시판 제목 -->
		<h3 class="page-header">게시판 제목</h3>
		<!-- //게시판 제목 -->

		<!-- 글쓴이 정보 -->
		<div class="alert alert-info">
			<h3 style="margin: 0;">
				제목 제목<br /> <small> 글쓴이 <a href="mailto:메일주소"> <i
						class="glyphicon glyphicon-envelope"></i>
				</a> / 조회수 : 555 / 작성일시 : 2016-11-11 11:11:11
				</small>
			</h3>
		</div>
		<!-- //글쓴이 정보 -->

		<!-- 첨부파일 목록 -->
		<table class="table table-bordered">
			<tr>
				<th class="warning" style="width: 100px">첨부파일</th>
				<td>
					<!-- 다운로드 링크 --> <a href="#" class="btn btn-link btn-xs">첨부파일이름</a>
				</td>
			</tr>
		</table>
		<!-- //첨부파일 목록 -->

		<!-- 내용 -->
		<section style="padding: 0 10px 20px 10px">내용 내용 내용</section>
		<!-- //내용 -->

		<!-- 다음글 / 이전글 -->
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th class="success" style="width: 100px">다음글</th>
					<td>다음 글이 없어</td>
				</tr>
				<tr>
					<th class="success" style="width: 100px">이전글</th>
					<td>이전 글도 없어</td>
				</tr>
			</tbody>
		</table>
		<!-- //다음글 / 이전글 -->

		<!-- 버튼들 : category 값에 대한 상태유지 필요함 -->
		<div class="clearfix">
			<div class="pull-right">
				<a href="${pageContext.request.contextPath }/content/comunity.do" class="btn btn-success">커뮤니티 목록</a>
				<a href="${pageContext.request.contextPath }/bbs/document_list.do" class="btn btn-info">게시물 목록</a>
				<a href="${pageContext.request.contextPath }/bbs/document_write.do" class="btn btn-primary">글쓰기</a>
				<!-- 수정, 삭제 대상을 지정하기 위해서 글 번호가 전달되어야 한다. -->
				<a href="${pageContext.request.contextPath }/bbs/document_edit.do" class="btn btn-warning">수정하기</a>
				<a href="${pageContext.request.contextPath }/bbs/document_delete.do" class="btn btn-danger">삭제하기</a>
			</div>
		</div>
		<!-- //버튼틀 -->

	</div>
	<!-- //document_read -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>





