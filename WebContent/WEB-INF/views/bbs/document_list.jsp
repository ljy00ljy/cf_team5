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

	 <div class="container">
<div class="page-header"  >
      <h1 ><strong>${bbsName}</strong>
       - <small>글 목록</small>
 </h1>

    </div>
               <!-- 검색폼 -->
	<div class="pull-right" style="margin-bottom: 10px;">
      <form method="get"
         action="${pageContext.request.contextPath}/bbs/document_list.do"
         style="width: 200px">
         <input type="hidden" name="category" value="${category}" />
         <div class="input-group">
            <input type="text" name="keyword" class="form-control"
               placeholder="제목, 내용 검색" value="${keyword}" /> <span
               class="input-group-btn">
               <button class="btn btn-success" type="submit">
                  <i class="glyphicon glyphicon-search"></i>
               </button>
            </span>
         </div>
      </form>
   </div>
</div>

 <div class="container">
      <!-- 글 목록 시작 -->
      <div class="table-responsive">
         <table class="table table-hover">
    
            <thead>
               <tr class="alert alert-info" role="alert">
                  <th class="text-center" style="width: 100px;">번호</th>
                  <th class="text-center">제목</th>
                  <th class="text-center" style="width: 120px;">작성자</th>
                  <th class="text-center" style="width: 100px;">조회수</th>
                  <th class="text-center" style="width: 120px;">작성일</th>
               </tr>
            </thead>
          
            <tbody>
               <c:choose>
                  <c:when test="${fn:length(documentList) > 0 }">
                     <c:forEach var="document" items="${documentList}">
                        <tr>
                           <td class="text-center"  >${document.id}</td>
                           <td><c:url var="readUrl" value="/bbs/document_read.do">
                                 <c:param name="category" value="${document.category}" />
                                 <c:param name="document_id" value="${document.id}" />
                              </c:url> <a href="${readUrl}">${document.subject}
                            
                              </a></td>
                           <td class="text-center">${document.writerName}</td>
                           <td class="text-center">${document.hit}</td>
                           <td class="text-center">${document.regDate}</td>
                        </tr>
                     </c:forEach>
                  </c:when>

                  <c:otherwise>
                     <tr>
                        <td colspan="5" class="text-center" style="line-height: 100px;">조회된 글이 없습니다.</td>
                     </tr>
                  </c:otherwise>
               </c:choose>
            </tbody>
         </table>
      </div>
      <!-- 글 목록 끝 -->

      <!-- 목록페이지 하단부의 쓰기버튼 + 검색폼 + 페이지 번호 공통 영역 include -->
      <%@ include file="/WEB-INF/views/inc/bbs_list_bottom.jsp"%>
   </div>


	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>