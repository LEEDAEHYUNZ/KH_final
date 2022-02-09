<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>:D plate</title>
<meta charset="utf-8" />
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<noscript>
   <link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" />
</noscript>

<style>
.table {
   margin: auto;
}

th {
   font-size: 200px;
}

tr {
   font-size: 15px;
   text-align: center;
   vertical-align: middle;
   line-height: 35px;
}

td {
   height: 20px;
   line-height: 30px;
}
</style>
</head>

<body class="is-preload">
   <!-- Wrapper -->

   <div id="wrapper">
      <!-- Header -->
      <%@ include file="../common/menubar.jsp" %>

      <!-- Main -->
      <div class="container">
         <h2>사업자 관리</h2>
      <form action="${pageContext.request.contextPath}/businessList.do" method="get">
            <div class="input-group mb-3">
                        <input type="hidden" name ="currentPage" value = 1>
            <input type="hidden" name ="sort" value = 1>
               <input type="text" class="form-control" name="keyword"
                  name="keyword"placeholder="식당 이름으로 검색할 수 있어요!">
               <div class="input-group-append" style="margin-top:0.65%;">
                  <button type="submit" >검색</button>
               </div>
            </div>
         </form>

<a href="${pageContext.request.contextPath}/businessList.do?currentPage=1&sort=2" style="border-bottom:none;">요청</a> |
   <a href="${pageContext.request.contextPath}/businessList.do?currentPage=1&sort=3" style="border-bottom:none;">승인</a>

         <table id="businesstable" class="table-bordered">
            <thead>
               <tr>
                  <th style="text-align:center">아이디</th>
                  <th style="text-align:center">상호명</th>
                  <th style="text-align:center">주소</th>
                  <th style="text-align:center">승인여부</th>
                  <th style="text-align:center">제재</th>
               </tr>
            </thead>
            <tbody>
            <c:choose>
                  <c:when test="${empty list}">
                     <tr>
                        <td colspan="5">텅 비어있네</td>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <c:forEach var="b" items="${list}">
                        <tr>
                           <input type="hidden" value="${b.memberNo}">
                           <input type="hidden" value="${b.resNo}">
                           <td>${b.memberId}</td>
                           <td>${b.resName}</td>
                           <td>${b.resAddress}</td>
                           <c:choose>
                              <c:when test="${b.memberStatus eq 2}">
                                 <td>요청</td>
                                 <td><button class="updateBusinessStatus">승인하기</button>
                                 <button class="deleteBusinessStatus">거절하기</button></td>
                              </c:when>
                              <c:otherwise>
                                 <td>승인</td>
                                 <td><button class="deleteBusinessStatus">일반전환</button></td>
                              </c:otherwise>
                           </c:choose>
                           
                        </tr>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
               

            </tbody>
         </table>
      </div>

      <div style="margin-left: 45%;">

         <c:if test="${currentPage != 1}">
            <a class="btn"
               href="${pageContext.request.contextPath}/businessList.do?currentPage=${currentPage - 1}&sort=${sort}&keyword=${keyword}">&lt;</a>
         </c:if>
         <c:forEach begin="${startPage }" end="${endPage}" var="p">
            <c:choose>
               <c:when test="${p == currentPage}">
                  <b>${p}</b>
               </c:when>
               <c:when test="${p != currentPage }">
                  <a class="btn"
                     href="${pageContext.request.contextPath}/business.do?currentPage=${p}&sort=${sort}&keyword=${keyword}">${p}</a>
               </c:when>
            </c:choose>
         </c:forEach>
         <c:if test="${currentPage != maxPage}">

            <a class="btn"
               href="${pageContext.request.contextPath}/businessList.do?currentPage=${currentPage +1}&sort=${sort}&keyword=${keyword}">&gt;</a>
         </c:if>
      </div>
      
      <script>
      $(function() {
         $(".updateBusinessStatus")
               .on(
                     'click',

                     function() {

                        var memberNo = $(this).parent().siblings().eq(0).val();

                        var  resNo =  $(this).parent().siblings().eq(1).val();
                        
                        alert("사업자 승인이 완료되었습니다.");

                        location.href = "${pageContext.request.contextPath}/businessStatus.do?memberNo="
                              + memberNo + "&changeStatus=" + 3 + "&resNo=" + resNo;
                     });
      });
      
      $(function() {
         $(".deleteBusinessStatus")
               .on(
                     'click',

                     function() {

                        var memberNo = $(this).parent().siblings()
                              .eq(0).val();

                        var  resNo =  $(this).parent().siblings().eq(1).val();
                        alert("일반 회원으로 전환이 완료되었습니다.");

                        location.href = "${pageContext.request.contextPath}/businessStatus.do?memberNo="
                           + memberNo + "&changeStatus=" + 1 + "&resNo=" + resNo;;
                     });
      });
      </script>

      <!-- Scripts -->
      <script
         src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
      <script
         src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
      <script
         src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
      <script
         src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
      <script
         src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>

</html>