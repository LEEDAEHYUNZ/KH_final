<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<h2>이용자 관리</h2>
			<form action="${pageContext.request.contextPath}/memberList.do" method="get">
				<div class="input-group mb-3">
				<input type="hidden" name ="currentPage" value = 1>
				<input type="hidden" name ="sort" value = 1>

					<input type="text" class="form-control" id="keyword" name="keyword"
						placeholder="사용자의 아이디로 검색할 수 있어요!">
					<div class="input-group-append" style="margin-top:0.65%;">
						<button type="submit" >검색</button>
					</div>
				</div>
			</form>

			<a href="${pageContext.request.contextPath}/memberList.do?currentPage=1&sort=2"style="border-bottom:none;">활성화</a> |
			<a href="${pageContext.request.contextPath}/memberList.do?currentPage=1&sort=3"style="border-bottom:none;">비활성화</a>

			<br>

			<table id="membertable" class="table-bordered">
				<thead class="thead-dark">
					<tr>
						<th style="width: 15%; text-align: center;">아이디</th>
						<th style="width: 10%; text-align: center;">이름</th>
						<th style="width: 40%; text-align: center;">이메일</th>
						<th style="width: 15%; text-align: center;">가입일</th>
						<th style="width: 10%; text-align: center;">상태</th>
						<th style="width: 10%; text-align: center;">제재</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="6">텅 비어있네</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="m" items="${list}">
								
									<tr>
										<input type="hidden" value="${m.memberNo}">
										<input type="hidden" value="${m.memberStatus}">
										<td>${m.memberId}</td>
										<td>${m.memberName}</td>
										<td>${m.memberEmail}</td>
										<td>
										
										<fmt:formatDate value="${ m.enrollDate }" pattern="yyyy-MM-dd"/>
										</td>
	
										<c:choose>
											<c:when test="${m.memberStatus eq 0}">
												<td>비활성화</td>
											</c:when>
											<c:otherwise>
												<td>활성화</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${m.memberStatus eq 0}">
												<td><button style="font-size:small;">활성화</button></td>
											</c:when>
											<c:otherwise>
												<td><button style="font-size:small;">비활성화</button></td>
											</c:otherwise>
										</c:choose>
	
									</tr>
								
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>

		</div>
		<div style="margin-left:45%;" >   
               
               <c:if test="${currentPage != 1}">
                  <a  class="btn" href="${pageContext.request.contextPath}/memberList.do?currentPage=${currentPage - 1}&sort=${sort}&keyword=${keyword}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/memberList.do?currentPage=${p}&sort=${sort}&keyword=${keyword}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/memberList.do?currentPage=${currentPage +1}&sort=${sort}&keyword=${keyword}">&gt;</a>
               </c:if>
            </div>   


		<script>
			$(function() {

				$("#membertable")
						.on(
								"click",
								"button",
								function() {

									var memberNo = $(this).parent().siblings()
											.eq(0).val();

									var memberStatus = $(this).parent()
											.siblings().eq(1).val();

									alert("회원의 상태값이 변경 되었습니다.");

									location.href = "${pageContext.request.contextPath}/memberStatus.do?memberNo="
											+ memberNo
											+ "&memberStatus="
											+ memberStatus;
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
		<script src="${pageContext.request.contextPath}/resources/assets/js/vendor.js"></script>
</body>

</html>
