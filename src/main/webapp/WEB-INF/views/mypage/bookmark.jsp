<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <style>
        .wrap {
            width: 100%;
            height: 100%;
        }
        .mid{
            position: absolute;
            height: 100%;
            width: 80%;
            top: 95%;
            left: 65%;
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
            right: 10%;
            height: 100%;
            overflow-y: hidden;
            overflow-x: hidden;
            
        }

        #myTitle {
            position: relative;
            left: 25px;
            top: 25px;
            
        }
        #myInfo {
            border-bottom: solid 2px;
            height: 25%;
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

       
        </style>
</head>
<body class="is-preload" >

	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/modal.jsp" %>
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
        
        

            <div id="myContent" style="transform: translateX(-7%);">

                <div id="myInfo">
               
                       <h3 id="nickName">즐겨찾기 관리</h3>
                
                </div>

                <h2 id="myTitle"></h2>
            
                
                
                    <table class="type11" style="border-collapse: collapse;  ">
				            <thead class="thead-dark">
				               <tr style="text-align: center;">
				                  <th style="text-align: center;width:30%;">상호명</th>
				                  <th style="text-align: center; ">장소</th>
				                  <th style="text-align: center; width:20%;">삭제</th>
				               </tr>
				            </thead>
				            
					         <c:choose>
								<c:when test="${ empty list }">
									<tr>
										<td>조회 결과가 없습니다.</td>
										<td></td>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="b" items="${ list }">
									  <form action="${pageContext.request.contextPath}/myBookmarkDelete" method="post">
										  <input type="hidden" value="${ b.bookmarkNo }" name="bookmarkNo">
											<tr class="click">
											<input type="hidden" value="${ b.resNo }">
	                        					  <td style="text-align: center;">${ b.resName }</td>
	                        					  <td style="text-align: center;">${ b.resAddress }</td>                 
	                        					  <td style="text-align: center;"><input type="submit" value="삭제" style="height: 40px; line-height: 50%;"></td> 
	                      				    </tr>
                      				   </form> 
									</c:forEach>
								</c:otherwise>
							</c:choose>
                       
                        
                       
                      </table>
			<div style="margin-left:45%;" >   
               
               <c:if test="${currentPage != 1}">
                  <a  class="btn" href="${pageContext.request.contextPath}/bookmark?currentPage=${currentPage - 1}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/bookmark?currentPage=${p}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/bookmark?currentPage=${currentPage +1}">&gt;</a>
               </c:if>
            </div>   

                

               
                
		</div>
                
         
			<script type="text/javascript">
	               $(function(){
	                  
	                  $(".click").click(function() {
	                     var resNo = $(this).children().eq(0).val();
	                     
	                     location.href = "${pageContext.request.contextPath}/restaurantList/" + resNo;
	                     
	                  });
	                  
	               });
	            </script>

      		<script src="${pageContext.request.contextPath}/resources/assets/js/vendor.js"></script>
            <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>