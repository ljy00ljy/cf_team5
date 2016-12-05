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
		<h3>프로젝트 둘러보기</h3>
		<p>둘러보렴</p>
	</div>
	<!-- //mypage_header -->

	<!-- search dropdown -->
	<div class="container">

		<form class="navbar-search pull-right">
			<input type="text" class="search-query" placeholder="검색">
			<button class="btn btn-success" type="submit">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</form>
		<ul class="nav nav-tabs">

			<li class="dropdown"><a href="#" id="myTabDrop1"
				class="dropdown-toggle" data-toggle="dropdown">모두보기 <b
					class="caret"></b></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
					<li><a href="#dropdown1" tabindex="-1" data-toggle="tab">미술</a></li>
					<li><a href="#dropdown2" tabindex="-1" data-toggle="tab">만화</a></li>
					<li><a href="#dropdown3" tabindex="-1" data-toggle="tab">디자인</a></li>
					<li><a href="#dropdown4" tabindex="-1" data-toggle="tab">패션</a></li>
					<li><a href="#dropdown5" tabindex="-1" data-toggle="tab">영화</a></li>
					<li><a href="#dropdown6" tabindex="-1" data-toggle="tab">요리</a></li>
					<li><a href="#dropdown7" tabindex="-1" data-toggle="tab">게임</a></li>
					<li><a href="#dropdown8" tabindex="-1" data-toggle="tab">출판</a></li>
				</ul></li>

			<li class="dropdown"><a href="#" id="myTabDrop2"
				class="dropdown-toggle" data-toggle="dropdown">필터<b
					class="caret"></b></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2">
					<li><a href="#dropdowna1" tabindex="-1" data-toggle="tab">최신순</a></li>
					<li><a href="#dropdowna2" tabindex="-1" data-toggle="tab">마감임박</a></li>
					<li><a href="#dropdowna3" tabindex="-1" data-toggle="tab">최다후원</a></li>
					<li><a href="#dropdowna4" tabindex="-1" data-toggle="tab">최고금액</a></li>
				</ul></li>
		</ul>
	</div>

	<div class="tab-content">
		<div class="tab-pane fade" id="dropdown1">
			<p>미술</p>
		</div>
		<div class="tab-pane fade" id="dropdown2">
			<p>만화</p>
		</div>
		<div class="tab-pane fade" id="dropdown3">
			<p>디자인</p>
		</div>
		<div class="tab-pane fade" id="dropdown4">
			<p>패션</p>
		</div>
		<div class="tab-pane fade" id="dropdown5">
			<p>영화</p>
		</div>
		<div class="tab-pane fade" id="dropdown6">
			<p>요리</p>
		</div>
		<div class="tab-pane fade" id="dropdown7">
			<p>게임</p>
		</div>
		<div class="tab-pane fade" id="dropdown8">
			<p>출판</p>
		</div>
	</div>

	<div class="tab-content">
		<div class="tab-pane fade" id="dropdowna1">
			<p>최신순</p>
		</div>
		<div class="tab-pane fade" id="dropdowna2">
			<p>마감임박</p>
		</div>
		<div class="tab-pane fade" id="dropdowna3">
			<p>최다후원</p>
		</div>
		<div class="tab-pane fade" id="dropdowna4">
			<p>최고금액</p>
		</div>
	</div>
	<!-- //search dropdown -->


	<!-- m_thumb -->
	<div class="m_thumb">
		<div class="container">
			
			<c:choose>
				<c:when test="${fn:length(projectList) > 0 }">
					<c:forEach var="project" items="${projectList }">
						<!-- m_thumb item -->
						<a href="${pageContext.request.contextPath }/project/info.do?project_id=${project.id }">
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


	<!-- btn-lg container -->
	<div class="container bbtn-lg">
		<a class="btn btn-primary btn-lg">더보기</a>
	</div>
	<!-- //btn-lg container -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
