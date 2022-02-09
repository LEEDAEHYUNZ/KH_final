<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>:D plate</title>
    <meta charset="utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<style>
	.dn{
        	display: none;
        }
</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<div id="wrapper">
    <header id="header">
        <div class="inner">




            <!-- Nav -->
                <nav>
                    <ul>
                        <li><a href="#menu">Menu</a></li>
                    </ul>
                </nav>

        </div>
    </header>

    <!-- Menu -->
    <nav id="menu">
        
        <h2>Menu</h2>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="generic.html">Ipsum veroeros</a></li>
            <li><a href="generic.html">Tempus etiam</a></li>
            <li><a href="generic.html">Consequat dolor</a></li>
            <li><a href="elements.html">Elements</a></li>
        </ul>
    </nav>
    </div>
    
    
    <script type="text/javascript">
    
    
    </script>
    
    
    
    <form action="signup.do" method="post">
    <div id="main">
        <div class="inner" >
            <div id="myContent" style="width: 60%;margin-left: 20%;">
               
                    <div id="myInfo">
                                        
                            <h2 id="nickName" style="color: rgb(255, 0, 106);">회원가입</h3>
                    
                    </div>
        ​
                        
                    <div class="mid">
        
                    <h4> *아이디
                        <input type="text" id="memberId" name="memberId" required>
                        <span id="result"></span>
						
                    </h4>  <br>
        
                    <h4> *패스워드
                        <input type="password" name="memberPwd" class="pw" id="password1" required>
                        <span id="pass_check" class="dn" style="color: red;">비밀번호는 숫자,영어,특수문자 포함 8~15자리를 입력해 주세요!</span>
                    </h4>
        ​             
                    <h4> *패스워드 확인
                        <input type="password" name="checkPwd" class="pw" id="password2" required>
						<span id="pass_true" class="dn" style="color: green;">비밀번호가 같습니다</span>
						<span id="pass_false" class="dn" style="color: red;">비밀번호가 다릅니다</span>
						
                    </h4><br>
    
                    <h4> *이름
                        <input type="text" name="memberName" required>
                    </h4><br>

                    <h4> *생년월일
                        <input type="date" name="birth" required>
                    </h4><br>

                    
                    <h4> *성별
                        <input type="radio" id="radioM" value="M" name="gender" checked><label for="radioM">M</label>
                        <input type="radio" id="radioF" value="F" name="gender" ><label for="radioF">F</label>
                    </h4><br>
                    

                    <h4> *별명
                        <input type="text" id="memberNickname" name="memberNickname" required style="display: inline-block; width: 400px;">
                        <span id="result2"></span>
                    </h4><br>

                    <h4> *이메일
                        <input type="text" name="memberEmail" required>
                    </h4>

                    <h4> *전화번호
                        <input type="text" name="memberPhone" required>
                    </h4>
                    
                    <button type="submit" id="signBtn" style="float: right;">가입하기</button>

                    </div>
        
                    </div>
         
        
                </div>
            

        </div>
    </form>
	    
	<script>
		$(function() {
			
			// blur : 인풋태그에서 포커스를 잃었을 때 발생하는 이벤트
			$("#memberId").blur(function() {
				
				// 할일 : 이름이 DB 에 있는지 확인해서 결과를 입력창 밑에 있는 span 에 출력하기
				var memberId = $("#memberId").val();
			
				$.ajax({
					url : "${ pageContext.request.contextPath }/idCheck", 
							// 아이디 조회하는 곳 
					type : "get", 
					data : { memberId : memberId }, 
					success : function(result) {
						// 리턴되는 값을 뽑아야함
						// console.log(result);
						
						// result 에 학생정보가 들어있나 없나 판단해서
						// 들어있다면 이미 중복된 이름이므로 사용 불가 메세지를 띄우면 됨
						
						if(result == "") {
							$("#result").text("사용 가능한 아이디입니다.").css("color", "green");
						}
						else {
							$("#result").text("이미 사용중인 아이디입니다.").css("color", "red");
							
							// 재입력 유도 
							document.getElementById('memberId').value = '';
					        document.getElementById('memberId').focus();
					        
						}
						
					},
					error : function() {
						 console.log("ajax 통신 실패!");
					}
				});
				
			});
			
		});
	</script>
	
		<!-- 별명체크 -->
		<script>
		$(function() {
			
			// blur : 인풋태그에서 포커스를 잃었을 때 발생하는 이벤트
			$("#memberNickname").blur(function() {
				
				// 할일 : 이름이 DB 에 있는지 확인해서 결과를 입력창 밑에 있는 span 에 출력하기
				var memberNickname = $("#memberNickname").val();
			
				$.ajax({
					url : "${ pageContext.request.contextPath }/nickCheck", 
							// 별명 조회하는 곳 
					type : "get", 
					data : { memberNickname : memberNickname }, 
					success : function(result2) {
						// 리턴되는 값을 뽑아야함
						// console.log(result2);
						
						// result 에 학생정보가 들어있나 없나 판단해서
						// 들어있다면 이미 중복된 이름이므로 사용 불가 메세지를 띄우면 됨
						
						if(result2 == "") {
							$("#result2").text("사용 가능한 별명 입니다.").css("color", "green");
						}
						else {
							$("#result2").text("이미 사용중인 별명 입니다.").css("color", "red");
							
							document.getElementById('memberNickname').value = '';
					        document.getElementById('memberNickname').focus(); 
							
							// 재입력 유도 
						}
						
					},
					error : function() {
						 console.log("ajax 통신 실패!");
					}
				});
				
			});
			
		});
	</script>
	
	<!-- 비밀번호 확인 -->
	<script>

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
	
	
	/*
	// 만들어놓고 호출을 안함!!!!!!!!!!!
  	function validate(){ // submit 버튼의 기본이벤트 => 서버로 전송 / 기본이벤트 실행 전에 다른 이벤트를 걸고싶을때 쓸려고 만든용도 return 메소드명();
  		
	  	  	
	    // 3) 비밀번호 일치하지 않을경우
	    if(password1 != password2){
	
	        alert('동일한 비밀번호를 입력하세요')
	
	        // 재입력유도
	        document.getElementById('password2').value = '';
	        document.getElementById('password2').focus();
	        
	        return false;
	    }
	    return true;
  	}
	*/
	
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
            <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>