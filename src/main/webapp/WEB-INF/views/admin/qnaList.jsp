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
			<h2>1:1 문의 관리</h2>
			<form action="${pageContext.request.contextPath}/qnaList.do" method="get">
				<div class="input-group mb-3">
				<input type="hidden" name ="currentPage" value = 1>
				<input type="hidden" name ="sort" value = 1>
					<input type="text" class="form-control" id="keyword" name="keyword"
						placeholder="제목 키워드로 검색할 수 있어요!">
						
					<div class="input-group-append"style="margin-top:0.65%;">
						<button type="submit" >검색</button>
					</div>
				</div>
			</form>
			
			<a href="${pageContext.request.contextPath}/qnaList.do?currentPage=1&sort=2" style="border-bottom:none;">답변완료</a> |
			<a href="${pageContext.request.contextPath}/qnaList.do?currentPage=1&sort=3" style="border-bottom:none;">답변미완료</a>
			<table name="value" class="table-bordered">
				<thead class="thead-dark">
					<tr style="text-align: center;">
						<th style="text-align: center;">아이디</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">등록일</th>
						<th style="text-align: center;">답변상태</th>
						<th style="text-align: center;">답변기능</th>
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
							<c:forEach var="q" items="${list}">

								<tr>
									<input type="hidden" value="${q.qnaNo}">
									<input type="hidden" value="${q.qnaStatus}">
									<input type="hidden" value="${q.qnaContent}">
									<input type="hidden" value="${q.qnaAnswer}">
									<td>${q.memberId}</td>
									<td>${q.qnaTitle}</td>
									<td><fmt:formatDate value="${q.qnaDate}"
											pattern="yyyy-MM-dd HH:mm" /></td>
									<c:choose>
										<c:when test="${q.qnaStatus eq 'N'}">
											<td>미완료</td>
											<td><button class="showAnswer" data-toggle="modal"
													data-target="#answer">답변하기</button></td>
										</c:when>
										<c:otherwise>
											<td>완료</td>
											<td><button class="showAnswerContent"
													data-toggle="modal" data-target="#answerContent">내용보기</button></td>
										</c:otherwise>
									</c:choose>

								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>

			<!-- The Modal -->
			<div class="modal" id="answer" style="height: 1500px;">
				<div class="modal-dialog modal-lg modal-center">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">상세내용</h4>
							<button type="button" class="close" data-dismiss="modal"
								style="width: 35px; height: 35px; padding: 8px;">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<form action="${pageContext.request.contextPath}/qnaAnswer.do"
								method="post">
								<table class="table-bordered">


									<input id="qnaNo" type="hidden" name="qnaNo" value="1">


									<tr>
										<th style="width: 16%">아이디</th>
										<td id="memberId"></td>
									</tr>
									<tr>
										<th>제목</th>
										<td id="qnaTitle"></td>
									</tr>
									<tr>
										<th>내용</th>
										<td id="qnaContent"></td>
									</tr>
									<tr>
										<th>답변내용</th>
										<td><textarea name="qnaAnswer" style="resize: none;">
										</textarea></td>
									</tr>
								</table>
								<button type="submit" id ="answerAlert" class="btn btn-sm"
									style="margin: auto; display: block;">등록하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>


			<!-- The Modal -->
			<div class="modal" id="answerContent" style="height: 1500px;">
				<div class="modal-dialog modal-lg modal-center">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">상세내용</h4>
							<button type="button" class="close" data-dismiss="modal"
								style="width: 35px; height: 35px; padding: 8px;">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							
								<table class="table-bordered">


									<tr>
										<th style="width: 16%">아이디</th>
										<td id="memberId2"></td>
									</tr>
									<tr>
										<th>제목</th>
										<td id="qnaTitle2"></td>
									</tr>
									<tr>
										<th>내용</th>
										<td id="qnaContent2"></td>
									</tr>
									<tr>
										<th>답변내용</th>
										<td id="qnaAnswer"></td>
									</tr>
								</table>
								
						</div>
					</div>
				</div>
			</div>



			<script>
				$(function() {

					$(".showAnswer").click(
							function() {
								
								var qnaNo = $(this).parent().siblings().eq(0).val();
								var memberId = $(this).parent().siblings().eq(4).text();
								var qnaTitle = $(this).parent().siblings().eq(5).text();
								var qnaContent = $(this).parent().siblings().eq(2).val();												
								
								$("#qnaNo").val(qnaNo);				
								$("#memberId").text(memberId);
								$("#qnaTitle").text(qnaTitle);
								$("#qnaContent").text(qnaContent);

							});

				});
				
				$(function() {

					$(".showAnswerContent").click(
							function() {
								
								var memberId2 = $(this).parent().siblings().eq(4).text();
								var qnaTitle2 = $(this).parent().siblings().eq(5).text();
								var qnaContent2 = $(this).parent().siblings().eq(2).val();												
								var qnaAnswer =  $(this).parent().siblings().eq(3).val();		
										
								$("#memberId2").text(memberId2);
								$("#qnaTitle2").text(qnaTitle2);
								$("#qnaContent2").text(qnaContent2);
								$("#qnaAnswer").text(qnaAnswer);

							});

				});
				
				
			</script>




			<div style="margin-left: 45%;">

				<c:if test="${currentPage != 1}">
					<a class="btn"
						href="${pageContext.request.contextPath}/qnaList.do?currentPage=${currentPage - 1}&sort=${sort}&keyword=${keyword}">&lt;</a>
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage}" var="p">
					<c:choose>
						<c:when test="${p == currentPage}">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != currentPage }">
							<a class="btn"
								href="${pageContext.request.contextPath}/qnaList.do?currentPage=${p}&sort=${sort}&keyword=${keyword}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage != maxPage}">

					<a class="btn"
						href="${pageContext.request.contextPath}/qnaList.do?currentPage=${currentPage +1}&sort=${sort}&keyword=${keyword}">&gt;</a>
				</c:if>
			</div>
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
