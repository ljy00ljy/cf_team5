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
		<h3>내 후원현황</h3>
		<p>
			이주영 <small>님</small>
		</p>
	</div>
	<!-- //mypage_header -->

	<!-- m_thumb -->
	


	<div class="m_thumb">
		<div class="container">
			<!-- m_thumb item -->
			<a href="${pageContext.request.contextPath }/project/info.do"> 
				<img src="${pageContext.request.contextPath }/assets/img/cat01.gif" alt="" />
				<div class="m_thumb_user">
					<img src="http://placehold.it/40x40" alt="" />
					<h5>고양이 첫번째 키우기 키우기 키우기1</h5>
					<p>밥먹이기밥먹이기밥먹이기밥먹이기</p>
				</div>
				<div class="m_thumb_info">
					<div class="m_thumb_info_1">
						<p>
							모인금액<span>230%</span>
						</p>
						<p>5,500,000원</p>
					</div>
					<div class="m_thumb_info_2">
						<p>후원자</p>
						<p>500 명</p>
					</div>
					<div class="m_thumb_info_3">
						<p>남은기간</p>
						<p>500 일</p>
					</div>
				</div>
			</a>
			<!-- //m_thumb item -->
			<!-- m_thumb item -->
			<a href="${pageContext.request.contextPath }/project/info.do"> 
				<img src="${pageContext.request.contextPath }/assets/img/cat01.gif" alt="" />
				<div class="m_thumb_user">
					<img src="http://placehold.it/40x40" alt="" />
					<h5>고양이 첫번째 키우기 키우기 키우기1</h5>
					<p>밥먹이기밥먹이기밥먹이기밥먹이기</p>
				</div>
				<div class="m_thumb_info">
					<div class="m_thumb_info_1">
						<p>
							모인금액<span>230%</span>
						</p>
						<p>5,500,000원</p>
					</div>
					<div class="m_thumb_info_2">
						<p>후원자</p>
						<p>500 명</p>
					</div>
					<div class="m_thumb_info_3">
						<p>남은기간</p>
						<p>500 일</p>
					</div>
				</div>
			</a>
			<!-- //m_thumb item -->
			<!-- m_thumb item -->
			<a href="${pageContext.request.contextPath }/project/info.do"> 
				<img src="${pageContext.request.contextPath }/assets/img/cat01.gif" alt="" />
				<div class="m_thumb_user">
					<img src="http://placehold.it/40x40" alt="" />
					<h5>고양이 첫번째 키우기 키우기 키우기1</h5>
					<p>밥먹이기밥먹이기밥먹이기밥먹이기</p>
				</div>
				<div class="m_thumb_info">
					<div class="m_thumb_info_1">
						<p>
							모인금액<span>230%</span>
						</p>
						<p>5,500,000원</p>
					</div>
					<div class="m_thumb_info_2">
						<p>후원자</p>
						<p>500 명</p>
					</div>
					<div class="m_thumb_info_3">
						<p>남은기간</p>
						<p>500 일</p>
					</div>
				</div>
			</a>
			<!-- //m_thumb item -->
		</div>
	</div>
	<!-- //m_thumb -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>