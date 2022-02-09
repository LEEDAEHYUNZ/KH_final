<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
        <link href="${pageContext.request.contextPath}/resources/assets/css/app.css" rel="stylesheet" type="text/css" id="light-style" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		
        <style>
        .wrap {
            width: 100%;
            height: 100%;
        }

        .mid{
            position: absolute;
            height: 90%;
            width: 80%;
            top: 90%;
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
        #updateInfo{
            margin: 25px;
            
        }
        #updateInfo>p {
            color: fuchsia;
            font-weight: 600;
        }
        .dn{
        	display: none;
        }
       

        </style>
</head>
<body class="is-preload">
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
        <div class="mid">

            <div id="myContent">

                <h2 id="myTitle">개인정보 수정</h2>
               
                <div id="updateInfo">
               
               <form action="modify" method="post">
                 <input type="hidden" name="memberId" value="<%= loginUser.getMemberId() %>">
               <h4> 닉네임 <br><br> 
               <input type="text" id="memberNickname" name="memberNickname" value="<%= loginUser.getMemberNickname() %>" style="height: 30px;" required>
               <span id="result2"></span>
              
               </h4>
                
                     
               <h4> 패스워드 
               <input type="password" name="memberPwd" id="password1" value="<%= loginUser.getMemberPwd() %>" style="height: 30px;" id="password1" required>
               <span id="pass_check" class="dn" style="color: red;">비밀번호는 숫자,영어,특수문자 포함 8~15자리를 입력해 주세요!</span>
               </h4>

                    
               <h4> 패스워드 확인 
                   <input type="password" style="height: 30px;" id="password2" required>
   					 <span id="pass_true" class="dn" style="color:green;">비밀번호가 같습니다</span>
   					 <span id="pass_false" class="dn" style="color:red;">비밀번호가 다릅니다</span>
            
               </h4>

               <h4> 전화번호
                <input type="text" name="memberPhone" value="<%= loginUser.getMemberPhone() %>" style="height: 30px;" required>
               </h4>

               <h4> 이메일
                <input type="email" name="memberEmail" value="<%= loginUser.getMemberEmail() %>" style="height: 30px;" required>
              </h4>
	
              <input type="submit" value="수정" style="height: 40px; line-height: 50%; position: relative; left: 89%;">
             
             	</form>
             	
                </div>
   
            </div>

   		 </div>
   		 
			  <script type="text/javascript">
			  $(function() {
					
					// blur : 인풋태그에서 포커스를 잃었을 때 발생하는 이벤트
					$("#memberNickname").blur(function() {
						
						// 할일 : 이름이 DB 에 있는지 확인해서 결과를 입력창 밑에 있는 span 에 출력하기
						var memberNickname = $("#memberNickname").val();
					
						$.ajax({
							url : "${ pageContext.request.contextPath }/nickCheck1", 
									// 별명 조회하는 곳 
							type : "get", 
							data : { memberNickname : memberNickname }, 
							success : function(result2) {
								// 리턴되는 값을 뽑아야함
								  console.log(result2);
								
								// result 에 학생정보가 들어있나 없나 판단해서
								// 들어있다면 이미 중복된 이름이므로 사용 불가 메세지를 띄우면 됨
								
								if(result2 == "") {
									$("#result2").text("사용 가능한 별명 입니다.").css("color", "green");
								}
								else {
									$("#result2").text("이미 사용중인 별명 입니다.").css("color", "red");
									
									document.getElementById('memberNickname').value = '';
							        document.getElementById('memberNickname').focus();
								}
								
							},
							error : function() {
								 console.log("ajax 통신 실패!");
							}
						});
						
					});
					
				});
			    
			 	</script>
			 	
			 	<!-- 비번 확인 -->
			 	<script type="text/javascript">
		
			 	$("#password1, #password2").on("change", function() {
				    $('#pass_false').addClass( 'dn' ); /*실행하면 텍스트 없앰*/
				    $('#pass_true').addClass( 'dn' );
				    $('#pass_check').addClass( 'dn' );
				   
				    var password = $('#password1').val(); /* 패스워드와 패스워드 확인 부분 가져오기 */
				    var passwordcheck = $('#password2').val();
				   
				    regExp = /^[a-z\d!@#%^*]{8,15}$/i;
				  
				   
				    if(!regExp.test(password)){
						// alert('유효한 비밀번호를 입력해주세요');
						$('#pass_check').removeClass( 'dn' );
				        // 재입력유도
				        document.getElementById('password1').value = '';
				        document.getElementById('password1').focus(); // 깜빡깜빡
				       
				        return false;
				    }
				   
				    else {
				    	
				    	if(password == passwordcheck) {
					    	
					    	$('#pass_true').removeClass( 'dn' ); /*텍스트 보여줌*/
					        return;
					    }else {
					    	$('#pass_false').removeClass( 'dn' );
					    	
					    	document.getElementById('password2').value = '';
					        document.getElementById('password2').focus();
					        pass_check = false;
					    }
				    }
				   
				   
				});
			 	
			 	</script>
			 	

            <script src="${pageContext.request.contextPath}/resources/vendor.js"></script>
            <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
            <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>
</html>