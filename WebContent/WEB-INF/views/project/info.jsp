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
	<!-- 상태유지 -->
	
	
	<!-- mypage_header -->
	<div class="mypage_header">
		<h3>${readProject.title }</h3>
		<p>${readProject.titleText }</p>
	</div>
	<!-- //mypage_header -->



	<!-- info container-->
	<div class="container">
		<!-- info -->
		<div class="info col-sm-8">
			<!-- info_title -->
			<div class="info_title">
				<c:choose>
					<c:when test="${readProject.video != null }">
						<div id="youtube_box">
							<embed width="100%" height="315" src="https://www.youtube.com/embed${readProject.video }"></embed>
						</div>
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath }/main/download.do?file=${readProject.titleImage }" alt="" />
					</c:otherwise>
				</c:choose>
				<p><a href="${readProject.url }">${readProject.url }</a></p>
			</div>
			<!-- //info_title -->



			<!-- info_content -->
			<div class="info_content">
				${readProject.story }
			</div>
			<!-- //info_content -->

			<!-- info_producer -->
			<div class="info_producer">
				<img src="${pageContext.request.contextPath }/main/download.do?file=${readProject.producerImage }" />
				${readProject.producerName }
				${readProject.producerInfo }
				${readProject.producerArea }
				
				${readProject.email }
			</div>
			<!-- //info_producer -->


			<!-- info_legal -->
			<div class="info_legal">
				${readProject.legal }
			</div>
			<!-- //info_legal -->


		</div>
		<!-- //info -->

		<!-- info_side -->
		<div class="info_side col-sm-4">
			<p>목표금액 : ${readProject.projectMoney }</p>
			<p>
				모인금액 : ${readProject.nowMoney }원 <span> %</span>
			</p>
			<p>남은기간 : 500 일</p>
			<p>후원자 : ${readProject.nowPledge } 명</p>
			<a href="${pageContext.request.contextPath }/pledges/rewards.do?project_id=${readProject.id }&title=${readProject.title }">후원하기</a>
			
			
			<!-- present item -->
		
			<c:choose>
				<c:when test="${fn:length(readPresent) > 0 }">
					<c:forEach var="readPresent" items="${readPresent }">
						<div id="present_item">
							<a href="${pageContext.request.contextPath }/pledges/rewards.do?project_id=${readProject.id }&title=${readProject.title }">
								<h6>${readPresent.money } 원 이상</h6>
								<p>${readPresent.info }</p>
							</a>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
			</c:choose>
			<!-- //present item -->

		</div>
		<!-- //info_side -->
	</div>
	<!-- //info container -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>