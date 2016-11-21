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
		<h3>내 정보수정</h3>
		<p>
			이주영 <small>님</small>
		</p>
	</div>
	<!-- //mypage_header -->

	<!-- profile -->
	<div class="container">
		<!-- 가입폼 -->
		<form class="form-horizontal" name="myform" method="post"
			enctype="multipart/form-data" action="${pageContext.request.contextPath }/member/profile_ok.do">

			<div class="form-group">
				<label for="user_pw" class="col-md-2">이전 비밀번호*</label>
				<div class="col-md-10">
					<input type="password" name="user_pw" id="user_pw"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="user_pw_new" class="col-md-2">새 비밀번호*</label>
				<div class="col-md-10">
					<input type="password" name="user_pw_new" id="user_pw_new"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="user_pw_re_new" class="col-md-2">새 비밀번호 확인*</label>
				<div class="col-md-10">
					<input type="password" name="user_pw_re_new" id="user_pw_re_new"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="col-md-2">이름*</label>
				<div class="col-md-10">
					<input type="text" name="name" id="name" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="tel" class="col-md-2">연락처*</label>
				<div class="col-md-10">
					<input type="tel" name="tel" id="tel" class="form-control"
						placeholder="'-'없이 입력" />
				</div>
			</div>

			<div class="form-group">
				<label for="gender1" class="col-md-2">성별</label>
				<div class="col-md-10">
					<label class="radio-inline"> <input type="radio"
						name="gender" id="gender1" value="M" />남자
					</label> <label class="radio-inline"> <input type="radio"
						name="gender" id="gender2" value="F" />여자
					</label>
				</div>
			</div>

			<div class="form-group">
				<label for="birthdate" class="col-md-2">생년월일</label>
				<div class="col-md-10">
					<input type="date" name="birthdate" id="birthdate"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="postcode" class="col-md-2">우편번호</label>
				<div class="col-md-10 clearfix">
					<input type="text" name="postcode" id="postcode"
						class="form-control pull-left"
						style="width: 120px; margin-right: 5px;" />
					<!-- 클릭 시 javascript 함수 호출 : openDaumPostcode() -->
					<input type="button" value="우편번호찾기" class="btn btn-warning"
						onclick='execDaumPostcode("postcode","addr1","addr2")' />
				</div>
			</div>

			<div class="form-group">
				<label for="addr1" class="col-md-2">주소</label>
				<div class="col-md-10">
					<input type="text" name="addr1" id="addr1" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="addr2" class="col-md-2">상세주소</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="profile_img" class="col-md-2">프로필 사진</label>
				<div class="col-md-10">
					<input type="file" name="profile_img" id="profile_img"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="bank_brand" class="col-md-2">은행명</label>
				<div class="col-md-10">
					<input type="text" name="bank_brand" id="bank_brand"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="bank_num" class="col-md-2">계좌번호</label>
				<div class="col-md-10">
					<input type="text" name="bank_num" id="bank_num"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="bank_name" class="col-md-2">예금주</label>
				<div class="col-md-10">
					<input type="text" name="bank_name" id="bank_name"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button type="submit" class="btn btn-primary">수정하기</button>
					<button type="reset" class="btn btn-danger">다시작성</button>
				</div>
			</div>

		</form>
		<!-- //가입폼 -->
	</div>
	<!-- //profile -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>