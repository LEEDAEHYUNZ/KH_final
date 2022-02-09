<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
    	<script src="jquery-3.5.1.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
            height: 70%;
            width: 80%;
            top: 80%;
            left: 65%;
            transform: translate(-75%, -75%);
            z-index: 1;
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
            top: 10px;
            font-size: 20px;
        }
        
        #updateInfo>p {
            color: fuchsia;
            font-weight: 600;
        }
        .QNA {
            border: solid 1px;
            border-radius: 12px;
            text-indent: 20px;
            margin: 20px;
            padding: 12px 0;
        }

        #Qinsert{
            position: relative;
            left: 91%;
            width: 90px;
            font-size: 10px;
            top: -60px;
        }
        
        thead>tr>th {
            padding-top: 15px;
            height: 40px;
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
        <div class="mid" style="width:100%; margin-left:2%;">

            <div id="myContent">
            
                <h2 id="myTitle" style="margin-left:-2%;">내가 문의한 내역</h2>
                    
                <input id="Qinsert" type="button" style="margin-left:2%;"value="문의하기">
            
            <!-- 보이는 컨텐트 -->
            <!-- 문의 타이틀 -->
		<table name="value" class="table-bordered" >
            <thead class="thead-dark">
               <tr style="text-align: center;">
                  <th style="text-align: center;">문의번호</th>
                  <th style="text-align: center;">등록일</th>
                  <th style="text-align: center;">제목</th>
                  <th style="text-align: center;">답변상태</th>

               </tr>
            </thead>
            <!-- 답변 내용들 리스트 -->
           <tbody>
               <c:choose>
                  <c:when test="${empty list}">
                     <tr>
                        <td colspan="5">조회된 결과가 없습니다.</td>
                     </tr>
                  </c:when>
                  <c:otherwise>
			             	<c:forEach var="q" items="${ list }">
			                       <tr>
			                          <input type="hidden" value="${q.qnaStatus}">
			                          <input type="hidden" value="${q.qnaContent}">
			                          <input type="hidden" value="${q.qnaAnswer}">
			                          <td style="text-align: center;">${q.qnaNo}</td>
			                          <td style="text-align: center;"><fmt:formatDate value="${q.qnaDate}" pattern="yy-MM-dd HH:mm" /></td>
			                          <td style="text-align: center;">${q.qnaTitle}</td>
			                          
			                          <!-- 만약 답변이 N이면 미완 나머지 완료  -->
			                          <c:choose>
			                             <c:when test="${q.qnaStatus eq 'N'}">
			                                <td style="text-align: center; ">답변대기
			                                <button style="width: 100px; height: 30px; line-height: 50%; margin:10px; " class="updateQna" data-toggle="modal" data-target="#updateModal">수정</button>
			                                <button style="width: 100px; height: 30px; line-height: 50%; margin:10px; " class="deleteQna">삭제</button></td>
			                             </c:when>
			                             <c:otherwise>
			                                <td style="text-align: center; ">답변완료
			                                 <button class="showAnswer"
			                                      	 data-toggle="modal" data-target="#answer"
			                                      	 style="width: 150px; height: 30px; line-height: 50%; margin:10px;">답변보기
			                                 </button></td>
			                             </c:otherwise>
			                          </c:choose>
			                       </tr>
		                     </c:forEach>
		                  </c:otherwise>
		               </c:choose>
		            </tbody>
		         </table>
		         		    <div style="margin-left:45%;" >   
               
               <c:if test="${currentPage != 1}">
                  <a  class="btn" href="${pageContext.request.contextPath}/qnaList?currentPage=${currentPage - 1}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/qnaList?currentPage=${p}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/qnaList?currentPage=${currentPage +1}">&gt;</a>
               </c:if>
            </div>   
               </div>   
            </div>
        </div>


		<!-- 모달창 상세보기 -->
		
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
                        <table class="table-bordered">

                           <tr>
                              <th>제목</th>
                              <td id="qnaTitle"></td>
                           </tr>
                           <tr>
                              <th>문의내용</th>
                              <td id="qnaContent"></td>
                           </tr>
                           <tr>
                              <th>답변내용</th>
                              <td><textarea id="qnaAnswer" style="resize: none;" readonly>
                              </textarea></td>
                           </tr>
                        </table>
                        
                     
                  </div>
               </div>
            </div>
         </div>
         
                  <!-- 수정 모달창 -->
         <div class="modal" id="updateModal" style="height: 1500px;">
            <div class="modal-dialog modal-lg modal-center">
               <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                     <h4 class="modal-title">수정하기</h4>
                     <button type="button" class="close" data-dismiss="modal"
                        style="width: 35px; height: 35px; padding: 8px;">&times;</button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                 	 <form method="get" action="updateQNA" name="updateQnaModal" >	
	                      <input name="qnaNo" type="hidden" value="">
	                      <input name="memberNo" type="hidden" value="<%= loginUser.getMemberNo() %>">
	                        <table class="table-bordered">
							       <tr>
		                              <th>제목</th>
		                              <td id="qT"></td>
		                           </tr>
		                           <tr>
		                              <th>문의내용</th>
		                              <td id="content"></td>
		                           </tr>


		                           <tr>
		                              <th>수정할 제목</th>
		                              <td ><input name="qnaTitle" type="text" placeholder="수정할 제목을 입력하세요." required></td>
		                           </tr>
		                           <tr>
		                              <th>수정할 문의내용</th>
		                              <td><textarea name="qnaContent" id="" cols="20" rows="5" style="border: 1px solid; resize: none;" required></textarea></td>
		                           </tr>	
		                                       
		                     </table>
	                     
	                     <br>
	                           
	                    <input type="submit" value="수정">
	                  </form>      
                     
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
   
    <!-- Qinsert 클릭시 글작성 페이지로 이동 -->
	 <script>
		$(function() {
			$("#Qinsert").click(function() {
				location.href="${pageContext.request.contextPath}/qnaWrite";
			});
		});
		
		
		// 모달 값띄우기 제이쿼리
		
        $(function() {

            $(".showAnswer").click(
                  function() {
                     
                     
                     var qnaAnswer = $(this).parent().siblings().eq(2).val();
                     var qnaTitle = $(this).parent().siblings().eq(5).text(); // text는 나타난값으로 text로 표시
                     var qnaContent = $(this).parent().siblings().eq(1).val(); // val은 숨은값으로 밸류때문에 val로 표시                                    
                     
                             
                     $("#qnaAnswer").text(qnaAnswer);
                     $("#qnaTitle").text(qnaTitle);
                     $("#qnaContent").text(qnaContent);

                  });

         });
		
		// 클릭한것의 변수 꺼내쓰는 삭제 명령어
        	$(function() {
        		$(".deleteQna").click(
        			function(){
        			var qnaNo = $(this).parent().siblings().eq(3).text();
        			location.href = "${pageContext.request.contextPath}/deleteQNA?qnaNo=" + qnaNo;
        		});
        	});
        
		
        	// 클릭한것의 변수 꺼내쓰는 수정 명령어
        	// 수정에 수정할 내용을 폼태그에 넣고
        	// 수정할 번호는 따로 스크립트 이용해서 보내서 그 번호랑 비교후 수정
        	$(function() {
        		$(".updateQna").click(
        			function(){		
        			var qnaNumber = $(this).parent().siblings().eq(3).text();
        			var qT = $(this).parent().siblings().eq(5).text(); // text는 나타난값으로 text로 표시
                    var content = $(this).parent().siblings().eq(1).val();
        			
        			document.updateQnaModal.qnaNo.value=qnaNumber;
        			$("#qT").text(qT);
        			$("#content").text(content);
        			
        		});

        	});
        </script>
        

</body>
</html>