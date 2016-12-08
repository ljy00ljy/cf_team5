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
             
             	<div class="m_nav_r dropdown">
			<c:choose>
				<c:when test="${loginInfo==null}">
					<%-- 로그인  --%>
			
						<a class="dropdown-toggle" href="${pageContext.request.contextPath }/member/login.do">로그인</a> 
					
					<%-- //로그인  --%>
				</c:when>
				<c:otherwise>
					<!-- 로그인 된 경우 -->
					<div class="loin" style="margin-top:-20px;">
					<ul class="nav navbar-nav navbar-right" >
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" style="padding: 5px"> <!-- 쿠키값에 따른 프로필 이미지 표시 -->
								<c:if test="${cookie.profileThumbnail!=null}">
									<img src="${pageContext.request.contextPath}/main/download.do?file=${cookie.profileThumbnail.value}"
										class="img-circle" />
								</c:if> <!-- 쿠키값에 따른 프로필 이미지 표시 끝 --> ${loginInfo.name}님 <span
								class="caret"></span></a> <!-- 로그인한 경우 표시될 메뉴 -->
							
							
							
								<ul class="dropdown-menu pull-right" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath }/member/mypledges.do?member_id=${loginInfo.id }">내후원현황</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath }/member/myprojects.do?member_id=${loginInfo.id }">내프로젝트</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath }/member/myprofile.do">내정보수정</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath }/member/out_user.do">회원탈퇴</a></li>
					<li role="presentation" class="divider"></li>
					<li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
				</ul></li>
					</ul>
						</div>
					<!-- //로그인 된 경우 -->
				</c:otherwise>
			</c:choose>
</div>





			</div>

			<!-- //m_nav_r -->
		</div>
		<!-- //container -->
	</nav>
	<!-- //m_nav-->