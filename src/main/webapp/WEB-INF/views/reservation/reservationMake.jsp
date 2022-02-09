<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <style>
         .area {
          border : 1px solid rgb(0, 0, 0);
          width : 500px;
          height : 200px;
        }
        .test_obj input[type="radio"] {
            display: none;
        }
        .test_obj input[type="radio"] + span {
            display: inline-block;
            padding: 10px 25px ;
            border: 2px solid #414040;
            background-color: #FFFFFF;
            text-align: center;
            cursor: pointer;
            border-radius: 4px;
            font-weight:lighter;
            font-size: 0.95em;
        }
        .test_obj input[type="radio"]:checked + span {
            border: 2px solid #F2849E;
            color: #F2849E;
        }
    </style>
</head>
<body class="is-preload">
	
	
    <div id="wrapper">
        <%@ include file="../common/menubar.jsp" %>
        
        

        
    <!-- 예약 -->
    <form action="${pageContext.request.contextPath}/make" method="post">
         <div style="width: 60%; margin: auto; border: none;">
        <h2 style="color: rgb(255, 0, 106);">예약</h2>
		<input type ="hidden" value="${ res.resNo }" name="resNo">
		<% if(loginUser != null) { %>
        <input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
   		 <% } %>
	 	<input type="hidden" name="memberNo" value="1">
        <h3>${ res.resName }</h3>
        <hr>
        <b>예약 날짜</b> <br><br> <input type="text" name="reVisitdate" id="dateIn" placeholder="클릭해주세요. 당일 예약은 전화로 확인해 주세요."> <br>

         <b>예약 시간</b> <br><br>
    	    오전 <br>
        <label class="test_obj" style="display: inline-block;">
            <input type="radio" id="radio1" name="reTime" value="10:00">
            <span>1 0  :  0 0</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio"  id="radio2" name="reTime" value="11:00">
            <span>1 1  :  0 0</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio"  id="radio3" name="reTime" value="12:00">
            <span>1 2  :  0 0</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio"  id="radio4" name="reTime" value="13:00">
            <span>1 3  :  0 0</span>
        </label>
        <br><br>
      	  오후<br>
        <label class="test_obj" style="display: inline-block;">
            <input type="radio" id="radio5" name="reTime" value="15:00">
            <span>1 5  :  00</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio" id="radio6" name="reTime" value="16:00">
            <span>1 6  :  0 0</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio" id="radio7" name="reTime" value="17:00">
            <span>1 7  :  0 0</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio" id="radio8" name="reTime" value="18:00">
            <span>1 8  :  0 0</span>
        </label>
        <hr>
        <b>인원수</b> <br><br>
        <label class="test_obj" onclick="obj_click" style="display: inline-block;">
            <input type="radio" id="radio11" name="reStatus" value="1">
            <span>1 명</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio" id="radio12" name="reStatus" value="2">
            <span>2 명</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio" id="radio13" name="reStatus" value="3">
            <span>3 명</span>
        </label>
        <label class="test_obj"  style="display: inline-block;">
            <input type="radio" id="radio14" name="reStatus" value="4">
            <span>4 명</span>
        </label>
        <hr>
        <b>요청사항</b> <br><br> <input type="text" name="reRequest" placeholder="20자 이내로 입력해주세요."><br>
        <b>예약자 정보</b> <br><br>
        <div class="input-box">
            <span class="details"><b>예약자</b></span><br>
            <input type="text" name="reName" placeholder="이름"  required>
          </div>
          <br>
          <div class="input-box">
            <span class="details"><b>연락처</b></span><br>
            <input type="text" name="rePhone" placeholder="010-XXXX-XXXX" required>
          </div>
        <!--
        <b>판매자 정보</b> <br><br>
        <div class="input-box">
            <span class="details">상호</span>
            <input type="text" name="" placeholder="admin" required>
          </div>
          <br>
          <div class="input-box">
            <span class="details">대표자명</span>
            <input type="text" name="" placeholder="name" required>
          </div>
          <br>
          <div class="input-box">
            <span class="details">소재지</span>
            <input type="text" name="" placeholder="admin" required>
          </div>
          <br>
          <div class="input-box">
            <span class="details">연락처</span>
            <input type="text" name="" placeholder="phone" required>
          </div>
-->
         <br>
          <div style="text-align: right;">
             <button type="submit" style=" width: 100%; height:60px;">예약하기</button>
          </div>
        </div>
    </form>
    <!-- 달력 선택 -->
      <script>
        $(dateIn).datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 1,
        maxDate: 7 // 일주일단위로 예약 가능
        });
      </script>
      <!--
   		<script>
		   function() {
		     var inputValue = $("input[name='reVisitDate']:checked").val();
		     alert(inputValue);
		});
		
		</script>
-->
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
		
     <!-- 메뉴바 -->
        <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>