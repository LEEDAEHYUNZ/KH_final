<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- modal -->
			

				<!-- 로그인 -->
				<div class="modal fade task-modal-content" id="add-new-task-modal-login" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true" style="z-index:1000000">
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<div class="modal-content" style="height: 350px; width: 40%; margin-left: 31%;" >
							<div class="modal-header">
								<h4 class="modal-title" id="NewTaskModalLabel" style="margin-left:38%;">LOGIN</h4>
								<!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
							</div>
							<div class="modal-body" style="text-align:center;">
								<form class="p-2" action="${pageContext.request.contextPath}/login.do" method="post">
									<div class="row" style="margin:auto; margin-left:-5%;">
										<div class="idForm" style="text-align:center;">
											<input type="text" class="idform" name="memberId" placeholder="ID" required>
										</div>
										<div class="passForm" style="text-align:center;">
											<input type="password" class="pwd" name="memberPwd" placeholder="PW" required>
										</div>
										<br>
										
										<br>  

									</div>
									
									<div class="text-end" style="margin-top: 25%; margin-left: 0%;">
										<button type="submit" style="width: 80%; height: 40px; font-size: 13px;" class="btn">로그인</button>
									</div>
								</form>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				  </div><!-- /.modal -->
				  
				  <!-- 아이디 찾기 -->
				 <div class="modal fade task-modal-content" id="add-new-task-modal-id" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<div class="modal-content" style="height: 510px; width: 45%; margin-left: 31%;">
							<div class="modal-body" style="width:100%;">
				                         <form action="findid.do" method="post">
				                         <div id="pop">
				                             <div>
				                                   <h3 id="title" style="text-align: center;margin: 5%; margin-top: 35px;">아이디를 잊으셨나요?</h3>
				                                   <input type="text" name="memberName" placeholder="이름을 입력해 주세요" style="margin-top: 40px; width:100%">
				                                   <input type="email" name="memberEmail" placeholder="이메일을 입력해 주세요" style="margin-top: 40px;">                                  
				                                   
				
				                                   <button type="submit" id="findIdBtn" style="margin: 27%; font-size: 14px; width:150px; height:50px;">아이디 찾기</button>  
												</div>
				                            </div>
				                         </form>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				  </div><!-- /.modal -->
				  

			   <!-- 비밀번호 찾기 -->
			  <div class="modal fade task-modal-content" id="add-new-task-modal-pwd" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content" style="height: 550px; width: 45%; margin-left: 31%;" >
						<div class="modal-body" style="width:100%;">
						<form action="sendpw.do" method="post">
			                         <div id="pop">
			                             <div >
			                                   <h3 id="title" style="text-align: center; margin-top: 35px;">비밀번호를 잊으셨나요?</h3>
			                                   <input type="text" id="mail" name="memberId" placeholder="아이디를 입력해주세요" style="margin-top: 40px;">
			                                   <input type="email" id="mail" name="memberEmail" placeholder="이메일을 입력해주세요" style="margin-top: 40px;"> <br>
			                                   
			                                   
			                                   <button type="submit" id="send" style="margin: 27%; font-size: 14px; width:150px; height:50px;" >비밀번호 찾기</button>  

			                            </div>
			                         </div>
			                      </form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			  </div><!-- /.modal -->
			  
			<!-- 개인정보 수정 확인 모달창  -->
			<form action="password" method="post">
              <div class="modal fade task-modal-content" id="add-new-taekyoung-modal" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered modal-lg" style="width: 500px;">
	                <div class="modal-content" style="height: 280px;" >
	                    <p style="position: relative; text-align: center; top: 30px;">비밀번호 확인</p>
	                    <br><br>
	                    <% if( loginUser == null) { %>
	                    	<input type="hidden">
	                    <% } else { %>
	                    	<input type="hidden" name="memberPwd" value="<%= loginUser.getMemberPwd() %>" >
	                    <% } %>
	                    <input name="vertifyPwd" type="password" placeholder="비밀번호를 입력해주세요." style="width: 95%; height: 30px; position: relative; left: 10px;">
	                    <input type="submit" value="확인" style="width: 80px; height: 40px; font-size: small; position: relative; bottom: -30px; left: 400px;">
	                </div><!-- /.modal-content -->
	            </div><!-- /.modal-dialog -->
	          </div><!-- /.modal -->
         </form>
			  
</body>
</html>