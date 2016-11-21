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
		<h3>고양이 첫번째 키우기 키우기 키우기</h3>
		<p>밥먹이기밥먹이기밥먹이기밥먹이기</p>
	</div>
	<!-- //mypage_header -->



	<!-- info container-->
	<div class="container">
		<!-- info -->
		<div class="info col-sm-8">
			<!-- info_title -->
			<div class="info_title">
				<img src="${pageContext.request.contextPath }/assets/img/cat01.gif" alt="" />
				<p>
					URL : <a href="#">http://naver.com</a>
				</p>
			</div>
			<!-- //info_title -->



			<!-- info_content -->
			<div class="info_content">
				<h6>출판사 “ FEELM ”</h6>
				<p>"우리의 이야기는 영화다." 라는 슬로건으로 영화같은 이야기를 다루고 있습니다. 출판을 바탕으로 한 모든
					예술분야를 지원하고 창조해나가는데 그 의미를 두고 있습니다. 세상의 어두운 부분을 밝게 비추는 따듯한 존재이고 싶습니다.</p>
				<h6>출판사 “ FEELM ”</h6>
				<p>"우리의 이야기는 영화다." 라는 슬로건으로 영화같은 이야기를 다루고 있습니다. 출판을 바탕으로 한 모든
					예술분야를 지원하고 창조해나가는데 그 의미를 두고 있습니다. 세상의 어두운 부분을 밝게 비추는 따듯한 존재이고 싶습니다.</p>
				<h6>출판사 “ FEELM ”</h6>
				<p>"우리의 이야기는 영화다." 라는 슬로건으로 영화같은 이야기를 다루고 있습니다. 출판을 바탕으로 한 모든
					예술분야를 지원하고 창조해나가는데 그 의미를 두고 있습니다. 세상의 어두운 부분을 밝게 비추는 따듯한 존재이고 싶습니다.</p>

			</div>
			<!-- //info_content -->

			<!-- info_producer -->
			<div class="info_producer"></div>
			<!-- //info_producer -->


			<!-- info_legal -->
			<div class="info_legal"></div>
			<!-- //info_legal -->


		</div>
		<!-- //info -->

		<!-- info_side -->
		<div class="info_side col-sm-4">
			<p>목표금액 : 5,500,000원</p>
			<p>
				모인금액 : 10,000,000원 <span>230%</span>
			</p>
			<p>남은기간 : 500 일</p>
			<p>후원자 : 500 명</p>
			<a href="${pageContext.request.contextPath }/pledges/rewards.do">후원하기</a>

			<div>
				<a href="${pageContext.request.contextPath }/pledges/rewards.do">
					<h6>10,000 원 이상</h6>
					<p>
						선물1<br />선물선물2<br />선물선물선물3
					</p>
					<p>
						<span>300</span> 명이 선택함
					</p>
				</a>
			</div>

			<div>
				<a href="${pageContext.request.contextPath }/pledges/rewards.do">
					<h6>10,000 원 이상</h6>
					<p>
						선물1<br />선물선물2<br />선물선물선물3
					</p>
					<p>
						<span>300</span> 명이 선택함
					</p>
				</a>
			</div>

			<div>
				<a href="${pageContext.request.contextPath }/pledges/rewards.do">
					<h6>10,000 원 이상</h6>
					<p>
						선물1<br />선물선물2<br />선물선물선물3
					</p>
					<p>
						<span>300</span> 명이 선택함
					</p>
				</a>
			</div>

			<div>
				<a href="${pageContext.request.contextPath }/pledges/rewards.do">
					<h6>10,000 원 이상</h6>
					<p>
						선물1<br />선물선물2<br />선물선물선물3
					</p>
					<p>
						<span>300</span> 명이 선택함
					</p>
				</a>
			</div>

			<div>
				<a href="${pageContext.request.contextPath }/pledges/rewards.do">
					<h6>10,000 원 이상</h6>
					<p>
						선물1<br />선물선물2<br />선물선물선물3
					</p>
					<p>
						<span>300</span> 명이 선택함
					</p>
				</a>
			</div>
		</div>
		<!-- //info_side -->
	</div>
	<!-- //info container -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>