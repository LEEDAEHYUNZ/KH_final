<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ res.resName }</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식 -->
	<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css" />
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<style>
		/* 이미지 모달  */
		.imgModal {
		    display: none;
		    z-index: 500;
		    width: 100%;
		    height: 100%;
		    position: fixed;
		    top: 0;
		    left: 0;
		    background-color: rgba(0, 0, 0, 0.8);
		}
			.imgModalBox {
	         position: fixed;
	         top: 50%;
	         left: 50%;
	         -webkit-transform: translate(-50%, -50%);
	         -moz-transform: translate(-50%, -50%);
	         -ms-transform: translate(-50%, -50%);
	         -o-transform: translate(-50%, -50%);
	         transform: translate(-50%, -50%);
	      }
	     .imgModalBox>img {
            margin-left: 4%;
            max-width: 100%;
            height: 700px;
            border-radius: 2%;
       }
		table a>img:hover {
			cursor: zoom-in;
		}
		.imgModalBox>img:hover{
		    cursor: zoom-out;
		}
	</style>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">
	
			

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

		<!-- Main -->
			<div id="main">
				<div class="inner">
					
						<div class="w3-content" style="width: 38%; float: left; margin-right: 3%; margin-top: 2%;" data-aos="fade-up">
							<c:forEach var="i" items="${ list3 }">
								<c:if test="${ res.resNo == i.resNo && i.reviewNo == 0}">
									<img class="mySlide" src="${pageContext.request.contextPath}/resources/images/${ i.changeName }" style="max-width:100%; height:450px;margin:auto;">
								</c:if>
							</c:forEach>
								
								<a style=" border-bottom: none; margin-left: 0%;" onclick="plusDivs2(-1)"> ❮</a>
								<a style="border-bottom: none; margin-left: 94%; " onclick="plusDivs2(1)">❯ </a>
								
								</div>
							</div>
					
				</div>
				<div id="map" style="width:40%; height:450px; margin-right: 10%; float: right; margin-top:-5%" data-aos="fade-up"></div>
				
				<div style="margin-top: 2%;   float: left; width: 75%; height: 20%; margin-left: 15%;" data-aos="fade-up">
					<h2> ${ res.resName }
					<% if(loginUser != null) { %>
					<c:set var="memberNo" value="<%=loginUser.getMemberNo() %>"/>
					<c:set var="loop_flag" value="false" />
					<c:set var= "boo" value="0"/>
					
					<!-- booklist == 즐겨찾기된 목록 -->
					<c:forEach var="b" items="${ boolist }" >
						<c:if test="${ b.resNo eq res.resNo and memberNo eq b.memberNo }">
							<c:set var= "boo" value="1"/>
						</c:if>
					</c:forEach>
					
						
                		<c:if test="${ boo==1 }">
             
			                <span>
							 <a idx="${ res.resNo }" href="javascript:" class="heart-click heart_icon${ res.resNo }" style="border-bottom:none !important;">
							 <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
			                 <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
			                 </svg>
			                 </a>
			                </span>
                				
               		 	</c:if>
		                
				        <c:if test="${ boo==0 }">      
					                <span>
					               		<a idx="${ res.resNo }" href="javascript:" class="heart-click heart_icon${ res.resNo }" style="border-bottom:none !important;">
					                    <svg  xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
				                        <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
				                        </svg></a></span>
				         </c:if>             
		                 
			
				
           		
					<c:if test="${ res.resStatus == 3}">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/make/${res.resNo}'"style=" float:right; transform: translateY(-10%); font-size:small; margin-left:1%;" data-aos="fade-up">예약하기</button>
					</c:if>
					<% } %>
					</h2>
					<hr>
					<p> ${ res.resContent } </p>
					<br>
				</div>
				
				<div style=" margin-top: 3%; width: 75%; height: 30%;  height:40%; float: left; margin-left: 15%;overflow: hidden;">
					<form action="reviewList" method="post" enctype="multipart/form-data">
						<table style="border: none; background: white; overflow: hidden;">
							<thead>
								<tr>
									<th colspan="2" data-aos="fade-up">
										<c:choose>
											<c:when test="${ empty reviewList }">
												<a href="${pageContext.request.contextPath}/restaurantList/${resNo}?currentPage=1&sort=0" style="border-bottom: none;">전체(0)</a> |
												<a type="button" href="${pageContext.request.contextPath}/restaurantList/${resNo}?currentPage=1&sort=1" style="box-shadow:none; border-bottom: none;">맛있어요(0)</a> |
												<a type="button" href="${pageContext.request.contextPath}/restaurantList/${resNo}?currentPage=1&sort=2" style="box-shadow:none; border-bottom: none;">괜찮아요(0)</a> |
												<a type="button" href="${pageContext.request.contextPath}/restaurantList/${resNo}?currentPage=1&sort=3" style="box-shadow:none; border-bottom: none;">별로예요(0)</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/restaurantList/${resNo}?currentPage=1&sort=0" style="border-bottom: none;">전체(${ s0 })</a> |
												<a type="button" href="${pageContext.request.contextPath}/restaurantList/${resNo}?currentPage=1&sort=1" style="box-shadow:none; border-bottom: none;">맛있어요(${ s1 })</a> |
												<a type="button" href="${pageContext.request.contextPath}/restaurantList/${resNo}?currentPage=1&sort=2" style="box-shadow:none; border-bottom: none;">괜찮아요(${ s2 })</a> |
												<a type="button" href="${pageContext.request.contextPath}/restaurantList/${resNo}?currentPage=1&sort=3" style="box-shadow:none; border-bottom: none;">별로예요(${ s3 })</a>
											</c:otherwise>
										</c:choose>
									</th>
									<!-- 로그인 한 사용자에게만 보이게 -->
									<th style="text-align: right;" data-aos="fade-up">
										<% if(loginUser != null) { %>
											<button type="button" id="<%= loginUser.getMemberNo() %>" onclick="writeValue(this.id)" style="font-size:small;" data-bs-toggle="modal" data-bs-target="#add-new-write-modal">리뷰쓰기</button>
										<% } %>
									</th>
								</tr>
							</thead>
							<tbody id="listBody">
								<c:choose>
									<c:when test="${ empty reviewList }">
										<tr>
											<td colspan="3" align="center">
													아직 작성된 리뷰가 없습니다.
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="review" items="${ reviewList }">
											<tr data-aos="fade-up">
												<td rowspan="2" style="width: 15%; text-align: center;">${ review.memberNickname }</td>
												<td style="width: 65%;">
													<fmt:formatDate value="${ review.uploadDate }" pattern="yyyy-MM-dd" /><br>
													<pre>${ review.reviewContent }</pre>
												</td>
												<td style="width: 20%; text-align: center; vertical-align:middle;">
													<!-- 리뷰평가 값에 따라 다른 아이콘 -->
													<c:choose>
														<c:when test="${ review.reviewRate == 1 }">
															<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16" style="color:hotpink;">
																<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																<path d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"/>
															</svg>
															<br>맛있어요
														</c:when>
														<c:when test="${ review.reviewRate == 2 }">
															<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-neutral" viewBox="0 0 16 16" style="color:orange;">
																<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
															</svg>
															<br>괜찮아요
														</c:when>
														<c:when test="${ review.reviewRate == 3 }">
															<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16" style="color:red;">
																<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																<path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
															</svg>
															<br>별로예요
														</c:when>
													</c:choose>
												</td>
											</tr>
											<tr data-aos="fade-up">
												<td>
													<!-- 리뷰 이미지 -->
													<c:forEach var="att" items="${ attReview }">
														<c:if test="${ att.reviewNo == review.reviewNo }">
															<a style="border-bottom: none !important;" data-bs-toggle="modal" data-bs-target="#add-new-img-modal">
																<img src="../resources/upfiles/${ att.changeName }" width="200px" height="130px">
															</a>
														</c:if>
													</c:forEach>
												</td>
												<td align="center" data-aos="fade-up">
													<% if(loginUser != null) { %>
														<c:set var="loginNick" value="<%= loginUser.getMemberNickname() %>" />
														<c:choose>
															<c:when test="${ loginNick eq review.memberNickname }">
																<button type="button" id="${ review.reviewNo }" onclick="modifyValue(this.id)" style="box-shadow:none; " data-bs-toggle="modal" data-bs-target="#add-new-modify-modal"> 
																	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
																	   <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
																	   <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
																	</svg>
																</button> | 
																<button type="button" id="${ review.reviewNo }" onclick="deleteValue(this.id)" style="box-shadow:none; " data-bs-toggle="modal" data-bs-target="#add-new-delete-modal"> 
																	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
																	  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
																	  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
																	</svg>
																</button>
															</c:when>
															<c:otherwise>
																<button type="button" id="${ review.reviewNo }" onclick="warnValue(this.id)" style="box-shadow:none;" data-bs-toggle="modal" data-bs-target="#add-new-warn-modal">
																	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
																		<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
																		<path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
																	</svg>
																</button>
															</c:otherwise>
														</c:choose>
													<% } %>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
							<tfoot>
								<!-- 페이징 처리 -->
								<tr align="center"data-aos="fade-up">
									<td colspan="5" >
										<div>          
									        <c:if test="${currentPage != 1}">
									           <a style="border-bottom: none !important;" class="btn" href="${pageContext.request.contextPath}/restaurantList/${ res.resNo }?currentPage=${currentPage - 1}&sort=${sort}">&lt;</a>
									        </c:if>
									        <c:forEach begin="${startPage }" end="${endPage}" var="p">
									           <c:choose>
									              <c:when test="${p == currentPage}">
									                 <b>${p}</b>
									              </c:when>
									              <c:when test="${p != currentPage }">
									                 <a style="border-bottom: none !important;" class="btn" href="${pageContext.request.contextPath}/restaurantList/${ res.resNo }?currentPage=${p}&sort=${sort}">&nbsp;&nbsp;${p}&nbsp;&nbsp;</a>
									              </c:when>
									           </c:choose>
									        </c:forEach>
									        <c:if test="${currentPage != maxPage}">
									           <a style="border-bottom: none !important;" class="btn" href="${pageContext.request.contextPath}/restaurantList/${ res.resNo }?currentPage=${currentPage +1}&sort=${sort}">&gt;</a>
									        </c:if>
									     </div> 
								     </td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
			</div>

		<!-- Footer 
		<footer id="footer">
			<div class="inner">
				<ul class="copyright">
					<li>&copy; Untitled. All rights reserved</li>
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</footer>
		-->
	</div>
	
	<!-- 글작성 모달 -->
	<div class="modal fade task-modal-content" id="add-new-write-modal" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<div class="w3-content" style="max-width:800px; position:relative">
						<form action="${pageContext.request.contextPath}/writeReview" method="post" enctype="multipart/form-data">
							<div style="margin: auto; margin-top: 10%; width: 80%;">
								<h2 style="color: rgb(255, 0, 106);">리뷰쓰기</h2>								
									<input type="radio" name="reviewRate" value="1" id="good" checked>
									<label for="good" class="radio-img">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16" style="color:hotpink;">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											<path d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"/>
										</svg>
										맛있어요 &nbsp;&nbsp; 
									</label>					
									<input type="radio" name="reviewRate" value="2" id="soso">
									<label for="soso" class="radio-img">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-emoji-neutral" viewBox="0 0 16 16" style="color:orange;">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
										</svg>
										괜찮아요 &nbsp;&nbsp; 
									</label>									
									<input type="radio" name="reviewRate" value="3" id="bad">
									<label for="bad" class="radio-img">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16" style="color:red;">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											<path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
										</svg>
										별로예요
									</label> 
								<textarea name="reviewContent" cols="30" rows="10" style="resize: none; overflow-y: scroll; max-width: 100%; max-height: 50px;" placeholder="맛있게 드셨나요? &nbsp; 솔직한 리뷰를 남겨주세요" required></textarea> <br>								
								<input type="file" name="upfile" multiple accept=".jpg, .png, .gif" required>
								<p style="font-size:small;">* 파일은 최대 3개까지 첨부 가능합니다.</p>
								<div style="text-align: right;">
									<% if(loginUser != null) { %>
										<input type="hidden" value="<%= loginUser.getMemberNo() %>" name="memberNo">
									<% } %>
									<input type="hidden" value="${ res.resNo }" name="resNo">
									<button type="submit" style="font-size:small;">작성</button>
									<button type="reset" style="font-size:small;">초기화</button>
								</div>	
							</div>
						</form>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- 글수정 모달 -->
	<div class="modal fade task-modal-content" id="add-new-modify-modal" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<div class="w3-content" style="max-width:800px; position:relative">
						<form action="${pageContext.request.contextPath}/modifyReview" method="post" enctype="multipart/form-data">
							<div style="margin: auto; margin-top: 10%; width: 80%;">
								<h2 style="color: rgb(255, 0, 106);">리뷰수정</h2>								
									<input type="radio" name="reviewRateModify" value="1" id="good1" checked>
									<label for="good1" class="radio-img">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16" style="color:hotpink;">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											<path d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"/>
										</svg>
										맛있어요 &nbsp;&nbsp; 
									</label>					
									<input type="radio" name="reviewRateModify" value="2" id="soso1">
									<label for="soso1" class="radio-img">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-emoji-neutral" viewBox="0 0 16 16" style="color:orange;">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
										</svg>
										괜찮아요 &nbsp;&nbsp; 
									</label>									
									<input type="radio" name="reviewRateModify" value="3" id="bad1">
									<label for="bad1" class="radio-img">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16" style="color:red;">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											<path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
										</svg>
										별로예요
									</label>
								<textarea name="reviewContent" cols="30" rows="10" style="resize: none; overflow-y: scroll; max-width: 100%; max-height: 50px;" placeholder="맛있게 드셨나요? &nbsp; 솔직한 리뷰를 남겨주세요" required></textarea> <br>
								<input type="file" name="upfile" multiple accept=".jpg, .png, .gif" required>
								<p style="font-size:small;">* 파일은 최대 3개까지 첨부 가능합니다.</p>
								<div style="text-align: right;">
									<input type="hidden" id="reviewHNo1" name="reviewHNo1">
									<input type="hidden" value="${ res.resNo }" name="resNo">
									<button type="submit" style="font-size:small;">수정</button>
									<button type="reset" style="font-size:small;">초기화</button>
								</div>	
							</div>
						</form>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- 삭제 모달 -->
	<div class="modal fade task-modal-content" id="add-new-delete-modal" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/deleteReview" method="post" enctype="multipart/form-data">					
					<div style="margin: auto; margin-top: 50px; width: 70%;">
						<h3 style="color: rgb(255, 0, 106);">삭제하기</h3>
