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
			<h2>맛집 관리</h2>
			<form action="${pageContext.request.contextPath}/restaurantList.do" method="get">
				<div class="input-group mb-3">
				<input type="hidden" name ="currentPage" value = 1>
				<input type="hidden" name ="sort" value = 1>
					<input type="text" class="form-control" id="keyword" name="keyword"
						placeholder="식당 이름으로 검색할 수 있어요!">
					<div class="input-group-append" style="margin-top:0.65%;">
						<button type="submit">검색</button>
					</div>
				</div>
			</form>

			<a href="${pageContext.request.contextPath}/restaurantList.do?currentPage=1&sort=2" style="border-bottom:none;font-size:17px;">승인대기</a> |&nbsp; 
			<a href="${pageContext.request.contextPath}/restaurantList.do?currentPage=1&sort=3" style="border-bottom:none;font-size:17px;">승인</a> |&nbsp; 
			<a href="${pageContext.request.contextPath}/restaurantList.do?currentPage=1&sort=4" style="border-bottom:none;font-size:17px;">블랙리스트</a> |&nbsp; 
			<a href="${pageContext.request.contextPath}/restaurantList.do?currentPage=1&sort=5" style="border-bottom:none;font-size:17px;">폐업</a> &nbsp;
			


			<table id="restauranttable" class="table-bordered" style="font-size:17px;">
				<!--  style="width: 1500px; margin-left: -20%" -->
				<thead>
					<tr style="text-align: center;">
						<th style="text-align: center;">상호명</th>
						<th style="width:10%; text-align: center;">카테고리</th>
						<th style="width: 35%; text-align: center;">주소</th>
						<th style="width: 14%; text-align: center;">전화번호</th>
						<th style="width: 12%; text-align: center;">상태</th>
						<th style="width: 15%; text-align: center;">승인기능</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="8">텅 비어있네</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="r" items="${list}">
								<tr>
									<input type="hidden" value="${r.resNo}">
									<td>${r.resName}</td>
									<td>${r.categoryName}</td>
									<td>${r.resAddress}</td>
									<td>${r.resPhone}</td>

									
									<c:choose>
										<c:when test="${r.resStatus eq 1}">
											<td>승인대기</td>
											<td><button class="changeStatus2"style="font-size:11px;">승인</button>
											<button class="changeStatus0"style="font-size:11px;">거절</button></td>
										</c:when>
										<c:when test="${(r.resStatus eq 2) or (r.resStatus eq 3)}">
											<td>승인</td>
											<td><button class="changeStatus3" style="font-size:11px;">블랙</button></td>
										</c:when>
										<c:when test="${r.resStatus eq 4}">
											<td>블랙</td>
											<td><button class="changeStatus2"style="font-size:11px;">되돌리기</button></td>
										</c:when>
										<c:otherwise>
											<td>폐업</td>
											<td>폐업</td>
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
                  <a  class="btn" href="${pageContext.request.contextPath}/restaurantList.do?currentPage=${currentPage - 1}&sort=${sort}&keyword=${keyword}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/restaurantList.do?currentPage=${p}&sort=${sort}&keyword=${keyword}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/restaurantList?currentPage=${currentPage +1}&sort=${sort}&keyword=${keyword}">&gt;</a>
               </c:if>
            </div>   
            
		<script>
		
		$(function() {
			$(".changeStatus0").on('click',
							function() {

								var resNo = $(this).parent().siblings().eq(0).val();
								
								var changeStatus = 0;

								alert("거절 처리 되었습니다.");

								location.href = "${pageContext.request.contextPath}/restaurantStatus.do?resNo=" + resNo + "&changeStatus=" + changeStatus;
								
							});
		});
		
			$(function() {
				$(".changeStatus2").on('click',
								function() {

									var resNo = $(this).parent().siblings().eq(0).val();
									
									var changeStatus = 2;

									alert("승인 처리 되었습니다.");

									location.href = "${pageContext.request.contextPath}/restaurantStatus.do?resNo=" + resNo + "&changeStatus=" + changeStatus;
									
								});
			});

			$(function() {
				$(".changeStatus3").on('click',
								function() {

									var resNo = $(this).parent().siblings().eq(0).val();
									
									var changeStatus = 4;

									alert("블랙 처리 되었습니다.");

									location.href = "${pageContext.request.contextPath}/restaurantStatus.do?resNo=" + resNo + "&changeStatus=" + changeStatus;
									
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
