<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>:D plate</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />

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
	
	    <%@ include file="../common/menubar.jsp" %>
		
		<div class="container" >
			<h3>사업자 예약 관리</h3>
			<table name="value" class="table-bordered">
				<thead class="thead-dark">
					<tr style="text-align: center; ">
						<th style="text-align: center; padding:3px;">예약자</th>
						<th style="text-align: center; padding:3px;">전화번호</th>
						<th style="text-align: center; padding:3px;">예약 날짜</th>
						<th style="text-align: center; padding:3px;">예약 시간</th>
						<th style="text-align: center; padding:3px;">요청사항</th>
						<th style="text-align: center; padding:3px;">인원수</th>
						<th style="text-align: center; padding:3px;">취소</th>
					</tr>
				</thead>
				
				
				<tbody>
				<c:set var="r" value="<%= loginUser.getResNo() %>"/>
				<c:choose>
				<c:when test="${ empty list }">
					<tr>
						<td colspan="7" align="center">
								등록된 예약이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
				
				<c:forEach var="re" items="${ list }">
				<c:if test="${ r == re.resNo }" >
				<form action="reservationList" method="post">
					<tr>
						<td>${ re.reName }</td>
						<td>${ re.rePhone }</td>
						<td>${ re.reVisitdate }</td>
						<td>${ re.reTime }</td>
						<td>${ re.reRequest }</td>
						<td>${ re.reStatus }</td>
						<td><button type="submit"style="font-size:small;">취소</button></td>
						<!-- onclick="javascript:deletebtn() -->
					  </tr>
					  
					  <input type="hidden" name="memberNo" value="1">
					  <input type="hidden" name="reNo" value="${ re.reNo }" >
					  <input type="hidden" name="resNo" value="${ re.resNo }" >
					  <input type="hidden" name="reStatus" value="${ re.reStatus }">
					  <input type="hidden" name="reTime" value="${ re.reTime }">
					  <input type="hidden" name="reVisitdate" value="${ re.reVisitdate }">
				</form>	
				</c:if> 
				</c:forEach>
				</c:otherwise>
			</c:choose>

				</tbody>
			</table>
		
		
		
		   <div style="margin-left:45%;" >   
               
               <c:if test="${currentPage != 1}">
                  <a  class="btn" href="${pageContext.request.contextPath}/reservationList.do?currentPage=${currentPage - 1}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/reservationList.do?currentPage=${p}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/reservationList.do?currentPage=${currentPage +1}">&gt;</a>
               </c:if>
            </div>   
		
		
		<!-- 예약 삭제 전 다시 한 번 물어보기 
		<script> 
		function deletebtn(){
			alert('예약을 취소 하시겠습니까 ?'); } 
		
		</script>
		-->

		

			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
			
			<script>
		jQuery(function($) {
		    $("body").css("display", "none");
		    $("body").fadeIn(2000);
		    $("a.transition").click(function(event){
		        event.preventDefault();
		        linkLocation = this.href;
		        $("body").fadeOut(1000, redirectPage);
		    });
		    function redirectPage() {
		    window.location = linkLocation;
		    }
		});
		</script>
		
		<script>
			// script 태그 내에서도 스크립틀릿과 같은 jsp 요소를 쓸 수 있다.
			
				var msg = "<%= alertMsg %>"; 
				
				if(msg != "null") { // 즉, 성공 / 경고 메시지 문구가 담겨있을 경우
					alert(msg);
				
					// session 에 들어있는 alertMsg 키값에 대한 밸류를 지워줘야함!!
					// 안그러면 menubar.jsp 가 로딩될때마다 매번 alert 가 뜰것
					// => XX.removeAttribute("키값");
					<% session.removeAttribute("alertMsg"); %>
				}
			
	</script>

</body>

</html>