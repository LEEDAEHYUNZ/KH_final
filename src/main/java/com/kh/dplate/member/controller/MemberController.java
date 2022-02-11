package com.kh.dplate.member.controller;



import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dplate.member.model.service.MemberService;
import com.kh.dplate.member.model.vo.Member;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
    private JavaMailSender mailSender;
	

	// 로그인 요청이 들어왔을 때 처리해주는 메소드
			@PostMapping("/login.do")
			public String login(Model model,
					@ModelAttribute Member member, 
					HttpSession session) {
				
				Member loginUser = memberService.login(member);
			
				
				// 결과에 따른 응답뷰 지정
				if(loginUser == null) { // 로그인 실패
					// 실패시 알람메세지
					session.setAttribute("alertMsg", "아이디 비밀번호를 확인하시고 다시 로그인 해주세요.");
				}
					else if (loginUser.getMemberStatus().equals("0")){
						session.setAttribute("alertMsg", "제재된 사용자입니다 전화로 문의 바랍니다.");
					}	
				
				else { // 로그인 성공
					// session 에 성공메세지
					session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
					
					// session 에 로그인한 회원의 정보 담기
					session.setAttribute("loginUser", loginUser);
					model.addAttribute("loginUser", (Member)session.getAttribute("loginUser"));

				}
				
				// 성공이든 실패든 메인화면으로 redirect
				return "redirect:mainList.do";
				
			}
			
			// 로그아웃 처리를 해주는 메소드
			@GetMapping("/logout.do")
			public String logout(HttpSession session) {

				session.removeAttribute("loginUser");
				
				// 로그아웃되었습니다. 알람메세지도 같이 띄우기
				session.setAttribute("alertMsg", "로그아웃 되었습니다.");
				// 이미 무효화가 된 세션에 수하물을 실어버림 => 오류
				// 오류 해결방법 : invalidate 쓰고 알람메세지 띄우는걸 포기하던가
				//			   removeAttribute 를 이용하고 알람메세지를 살리던가
				
				return "redirect:mainList.do";
			}
			
			
			// 회원가입 폼 띄워주기
			@GetMapping("/signup.do")
			public String signUp() {
				return "member/signUp";
			}
		

			
			// 아이디 중복 체크
			@ResponseBody
			@RequestMapping("/idCheck")
			public int idChk(
					@RequestParam String memberId){
				int result = memberService.idCheck(memberId);
				return result;
			}
			
			// 닉네임 체크
			@ResponseBody
			@RequestMapping("/nickCheck")
			public int nickChk(
					@RequestParam String memberNickname){
				int result2 = memberService.nickCheck(memberNickname);
				return result2;
			}
			
			
			// 회원가입
			@PostMapping("/signup.do")
			public String signUp(@ModelAttribute Member m,HttpSession session) {
				
				int result = memberService.signUp(m);
				
				// 결과에 따른 응답뷰 지정
				if(result > 0) { // 회원 성공
					// 실패시 알람메세지
					session.setAttribute("alertMsg", ":D Plate의 오신걸 환영합니다.");
					return "redirect:mainList.do";
			
				}
				else { // 실패
					session.setAttribute("alertMsg", "양식에 맞게 회원가입을 진행해 주세요.");
					return "redirect:mainList.do?error";

				}
				
			}

			
			// 이메일 비밀번호 찾기
		    @PostMapping("/sendpw.do")
		    public String sendEmailAction (@ModelAttribute Member member,HttpSession session) throws Exception {
		    	
		    	String id=member.getMemberId();
		        String e_mail=member.getMemberEmail();
		        
		        String pw=memberService.getPw(member);

		    	
		        MimeMessage message = mailSender.createMimeMessage();
		        try {
		            message.setSubject(":D Plate 비밀번호 입니다.");
		            message.setText("회원님의 비밀번호는 " + pw + "입니다!\n보안을 위해 마이페이지에서 비밀번호를 변경해 주세요!");
		            message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(e_mail));
		            mailSender.send(message);
		            System.out.println("성공");
		        } catch (MessagingException e) {
		            e.printStackTrace();
		        }
		        
		        if(pw != null) { // 메일 성공
					// 실패시 알람메세지
					session.setAttribute("alertMsg", "이메일이 발송 되었습니다. 이메일을 확인해 주세요.");
					return "redirect:mainList.do";
				}
				else { // 실패
					session.setAttribute("alertMsg", "아이디와 이메일이 일치하지 않습니다 아이디와 이메일을 확인해 주세요.");
					return "redirect:mainList.do?error";
				}
		 
		    }
		    
		    // 이메일 아이디 찾기
		    @PostMapping("/findid.do")
		    public String sendEmailAction (
		    		@RequestParam String memberName,
		    		@RequestParam String memberEmail,
		    		@ModelAttribute Member member,
		    		HttpSession session) throws Exception {
		    	
		    	String name=memberName;
		        String e_mail=memberEmail;

		        String id=memberService.getId(member);
		        
		        System.out.println("이름 : " + name);
		        System.out.println("이메일 : " + e_mail);
		    	
		        MimeMessage message = mailSender.createMimeMessage();
		        try {
		            message.setSubject(":D Plate 아이디 입니다.");
		            message.setText("회원님의 아이디는 " + id + "입니다!");
		            message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(e_mail));
		            mailSender.send(message);
		            System.out.println("성공");
		        } catch (MessagingException e) {
		            e.printStackTrace();
		        } 
		        
		        if(id != null) { // 메일 성공
					// 실패시 알람메세지
					session.setAttribute("alertMsg", "이메일이 발송 되었습니다. 이메일을 확인해 주세요.");
					return "redirect:mainList.do";
				}
				else { // 실패
					session.setAttribute("alertMsg", "이름과 이메일이 일치하지 않습니다 이름과 이메일을 확인해 주세요.");
					return "redirect:mainList.do?error";
				}
		        
		        
		    	
		    }
		    
		    
		    // 사업자 전환
		    @PostMapping("/memstatus.do")
		    public String memStatus(
		    		@RequestParam int resNo,
		    		@RequestParam int memberNo,
		    		HttpSession session,
		    		Model model) {
		    	
		    	int result = memberService.memStatus(resNo, memberNo);
		    	
				if(result > 0) { // 성공
					session.setAttribute("alertMsg", "사업자 신청이 되었습니다!");
				}
				else { // 실패
					return "redirect:mainList.do?error";
				}
		    	
		    	return "redirect:mainList.do";
		    }

		 // 메뉴바 개인정보 수정 비밀번호 확인
			@PostMapping("/password")
			public String passwordVertify(
					@RequestParam String vertifyPwd,
					HttpSession session) {
				
					Member m = (Member)session.getAttribute("loginUser");
					String memberPwd = m.getMemberPwd();
					
					if(memberPwd.equals(vertifyPwd)) {
						return "redirect:modify";
					}else {
						session.setAttribute("alertMsg", "비밀번호가 다릅니다.");
						return "redirect:mainList.do";
				}
			
				
			}
}











