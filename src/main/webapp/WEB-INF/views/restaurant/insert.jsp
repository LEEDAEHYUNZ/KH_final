<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>:Dplate</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음주소API -->
</head>
<body class="is-preload">
    <div id="wrapper">
    
    <%@ include file="../common/menubar.jsp" %>
    
    <!-- 식당등록 -->
    <div style="width: 60%; margin: auto; border: none; ">
    <form method="post" action="insert.do" enctype="multipart/form-data">
    <h2 style="color: rgb(255, 0, 106);">음 식 점 등 록</h2> <br>
    <input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
	* 상 호 명 <input type="text" name="resName" required> <br>  
    * 종 류 <select name="category">
	          <option value="ko">한식</option>
	          <option value="ch">중식</option>
	          <option value="ja">일식</option>
	          <option value="ya">양식</option>
	          <option value="ca">카페</option>
	          <option value="so">술집</option>
	      </select> <br> 
     * 전화 번호 <input type="text" name="resPhone" required> <br>
     * 주 소  &emsp; <button onclick="serchPostClicked();">간편주소</button> <input type="text" name="resAddress" id="resAddress" required> <br> 
     * 대표 메뉴 <input type="text" name="resBest" placeholder="대표메뉴"> <br>
     * 상세 내용 <textarea placeholder="운영시간 및 공지사항" name="resContent"></textarea> <br>
     * 사 진 <br><input type="file" name="upfile" multiple accept=".jpg, .png, .gif"> <br><br>
     
     <div style="text-align: right;" >
         <button type="submit">등록</button>
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
     <!-- 메뉴바 -->
		<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>