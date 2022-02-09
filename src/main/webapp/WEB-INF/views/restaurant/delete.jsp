<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="is-preload">
    <div id="wrapper">
    
    <%@ include file="../common/menubar.jsp" %>
    
    <!-- 식당삭제 -->
    <div style="width: 60%; margin: auto; border: none">
    <form method="post" action="${pageContext.request.contextPath}/delete.do" enctype="multipart/form-data">
    <h2 style="color: rgb(255, 0, 106);">음 식 점 삭 제</h2> <br>
    <input type ="hidden" value="${ res.resNo }" name="resNo">
   <% if(loginUser != null) { %>
      <input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
    <% } %>
      * 상 호 명 <input type="text" name="resName"  value="${ res.resName }" required readonly> <br>  
     * 종 류 <select name="category" id="kind" disabled>
             <option value="ko">한식</option>
             <option value="ch">중식</option>
             <option value="ja">일식</option>
             <option value="ya">양식</option>
             <option value="ca">카페</option> 
             <option value="so">술집</option>
         </select> <br> 
     * 전화 번호 <input type="text" name="resPhone" value="${ res.resPhone }"required readonly> <br>
     * 주 소  &emsp; <button>간편주소</button> <input type="text" name="resAddress" value="${res.resAddress }"required readonly> <br> 
     * 대표 메뉴 <input type="text" name="resBest" value="${ res.resBest }" readonly> <br>
     * 상세 내용 <textarea placeholder="운영시간 및 공지사항" name="resContent" readonly>${ res.resContent } </textarea> <br>
      
    <div style="text-align: right;" >
       <button type="submit">삭제</button> 
    </div>
    </form>
   </div>

   </div>
     <script>
   //간편주소 찾기 눌렀을때 실행 // 다음주소API
      function serchPostClicked(){
          new daum.Postcode({
              oncomplete: function(data) {
                 
                   var addr='';
                   
                   if(data.userSelectedType ==='R'){
                      addr=data.roadAddress;
                   }
                   else{
                      addr=data.jibunAddress;
                   }
                   document.getElementById('resAddress').value=addr;
                   document.getElementById('resAddress').focus();
              }
           }).open();
          $("#enroll-form button[type=submit]").removeAttr("disabled");
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
      var k = '${ res.category }'
      $("#kind").val(k).attr("selected", "selected");   
      </script>
      
     <!-- 메뉴바 -->
      <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>