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
		<h3>도움말</h3>
		<p>도움이 필요함?</p>
	</div>
	<!-- //mypage_header -->


	<!-- m_help -->
	<div class="m_help">
		<div class="container">
			<div class="col-md-9">
				<h3 id="help_scroll_01">기본</h3>
				<h4>텀블벅(tumblbug)은 무엇인가요?</h4>
				<p>안녕하세요, 텀블벅은 영화, 음악, 미술, 출판, 건축, 사진, 디자인, 테크놀로지, 게임, 요리, 제조 등
					창조적인 분야를 총 망라하는 창작자를 위한 크라우드 펀딩 플랫폼입니다. 우리는 크리에이터가 새로운 시도를 하는데 필요한
					자금의 대안적인 통로를 만들고, 크리에이터와 팬들을 연결하는 새로운 통로입니다. 또한, 창작자들의 비전이 보다 편리한
					방법으로 실현될 수 있도록 우리의 모든 기술적 역량을 기울이고 있습니다. 사전적 의미를 찾자면, 텀블벅은 그냥
					말똥구리(tumblebug)입니다. 사이트 주소 중간에 e를 뺀 건 닷컴 .com 도메인이 없었기 때문입니다.</p>
					
					
				<h3 id="help_scroll_02">프로젝트 밀어주기</h3>
				<h4>'프로젝트 밀어주기'가 무슨 말인가요?</h4>
				<p>창작자들이 구상하는 프로젝트들이 실제로 현실이 될 수 있도록 일정한 금액을 지불하여 돕는 것입니다.</p>
				
				
				<h3 id="help_scroll_03">자동이체 등록</h3>
				<h4>체크(직불)카드도 가능한가요?</h4>
				<p>그런거 안받아요</p>
				
				
				<h3 id="help_scroll_04">프로젝트 페이지 만들기</h3>
				<h4>프로젝트 페이지는 무료로 만들 수 있나요?</h4>
				<p>네. 무료입니다. 별도의 절차 없이 '프로젝트 올리기'를 누르면 만드실 수 있습니다.</p>
				
				
				<h3 id="help_scroll_05">프로젝트 진행 및 관리하기</h3>
				<h4>목표액을 돌파했으니 펀딩을 끝내고 빨리 금액을 수령하고 싶은데요.</h4>
				<p>그러고 싶겠지만 참으셔야합니다. 수많은 후원자 분들을 생각해보세요. 만약 어떤 프로젝트가 목표 금액을
					돌파했다고 곧바로 금액을 수령할 수 있다면, 예정된 날짜에 이체를 예상하고 있던 후원자들에게는 황당한 일이 될 것입니다.
					(누군가 5월 마감 프로젝트에 5만원, 6월 마감 프로젝트에 5만원을 각각 예약해놓았는데 갑자기 5월에 10만원이 모두
					청구된다면 당황스러울테니까요.) 들뜬 마음을 가라앉히고 사전에 정한 기한까지는 차분히 기다려주세요. 물론 그 기간 동안
					더 받게 되는 것에는 제한이 없습니다. :)</p>
			</div>
			<div class="col-md-3 visible-lg visible-md help_sidebar">
				<a href="#help_scroll_01">기본</a> <a href="#help_scroll_02">프로젝트 밀어주기</a>
				<a href="#help_scroll_03">자동이체 등록</a> <a href="#help_scroll_04">프로젝트 페이지 만들기</a>
				<a href="#help_scroll_05">프로젝트 진행 및 관리하기</a>
			</div>
		</div>
	</div>
	<!-- //m_help -->
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>