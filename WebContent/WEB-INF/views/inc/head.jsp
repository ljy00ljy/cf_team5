<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- http://java.sun.com/jsp/jstl/cored 에 정의된 JSTL 기능을 "c"라는 이름으로 정의 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title></title>

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
      <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/html5shiv.min.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/respond.min.js"></script>
    <![endif]-->
<!-- IE10 반응형 웹 버그 보완 -->
<!-- [if gt IE 9]>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/ie10.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ie10.js"></script>
    <![endif]-->

<!-- jquery -->
<script
	src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath }/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/plugins/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- 나눔고딕 웹폰트 -->
<link
	href="${pageContext.request.contextPath }/assets/fonts/css/nanumfont.css"
	rel="stylesheet">
<!-- reset -->
<link
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	rel="stylesheet">
<!-- common css -->
<link
	href="${pageContext.request.contextPath }/assets/css/common.css"
	rel="stylesheet">



<!-- handlebars -->
<script src="${pageContext.request.contextPath }/plugins/handlebars/handlebars-v4.0.5.js"></script>

<!-- ajax helper -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/ajax/ajax_helper.css" />
<script src="${pageContext.request.contextPath }/plugins/ajax/ajax_helper.js"></script>

<!-- ajaxForm -->
<script src="${pageContext.request.contextPath }/plugins/ajax-form/jquery.form.min.js"></script>

<!-- 다음 우편번호 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/plugins/daum-postcode/js/daumPostCode.js"></script>

<!-- CKEditer -->
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>

