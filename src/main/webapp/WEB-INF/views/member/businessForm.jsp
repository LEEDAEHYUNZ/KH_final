<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
    .category{
        width: 200px;   
    }
    .searchBtn{
    	float: right ;
    }
</style>
</head>
<body class="is-preload">
	<%@ include file="../common/menubar.jsp" %>
    <div id="wrapper">
    
    <div id="main">
        <div class="inner" >
            <div id="myContent" style="width: 75%;margin-left: 15%;">
               
                    <div id="myInfo">
                                        
                            <h2 id="nickName" style="color: rgb(255, 0, 106);">사업자 전환</h3>
                    
                    </div>
        		<form action="search.do" method="get">
        			<input type="text" placeholder="맛집을 입력하세요" style="width: 300px; display: inline-block" name="resName">
        			<button type="submit" style="display: inline-block; font-size: small; transform: translateX(-7%)translateY(25%);">가게찾기</button>
        			<a style="float: right;" href="${ pageContext.request.contextPath }/insert.do">맛집 등록하러 가기</a>
				</form>
				
					
					<div style="width: 100%; height: 500px;  overflow:auto;">
	                    <!-- 띄울 주소 -->
						<table>
						<thead>
							<tr>
								<th style="width: 22%; text-align:center;">상호명</th>
								<th style="width: 50%; text-align:center;">주소</th>
								<th style="width: 20%; text-align:center;">전화번호</th>
								<th style="width: 8%; text-align:center;">신청</th>
							</tr>
						</thead>
						<tbody>
						
							<c:choose>
									<c:when test="${ empty list }">
										<c:forEach var="a" items="${ list2 }">
											<form action="${ pageContext.request.contextPath }/memstatus.do" method="post">
											<tr>
											<input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
											<input type="hidden" name="resNo" value="${ a.resNo }">	
												<td style="text-align:center;">${ a.resName }</td>
												<td style="text-align:center;">${ a.resAddress }</td>
												<td style="text-align:center;">${ a.resPhone }</td>
												<td style="text-align:center;"><button type="submit" style="font-size:small">신청하기</button></td>
											</tr>
											</form>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach var="r" items="${ list }">
											<form action="${ pageContext.request.contextPath }/memstatus.do" method="post">
											<tr>
											<input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
											<input type="hidden" name="resNo" value="${ r.resNo }">	
												<td>${ r.resName }</td>
												<td>${ r.resAddress }</td>
												<td>${ r.resPhone }</td>
												<td><button type="submit" style="font-size: small;">신청하기</button></td>
											</tr>
											</form>
										</c:forEach>
									</c:otherwise>
								</c:choose>
						
							</tbody>
						</table>
					</div>
                    <br><br>
                    <!-- <a href="${ pageContext.request.contextPath }/insert.do">맛집 등록하로 가기</a> -->
                    
                      <br><br><br><br>
                       
                      
                  <form action="business.do" method="post">
                 
					<!-- 
                    <h4> 맛집 이름*
                        <input type="text" name="resName" required>
                    </h4><br>

                    <select name="category" style="width: 350px;">
                        <option>선택하세요</option>
                        <option value="ko">한식</option>
                        <option value="ch">중식</option>
                        <option value="ja">일식</option>
                        <option value="ya">양식</option>
                        <option value="ca">카페</option>
                        <option value="so">술집</option>
                        
                    </select><br><br>

                    <h4> 맛집 주소*
                        <input type="text" name="resAddress" required>
                    </h4>

                    <h4> 맛집 전화번호*
                        <input type="text" name="resPhone" required>
                    </h4>

                    <h4> 맛집 대표메뉴*
                        <input type="text" name="resBest" required>
                    </h4>

                    <h4> 맛집 상세내용* 
                        <textarea name="resContent" style="width: 100%; height: 180px; resize: none;"></textarea>
                    </h4>
 
                    <button type="submit" id="signBtn" style="float: right;">등록하기</button>
					-->
			
				</form>
            </div>
        </div>
    </div>
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
                      
    		<script src="${pageContext.request.contextPath}/resources/assets/js/vendor.js"></script>
            <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>