<pre style="text-align:center; letter-spacing: 0px;">
리뷰 삭제 시 복구가 불가능합니다.
해당 리뷰를 삭제하시겠습니까?
</pre><hr>
					</div>
					<div align="right" style="margin: auto; width: 70%;">
						<input type="hidden" id="reviewHNo2" name="reviewHNo2">
						<input type="hidden" value="${ res.resNo }" name="resNo">
						<button type="submit" style="font-size:small;">삭제</button>
					</div>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- 신고 모달 -->
	<div class="modal fade task-modal-content" id="add-new-warn-modal" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/warnReview" method="post">
					<div style="margin: auto; margin-top: 50px; width: 70%;">
						<h3 style="color: rgb(255, 0, 106);">신고하기</h3>
						<textarea name="warnContent" cols="30" rows="10" style="resize: none; overflow-y: scroll; max-width: 400px; max-height: 50px;" placeholder="신고사유를 입력해주세요"></textarea>
						<hr>
					</div>
					<div align="right" style="margin: auto; width: 70%;">
						<input type="hidden" id="reviewHNo3" name="reviewHNo3">
						<input type="hidden" value="${ res.resNo }" name="resNo">
						<button type="submit" style="font-size:small;">신고하기</button>
					</div>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- 이미지 모달 -->
	<div class="imgModal">
	    <div class="imgModalBox">
	    	
	    </div>
	</div>
	  
	<!-- 모달 관련 스크립트 -->
	<script type="text/javascript">
		function modifyValue( id ) {
			var modifyValue = id;
			
			$("#reviewHNo1").val(modifyValue);
		}
		function deleteValue( id ) {
			var deleteValue = id;
			
			$("#reviewHNo2").val(deleteValue);
		}
		function warnValue( id ) {
			var warnVal = id;
			
			$("#reviewHNo3").val(warnVal);
		}
	</script>
	
	<!-- 이미지 관련 스크립트 -->
	<script>
		$(function(){
		    $("table img").click(function(){
		        let img = new Image();
		        img.src = $(this).attr("src")
		        $(".imgModalBox").html(img);
		        $(".imgModal").show();
		    });
		    $(".imgModal").click(function (e) {
		    $(".imgModal").toggle();
		  });
		});
	</script>
	  
