<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
            height: 70%;
            width: 80%;
            top: 80%;
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
            right: 7%;
            height: 500px;
            
        }

        #myTitle {
            position: relative;
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
        #QnaWrite{
            height: 500px;
            font-weight: 900;
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
        <div class="mid">

            <div id="myContent">
		<form method="post" action="${pageContext.request.contextPath}/qnaWrite">
              
               <input name="memberNo" type="hidden" value="<%= loginUser.getMemberNo() %>"> 
                <h2 id="myTitle">문의 하기</h2>
                <hr style="color: black;">
                    <br>
                <div id="QnaWrite">
                    제목
                    <input name="qnaTitle" type="text" placeholder="제목을 입력해주세요." required><br>
               
                    문의 내용 <br>
                    <textarea name="qnaContent" id="" cols="20" rows="5" style="border: 1px solid; resize: none;" required></textarea>

                    <input type="submit" style="position: absolute; left: 88%; bottom: 0%" >
                    
                </div>
         
		</form>
                

                
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