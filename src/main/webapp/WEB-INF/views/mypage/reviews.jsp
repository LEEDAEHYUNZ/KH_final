<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            position: absolute;
            top: 45%;
            left: 30%;
            transform: translate(-30%, -30%);
        }
        .mid{
            position: absolute;
            height: 70%;
            width: 60%;
            top: 80%;
            left: 70%;
            transform: translate(-75%, -75%);
            z-index: 1;
           background: rgb(255, 255, 255);
        }
        #myMenu {
            height: 100%;
            width: 180px;
            border-right: 1px solid gray;
            z-index: 1;
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
            height: 500px;
            overflow:auto;
            overflow-x: hidden;
            
        }

        #myTitle {
            position: relative;
            left: 25px;
            top: 25px;
            
        }
        #myInfo {
            border-bottom: solid 2px;
            height: 15%;
        }
        #myInfoContent{
            float: right;
            width: 78%;
            height: 100%;
        }
        #email{
            position: relative;
            left: 15px;
            top: 30px;
            font-size: 15px;
        }
        #nickName{
            position: relative;
            left: 15px;
            top: 45px;
            font-size: 20px;
        }
        #updateInfo{
            margin: 25px;
            
        }
        #updateInfo > div:nth-child(odd) {
            background-color: rgb(245, 167, 245);
            font-weight: 600;
            height: 100px;
        }
        #updateInfo > div:nth-child(even) {
            background-color: rgb(248, 213, 242);
            font-weight: 600;
            height: 100px;
        }
        #updateInfo>div>div {
            border-bottom: rgb(214, 116, 165) solid 1px;
        }
       
        </style>
</head>
<body class="is-preload">
<%@ include file="../common/menubar.jsp" %>
<%@ include file="../common/modal.jsp" %>
    <div id="wrapper" >

    <!-- 마이페이지 -->
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
		
        <div class="back"></div>
        <div class="mid" style="width:70%; margin-left:-2%;">
                <div id="myInfo">
                       <h3 id="nickName">리뷰관리</h3>
                </div>
                	<div id="updateInfo"></div>
                
                    <table class="type11" >
                    
                        <thead style="font-size: large;">
                        <tr align="center">
                          <th scope="cols" style="width: 20%; text-align:center;">맛집이름</th>
                          <th scope="cols" style="width: 40%; text-align:center;">내용</th>
                          <th scope="cols" style="width: 15%; text-align:center;">날짜</th>
                          <th scope="cols" style="width: 10%; text-align:center;">평가내용</th>
                          <th scope="cols" style="width: 15%; text-align:center;">삭제</th>
                        </tr>
                        </thead>
                        
                        
	                    <c:choose>
	                    	<c:when test="${empty list}">
	                    		<tr>
	                    			<td colspan="5">작성한 리뷰가 없습니다.</td>
	                    		</tr>
	                    	</c:when>
	                    	<c:otherwise>

	                    			<c:forEach var="r" items="${ list }">
	                    			  <form method="post" action="myDelete" >
					                        <tr align="center" class="click">
					                        <input type="hidden" value="${ r.resNo }">
					                        <input type="hidden" value="${ r.reviewNo }" name="reviewNo">
					                          <td >${ r.resName }</td>
					                          <td>${ r.reviewContent }</td>
					                          <td><fmt:formatDate value="${r.uploadDate}" pattern="yy-MM-dd" /> </td>
					                          <td style="text-align:center;">
				                          		<c:choose>
													<c:when test="${ r.reviewRate == 1 }">
														<svg xmlns="http://www.w3.org/2000/svg" width="50" height="30" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16" style="color:hotpink;">
															<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
															<path d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"/>
														</svg>
													</c:when>
													<c:when test="${ r.reviewRate == 2 }">
														<svg xmlns="http://www.w3.org/2000/svg" width="50" height="30" fill="currentColor" class="bi bi-emoji-neutral" viewBox="0 0 16 16" style="color:orange;">
															<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
															<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
														</svg>
													</c:when>
													<c:when test="${ r.reviewRate == 3 }">
														<svg xmlns="http://www.w3.org/2000/svg" width="50" height="30" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16" style="color:red;">
															<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
															<path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
														</svg>
													</c:when>
												</c:choose>
					                          </td>
					                          <td style="width: 90px;"><input type="submit" value="삭제" style="heght: 30px; line-height: 50%; text-align: center;" ></td>
					                        </tr>
					                         
			                    	   </form>	
			                    	</c:forEach>
		                    	</c:otherwise>
		                    </c:choose> 
		                    
         
                      </table>

                		    <div style="margin-left:45%;" >   
               <c:if test="${currentPage != 1}">
                  <a  class="btn" href="${pageContext.request.contextPath}/myReview?currentPage=${currentPage - 1}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/myReview?currentPage=${p}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/myReview?currentPage=${currentPage +1}">&gt;</a>
               </c:if>
            </div> 

                </div>
                

                
            </div>

        </div>
    </div>

				<script type="text/javascript">
	               $(function(){
	                  
	                  $(".click").click(function() {
	                     var reviewNo = $(this).children().eq(0).val();
	                     
	                     location.href = "${pageContext.request.contextPath}/restaurantList/" + reviewNo;
	                     
	                  });
	                  
	               });
	            </script>

            <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>