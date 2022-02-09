<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE HTML>

<html>
	<head>
		<title>:D plate</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
		<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
		<style>
       
	   ul>li>ol  {
           display : none; /* 숨겨두기 */
       }
		
		/*
		==============================================
		slideUp
		==============================================
		*/
		
		
		
		#object{
			background-color: #fe5652;
		
			visibility: hidden;
			
			
		}
		.fadeIn{
	animation-name: fadeIn;
	-webkit-animation-name: fadeIn;	

	animation-duration: 2.3s;	
	-webkit-animation-duration: 2.3s;

	animation-timing-function: ease-in-out;	
	-webkit-animation-timing-function: ease-in-out;		

	visibility: visible !important;	
	
}

@keyframes fadeIn {
	0% {
		transform: scale(0.5);
		opacity: 0.0;		
	}
	60% {
		transform: scale(1);	
	}
	80% {
		transform: scale(1);
		opacity: 1;	
	}	
	100% {
		transform: scale(1);
		opacity: 1;	
	}		
}

@-webkit-keyframes fadeIn {
	0% {
		-webkit-transform: scale(0.5);
		opacity: 0.0;		
	}
	60% {
		-webkit-transform: scale(1);
	}
	80% {
		-webkit-transform: scale(1);
		opacity: 1;	
	}	
	100% {
		-webkit-transform: scale(1);
		opacity: 1;	
	}		
}
		</style>
	 
	</head>
	<body>
		<!-- Wrapper -->
			<%@ include file="../views/common/menubar.jsp" %>
			<%@ include file="../views/common/modal.jsp" %>
		<div id="wrapper" >
				
			
					

					<div id="main">
						<div class="inner">
							<header>
								<form action="mainKeyword" method="GET">
									<select name="option" style="float:right; width:7%; font-size:small; text-align:center; ">
										<option value="0">이름</option>
										<option value="1">위치</option>
									  </select>
									<div class="mx-auto mt-5 search-bar input-group mb-3">
									  <input name="keyword" id="maindata" type="text" class="form-control rounded-pill" placeholder="맛집 검색" aria-label="Recipient's username" aria-describedby="button-addon2">
									  <div class="input-group-append">
									 
									</div>
								  </div>
								  
								</form>
							</header>
							<div style="text-align: right; margin-top:-4%;">
								</div>
							<section class="tiles" style="margin-top: -3%; ">
								
								
								<c:forEach var='i' items="${ main }"  >
									<c:if test="${ i.resStatus == 2 or i.resStatus == 3}">	
									<article class="fadeIn" id="object" style="border-radius: 3%;"data-aos="fade-up">
										<span class="image" style="border-radius: 3%;">
										
												<img src="resources/images/${ i.imgName }" alt="" />
										
										</span>
										<a href="${pageContext.request.contextPath}/restaurantList/${ i.resNo }">
											<h2> ${ i.resName } </h2>
											<div class="content">
												<p> ${ i.resAddress }</p>
												${ i.resBest }
											</div>
										</a>
									</article>
									</c:if>
								 </c:forEach>
									
	
								
							</section>
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design:HTML5 UP</li>
							</ul>
						</div>
					</footer>

			</div>

	
			
		<!-- Scripts -->
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
			$(window).scroll(function() {
				$('#animatedElement').each(function(){
				var imagePos = $(this).offset().top;
		
				var topOfWindow = $(window).scrollTop();
					if (imagePos < topOfWindow+400) {
						$(this).addClass("fadeIn");
					}
				});
			});
		</script>
	
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
			 <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
			 	<script>
            AOS.init();
        </script>
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/assets/js/vendor.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	</body>
</html>