<!-- Scripts -->
<script>
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length} ;
	  for (i = 0; i < x.length; i++) {
		 x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
</script>
<script>
			var slideIndex2 = 1;
			showDivs2(slideIndex2);
			
			function plusDivs2(n2) {
			  showDivs2(slideIndex2 += n2);
			}
			
			function showDivs2(n2) {
			  var i2;
			  var x2 = document.getElementsByClassName("mySlide");
			  if (n2 > x2.length) {slideIndex2 = 1}    
			  if (n2 < 1) {slideIndex2 = x2.length} ;
			  for (i2 = 0; i2 < x2.length; i2++) {
				 x2[i2].style.display = "none";  
			  }
			  x2[slideIndex2-1].style.display = "block";  
			}
</script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor.js"></script>
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a13847f8f0767319e05e937b6c2b2bf5&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${ res.resAddress }', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	            
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        console.log(coords.getLng());
	        var x = coords.getLat();
	        var y = coords.getLng();
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	        
	        var iwContent = '<div style="width:150px; text-align:center; "> ${ res.resName }  <br><a href="https://map.kakao.com/link/to/${ res.resName },' + x + ',' + y + '" style="font-size:small;" target="_blank">길찾기or로드맵</a> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	    	// 인포윈도우를 생성합니다
			    var infowindow = new kakao.maps.InfoWindow({
			        content : iwContent,
			        removable : iwRemoveable
			    });
	        
	        kakao.maps.event.addListener(marker, 'click', function() {
	            // 마커 위에 인포윈도우를 표시합니다
	            infowindow.open(map, marker); 
	            
	            
	      });
	    } 
	});
	</script>
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
		<% if(loginUser != null) { %>
		
		

		$(".heart-click").click(function() {
		
	    // 게시물 번호(no)를 idx로 전달받아 저장합니다.
	    let no = $(this).attr('idx');
	    console.log("heart-click");

	    // 빈하트를 눌렀을때
	    if($(this).children('svg').attr('class') == "bi bi-suit-heart"){
	        console.log("빈하트 클릭");

	        $.ajax({
	            url : '${ pageContext.request.contextPath }/saveHeart.do',
	            type : 'get',
	            data : {
	                no : no,
	                memberNo : <%= loginUser.getMemberNo() %>
	               
	            },
	            success : function(pto) {
	                //페이지 새로고침
	                //document.location.reload(true);

	
	                console.log("하트추가 성공");
	            },
	            error : function(pto) {
	                alert('서버 에러');
	            }
	        });
	        console.log("꽉찬하트로 바껴라!");

	        // 꽉찬하트로 바꾸기
	        $(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='22' height='22' fill='currentColor' class='bi bi-suit-heart-fill' viewBox='0 0 16 16'><path d='M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z'/></svg>");
	
	    // 꽉찬 하트를 눌렀을 때
	    }else if($(this).children('svg').attr('class') == "bi bi-suit-heart-fill"){
	        console.log("꽉찬하트 클릭");

	        $.ajax({
	            url : '${ pageContext.request.contextPath }/removeHeart.do',
	            type : 'get',
	            data : {
	                no : no,
	                memberNo : <%= loginUser.getMemberNo() %>
	                
	            },
	            success : function(pto) {
	                //페이지 새로고침
	                //document.location.reload(true);
	                console.log("하트삭제 성공");
	            },
	            error : function(pto) {
	                alert('서버 에러');
	            }
	        });
	        console.log("빈하트로 바껴라!");

	        // 빈하트로 바꾸기
	        $(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16"><path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" /></svg>');

	        
	    }



	});	
		
			
		<% } %>
	
	
	</script>
	 <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
			 	<script>
            AOS.init();
        </script>

</body>
</html>