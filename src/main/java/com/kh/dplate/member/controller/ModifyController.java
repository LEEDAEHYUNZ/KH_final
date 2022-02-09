package com.kh.dplate.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dplate.member.model.service.ModifyService;
import com.kh.dplate.member.model.vo.Member;

@Controller
public class ModifyController {

	@Autowired
	private ModifyService modifyService;
	
	// 개인정보 수정창 띄우기
	@GetMapping("/modify")
	public String modify(
			HttpSession session, 
			Model model) {
		
		if (((Member) session.getAttribute("loginUser")) != null) {
		
		Member m= (Member)session.getAttribute("loginUser");
		String memberId = m.getMemberId();
		
		return "mypage/modify";
		} else {
			session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
			return "redirect:/";
		}
		
		
	}
	
	// 개인정보 수정 
	@PostMapping("/modify")
	public String modifyWrite(
			HttpSession session,
			@ModelAttribute Member m
			) {
		Member memberNo = (Member)session.getAttribute("loginUser");
		
		int result = modifyService.modifyWrite(m);
		
		if(result > 0) { // select 빼고는 redirect
			 
			
			session.setAttribute("alertMsg", "개인정보 수정완료.");
			
			System.out.println("성공하였습니다");
			return "redirect:mainList.do";
		}
		else {
			
			session.setAttribute("alertMsg", "개인정보 수정을 실패하였습니다.");
			
			return "redirect:mainList.do";
		}
	}
	
	// 닉네임 체크
    @ResponseBody
    @RequestMapping("/nickCheck1")
    public int nickCheck(
          @RequestParam String memberNickname){
       int result2 = modifyService.nickCheck(memberNickname);
       return result2;
    }
	
	
	
	
	
}
