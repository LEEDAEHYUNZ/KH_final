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

.modal-dialog.modal-lg {
	width: 100%;
	height: 100%;
	margin-left: 28%;
	margin-top: 18%;
	padding: 0;
}

.modal-content.modal-lg {
	height: auto;
	min-height: 100%;
	border-radius: 0;
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
			<h2>리뷰 신고 내역</h2>
			<form action="${pageContext.request.contextPath}/reviewList.do" method="get">
				<div class="input-group mb-3">
				<input type="hidden" name ="currentPage" value = 1>
				<input type="text" class="form-control" id="keyword" name="keyword"
						placeholder="식당 이름으로 검색할 수 있어요!">
					<div class="input-group-append"style="margin-top:0.65%;">
						<button type="submit" >검색</button>
					</div>
				</div>
			</form>

			<table name="reviewtable" class="table-bordered">
				<thead>
					<tr style="text-align: center;">
						<th style="width : 50%; text-align: center">상호명</th>
						<th style="width: 30%; text-align: center;">리뷰 / 신고 내용</th>
						<th style="width: 20%; text-align: center;">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4">텅 비어있네</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="r" items="${list}">
								<tr>
									<input type="hidden" value="${r.reviewNo}">
									<input type="hidden" value="${r.warnStatus}">
									<input type="hidden" value="${r.reviewContent}">
									<input type="hidden" value="${r.warnContent}">
									<td>${r.resName }</td>
									<td>
										<button type="button"
											class="btn btn-sm btn-block btn-showView" data-toggle="modal"
											data-target="#reviewModal">내용보기</button>
									</td>
									<td>
										<button class="btn btn-sm reviewDelete" type="button" style="font-size:small;">삭제하기</button>
										<button class="btn btn-sm reviewRollback" type="button" style="font-size:small;">되돌리기</button>
									</td>
								</tr>

							</c:forEach>
						</c:otherwise>
					</c:choose>


				</tbody>
			</table>
		</div>


		<!-- The Modal -->
		<div class="modal" id="reviewModal" style="height: 1500px;">
			<div class="modal-dialog modal-lg modal-center">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header" >
						<h4 class="modal-title" style="margin-left:50%">상세내용</h4>
						
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<table class="table-bordered">
							<tr>
								<th style="text-align:center;">리뷰내용</th>
								<td id="reviewContent"style="text-align:center;"></td>
							</tr>
							<tr>
								<th style="text-align:center;">신고내용</th>
								<td id="warnContent" style="text-align:center;"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div style="margin-left:45%;" >   
               
               <c:if test="${currentPage != 1}">
                  <a  class="btn" href="${pageContext.request.contextPath}/reviewList.do?currentPage=${currentPage - 1}&keyword=${keyword}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/reviewList.do?currentPage=${p}&keyword=${keyword}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/reviewList.do?currentPage=${currentPage +1}&keyword=${keyword}">&gt;</a>
               </c:if>
            </div>   

		<script>
			$(function() {

				$(".btn-showView").click(
						function() {

							var reviewContent = $(this).parent().siblings().eq(
									2).val();
							var warnContent = $(this).parent().siblings().eq(3)
									.val();

							$("#reviewContent").text(reviewContent);
							$("#warnContent").text(warnContent);

						});

			});

			$(function() {
				$(".reviewDelete")
						.on(
								'click',

								function() {

									var reviewNo = $(this).parent().siblings()
											.eq(0).val();

									alert("리뷰 삭제가 완료 되었습니다.");

									location.href = "${pageContext.request.contextPath}/reviewStatus.do?reviewNo="
											+ reviewNo + "&changeStatus=" + 0;
								});
			});

			$(function() {
				$(".reviewRollback")
						.on(
								'click',
								function() {

									var reviewNo = $(this).parent().siblings()
											.eq(0).val();

									alert("리뷰 복구가 완료 되었습니다.");

									location.href = "${pageContext.request.contextPath}/reviewStatus.do?reviewNo="
											+ reviewNo + "&changeStatus=" + 1;

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
