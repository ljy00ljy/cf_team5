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

	<!-- carousel_m01 -->
	<div id="carousel_m01" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carousel_m01" data-slide-to="0" class="active"></li>
			<li data-target="#carousel_m01" data-slide-to="1"></li>
			<li data-target="#carousel_m01" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="${pageContext.request.contextPath }/assets/img/m_slide01.jpg" alt="" />
				<div class="container">
					<div class="carousel-caption">
						<h2>큰제목 큰제목 큰제목 큰제목 큰제목</h2>
						<p class="hidden-xs">어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/assets/img/m_slide02.jpg" alt="" />
				<div class="container">
					<div class="carousel-caption">
						<h2>큰제목 큰제목 큰제목 큰제목 큰제목 큰제목 큰제목 큰제목</h2>
						<p class="hidden-xs">어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/assets/img/m_slide03.jpg" alt="" />
				<div class="container">
					<div class="carousel-caption">
						<h2>큰제목 큰제목 큰제목 큰제목 큰제목 큰제목 큰제목</h2>
						<p class="hidden-xs">어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구
							어쩌구저쩌구</p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#carousel_m01"
			data-slide="prev"> <span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#carousel_m01"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</div>
	<!-- //carousel_m01 -->

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
					<h5>고양이 첫번째 키우기 키우기 키우기2</h5>
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
					<h5>고양이 첫번째 키우기 키우기 키우기3</h5>
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
					<h5>고양이 첫번째 키우기 키우기 키우기4</h5>
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
					<h5>고양이 첫번째 키우기 키우기 키우기5</h5>
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
					<h5>고양이 첫번째 키우기 키우기 키우기6</h5>
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