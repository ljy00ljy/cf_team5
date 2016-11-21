<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- http://java.sun.com/jsp/jstl/cored 에 정의된 JSTL 기능을 "c"라는 이름으로 정의 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- footer container -->
<div class="clearfix"></div>
<footer class="container">
	<!-- fotter_heder -->
	<div class="col-xs-12 footer_header">
		<div class="col-sm-3">
			<h5>CF_TEAM</h5>
			<ul>
				<li><a href="${pageContext.request.contextPath }/content/legal.do">이용약관</a></li>
				<li><a href="${pageContext.request.contextPath }/content/privacy.do">개인정보보호</a></li>
				<li><a href="${pageContext.request.contextPath }/content/help.do">이용안내</a></li>
			</ul>
		</div>
		<div class="visible-xs clearfix"></div>
		<div class="col-sm-6">
			<h5>분야별 프로젝트</h5>
			<ul>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#미술">미술</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#만화">만화</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#디자인">디자인</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#패션">패션</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#영화">영화</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#요리">요리</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#게임">게임</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#출판">출판</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#출판">출판</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#출판">출판</a></li>
				<li class="col-xs-3"><a href="${pageContext.request.contextPath }/project/projects.do#출판">출판</a></li>
			</ul>
		</div>
		<div class="visible-xs clearfix"></div>
		<div class="col-sm-3 ">
			<h5>팔로우</h5>
			<ul>
				<li><a href="https://www.facebook.com/login/">Facebook</a></li>
				<li><a href="https://www.instagram.com/">Instargram</a></li>
				<li><a href="https://www.blogger.com">Blooger</a></li>
			</ul>
		</div>
	</div>
	<!-- //footer_header -->
	<!-- address -->
	<div class="col-xs-12">
		<address>
			<span>회사명(주)</span>ㅣ<span>대표명</span> ㅣ <span>사업자번호 :
				000-11-22222</span>ㅣ <span>서울시 강남구 역삼동 815-4 만이빌딩 5F Cf아카데미 </span>ㅣ <span>통신판매업
				: 8208-서울강남-1111</span>
		</address>
	</div>
	<!-- //address -->
</footer>
<!-- //footer container -->