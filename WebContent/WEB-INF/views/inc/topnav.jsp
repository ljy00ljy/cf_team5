<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- http://java.sun.com/jsp/jstl/cored 에 정의된 JSTL 기능을 "c"라는 이름으로 정의 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- m_nav-->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- container -->
		<div class="container m_nav_container">
			<!-- m_nav_l -->
			<div class="navbar-header">
				<button type="button"
					class="m_nav_l navbar-toggle navbar-left collapsed"
					data-toggle="collapse" data-target="#gnb">
					<span class="sr-only">메뉴열기</span> <span class="icon-bar"></span><span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="gnb">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath }/project/projects.do">프로젝트 둘러보기</a></li>
					<li><a href="${pageContext.request.contextPath }/project/start.do">프로젝트올리기</a></li>
					<li><a href="${pageContext.request.contextPath }/content/comunity.do">커뮤니티</a></li>
					<li><a href="${pageContext.request.contextPath }/content/help.do">도움말</a></li>
				</ul>

			</div>
			<!-- //m_nav_l -->
			<!-- m_nav_r -->
			<div class="m_nav_r dropdown">

				<a class="dropdown-toggle" href="${pageContext.request.contextPath }/member/login.do">로그인</a> <a
					id="dropdownMenu1" class="dropdown-toggle" role="button"
					data-toggle="dropdown" href="#">내정보<span class="lock"></span><b
					class="caret"></b></a>
				<ul class="dropdown-menu pull-right" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath }/member/mypledges.do">내후원현황</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath }/member/myprojects.do">내프로젝트</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath }/member/myprofile.do">내정보수정</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath }/member/out_user.do">회원탈퇴</a></li>
					<li role="presentation" class="divider"></li>
					<li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
				</ul>
			</div>
			<!-- //m_nav_r -->
		</div>
		<!-- //container -->
	</nav>
	<!-- //m_nav-->