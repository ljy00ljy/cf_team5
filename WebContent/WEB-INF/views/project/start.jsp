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
	
	<!-- start.html -->
	<div class="start_in">
		<div>
			<div class="container">
				<h2 class="start_in_f_w">창작자가 되는 새로운 길</h2>
				<p class="start_in_f_w">나만의 이야기를 담은 에세이집 한 권부터 직접 쏘아올린 인공위성까지
					창작자들을 위한 펀딩 플랫폼 텀블벅에서 사람들의 마음을 움직여보세요.</p>
				<a class="start_in_btn" href="${pageContext.request.contextPath }/project/start_project.do">지금
					시작하기</a>
			</div>
		</div>

		<div>
			<div class="container">
				<h3>크라우드펀딩이라는 단어는 모르셔도 좋습니다</h3>
				<p>어려운 단어나 복잡한 방식을 몰라도, 창작자라면 누구나 쉽게 프로젝트를 시작할 수 있습니다. 모든 텀블벅
					프로젝트는 다음 세 단계를 통해 완성됩니다.</p>
				<div>
					<img src="${pageContext.request.contextPath }/assets/img/start2-1.png" alt="" />
					<h4>프로젝트 만들기</h4>
					<p>창작자 자신이 누구이고, 어떤 창작 아이디어를 실현시키고 싶은지 소개하는 프로젝트 페이지를 만듭니다.
						후원자들에게 금액대별 특별한 선물들을 약속합니다.</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/assets/img/start2-2.png" alt="" />
					<h4>펀딩 진행하기</h4>
					<p>정해진 기간 동안 후원자를 모으기 위해 지인들과 SNS 등을 통해 열심히 홍보합니다. 목표 금액을 달성하면,
						펀딩 마감일 다음날 후원금이 계좌로 입금됩니다.</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/assets/img/start2-3.png" alt="" />
					<h4>만들고 보답하기</h4>
					<p>전달받은 후원금으로 본격적인 창작 활동에 돌입합니다. 틈틈히 창작 진척사항을 알리고, 약속한 날짜에 창작의
						결실을 선물로 모두 전달하면 프로젝트가 끝납니다.</p>
				</div>
			</div>
		</div>

		<div>
			<div class="container">
				<h3>창작자의 마음을 가장 잘 아는 플랫폼</h3>
				<p>5년 전 대학생 두 명이 창작 활동을 위해 직접 서비스를 시작한 이래, 텀블벅의 목표는 늘 하나였습니다.
					누구나 쉽고 빠르고 똑똑하게 아이디어를 실현할 수 있도록, 오직 창작자들을 위한 도구를 만드는 것.</p>
				<div>
					<h4>초스피드 정산</h4>
					<p>후원금 전달이 오래 걸려서 계획이 틀어지면 큰일입니다. 텀블벅은 펀딩 성공 익일에 바로 창작자 은행계좌로
						후원금을 전달해 드립니다.</p>
				</div>
				<div>
					<h4>예측 가능한 낮은 수수료</h4>
					<p>오직 성공한 프로젝트에 한해서만 5%의 수수료를 받습니다. 목표 금액 설정에 앞서 미리 자동으로 수수료를
						계산해 볼 수 있습니다.</p>
				</div>
				<div>
					<h4>텀블벅 에디터의 노하우</h4>
					<p>펀딩을 시작하기 전에, 해당 분야 창작 생태계를 잘 아는 텀블벅의 에디터가 프로젝트를 검토하고, 성공을 위한
						피드백을 드립니다.</p>
				</div>
				<div>
					<h4>손쉬운 후원·배송 관리</h4>
					<p>펀딩 성공은 시작에 불과합니다. 텀블벅의 손쉬운 후원자 관리 및 서베이 기능을 이용하면 시간에 쫓기는 일이
						없어집니다.</p>
				</div>
				<div>
					<h4>창작자 독립성</h4>
					<p>텀블벅 후원은 투자가 아닙니다. 따라서 작업에 대한 소유권을 나눌 필요가 없습니다. 작업에 대한 권리는 모두
						창작자에게 있습니다.</p>
				</div>
				<div>
					<h4>텀블벅 커뮤니티의 힘</h4>
					<p>후원의 상당 부분이 30만 텀블벅 커뮤니티에서 유입됩니다. 창작자 네트워크와 텀블벅 커뮤니티의 상승효과로
						성공률을 높여보세요.</p>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>

		<div>
			<div class="container">
				<h3 class="start_in_f_w">30만 텀블벅 커뮤니티가 당신의 프로젝트를 기다립니다</h3>
				<p class="start_in_f_w">텀블벅 창작자와 후원자들은 다양성과 새로움이 존중받는 창작 생태계를 함께
					만들어가고 있습니다. 오늘, 텀블벅 커뮤니티에 새로운 프로젝트를 선보이세요.</p>
				<a class="start_in_btn" href="${pageContext.request.contextPath }/project/start_project.do">지금
					시작하기</a>
			</div>
		</div>
	</div>
	<!-- //start.html -->
	
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>