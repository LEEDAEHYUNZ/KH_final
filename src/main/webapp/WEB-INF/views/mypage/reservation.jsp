<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <style>
        .wrap {
            width: 100%;
            height: 100%;
        }
        .back {
            height: 86%;
            width: 100%;
        }
        .mid{
            position: absolute;
            width: 80%;
            left: 5%;
        }

        #myInfo {
   
            height: 80px;
        }

        #myMenu>p {
            text-align: center;
            font-size: 23px;
            font-weight: 900;
        }
        ul {
            margin: 0px;
            padding: 0px;
        }
        #myMenu>ul>li {  
            position: relative;
            right: 8px;
           text-align: center; 
            list-style: none;            
        }
        
        #myContent {
            position: absolute;
            width: 70%;
            right: 7%;
            top: 60px;
            height: 500px;
            overflow:auto;
            overflow-x: hidden;
        }

        #myTitle {
            position: relative;
            left: 25px;
            top: 25px;
            
        }
       /*  테이블쪽  */
        #myContent>table{
            border-collapse: collapse;
            border: solid 1px lightgray;
        }
        table th {
        text-align: center;
        border: 1px solid lightgray;
        }
        table td {
            border: 1px solid lightgray;
        }
        
        </style>
</head>
<body class="is-preload">
<%@ include file="../common/menubar.jsp" %>
<%@ include file="../common/modal.jsp" %>
    <div id="wrapper">

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
    <!-- 마이페이지 -->
    
        <div class="back"></div>
		    <div class="mid" style="width:100%; margin-left:-12%;">
		
		        <div id="myContent">
		            
		            <div id="myInfo">
		               
		                    <h2 id="myTitle" style="margin-left:-2%;">예약정보 관리</h2>
		             
		            </div>
		               
		                <br>
		                <table class="type11">
		                    <thead>
		                    <tr>
		                      <th scope="cols">장소</th>
		                      <th scope="cols">예약자</th>
		                      <th scope="cols">날짜</th>
		                      <th scope="cols">시간</th>
		                      <th scope="cols">인원수</th>
		                      <th scope="cols">취소여부</th>
		                    </tr>
		                    </thead>
		                    
		                    <c:choose>
		                    	<c:when test="${empty list}">
		                    		<tr>
		                    			<td colspan="6">예약 정보가 없습니다.</td>
		                    		</tr>
		                    	</c:when>
		                    	<c:otherwise>
		                    			<c:forEach var="r" items="${ list }">
		                    			   <form method="post" action="myRedelete">
			                    				<tr>
			                    					<input type="hidden" value="<%= loginUser.getMemberNo() %>" name="memberNo">
			                    					<input type="hidden" value="${ r.reNo }" name="reNo">
			                    					<input type="hidden" value="${ r.timeNo }" name="timeNo">
			                    					<td>${ r.resName }</td>
			                    					<td>${ r.reName }</td>
			                    					<td>${ r.reVisitdate }</td>
			                    					<td>${ r.reTime }</td>
			                    					<td>${ r.reStatus }</td>
			                    					<td><input id="deletebutton" type="submit" value="취소" style="height: 24px; width: 100%; line-height: 1px;"></td>				
			                    				</tr>
			                    			</form>
			                    		</c:forEach>
		                    	</c:otherwise>
		                    </c:choose> 
		                  </table>
		     <div style="margin-left:45%;" >   
               <c:if test="${currentPage != 1}">
                  <a  class="btn" href="${pageContext.request.contextPath}/reservation?currentPage=${currentPage - 1}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/reservation?currentPage=${p}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/reservation?currentPage=${currentPage +1}">&gt;</a>
               </c:if>
            </div>  
						
		        </div>
        	</div>
   	   </div>
   	   
			<script src="${pageContext.request.contextPath}/resources/assets/js/vendor.js"></script>
            <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>