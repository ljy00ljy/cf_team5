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
					
					<c:choose>
						<c:when test="${fn:length(projectList) > 0 }">
							<c:forEach var="project" items="${projectList }">
								<!-- m_thumb item -->
								<a href="${pageContext.request.contextPath }/project/info.do?id=${project.id }">
									<img src="${pageContext.request.contextPath }/main/download.do?file=${project.titleImage }" alt="" />
									<div class="m_thumb_user">
										<img src="${pageContext.request.contextPath }/main/download.do?file=${project.producerImageThumb }" alt="" />
										<h5>${project.title }</h5>
										<p>${project.titleText }</p>
									</div>
									<div class="m_thumb_info">
										<div class="m_thumb_info_1">
											<p>
												모인금액<span>${project.nowMoney }</span>
											</p>
											<p>${project.projectMoney }</p>
										</div>
										<div class="m_thumb_info_2">
											<p>후원자</p>
											<p>${project.nowPledge } 명</p>
										</div>
										<div class="m_thumb_info_3">
											<p>남은기간</p>
											<p> 일</p>
										</div>
									</div>
								</a>
								<!-- //m_thumb item -->
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>조회된 프로젝트가 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- //m_thumb -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>