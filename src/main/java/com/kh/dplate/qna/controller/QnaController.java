package com.kh.dplate.qna.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dplate.bookmark.model.vo.Bookmark;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.qna.model.service.QnaService;
import com.kh.dplate.qna.model.vo.Qna;


@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

	
	// QNA 전체 목록을 보여주는 메소드
	@GetMapping("/qnaList")
	public String qnaListView(
			HttpSession session,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model) {
		
		if (((Member) session.getAttribute("loginUser")) != null) {

		int memberNo =((Member)session.getAttribute("loginUser")).getMemberNo();
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();

		  int pageLimit = 5;
	      int boardLimit = 5;
	      int listCount; // done
	      int maxPage;
	      int startPage;
	      int endPage;

	      // 변수설정
	      listCount = qnaService.qnaCount(memberNo); // 총개 가져가야함  
	      
	      maxPage = (int) Math.ceil((double) listCount / boardLimit);
	      startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	      endPage = startPage + pageLimit - 1;

	      if (endPage > maxPage) {
	         endPage = maxPage;
	      }

	      model.addAttribute("currentPage", currentPage);
	      model.addAttribute("maxPage", maxPage);
	      model.addAttribute("startPage", startPage);
	      model.addAttribute("endPage", endPage);


	      PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

	      
		// 여러행 조회
		List<Qna> list = qnaService.qnaListView(pi,memberNo);
		
		// 수하물 => bookmark 객체
		model.addAttribute("list", list);

		return "mypage/QNA";
		
} else {
	session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
	return "redirect:/";
}

		
	}
	// QNAwrite 띄우기
	@GetMapping("/qnaWrite")
	public String qnaWrite(HttpSession session) {
		
		if (((Member) session.getAttribute("loginUser")) != null) {
		
		Member m =(Member)session.getAttribute("loginUser");
		String memberId = m.getMemberId();
		
		return "mypage/QNAwrite";
		
		} else {
			session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
				return "redirect:/";
		}
	}
	
	// 질문 등록
	@PostMapping("/qnaWrite")
	public String qnaWriter(@ModelAttribute Qna qna,
			HttpSession session,
			Model model) {
		
		Member m =(Member)session.getAttribute("loginUser");
		int memberNo = m.getMemberNo();
		
		System.out.println(qna);
		int result = qnaService.qnaWrite(qna);
		
		if(result > 0) {
			
			System.out.println("성공했습니다.");
			return "redirect:qnaList?memberNo="+memberNo;
		}
		else {
			
			System.out.println("작성 실패");
			return "redirect:qnaList?memberNo="+memberNo;
		}
	}
	
	
	@GetMapping("/deleteQNA")
	public String deleteQNA(
			HttpSession session,
			@RequestParam int qnaNo,
			Model model) {
		
		Member m =(Member)session.getAttribute("loginUser");
		int memberNo = m.getMemberNo();
		
		int result = qnaService.deleteQNA(qnaNo);
		
		if(result > 0) { //성공
		
			System.out.println("성공입니다.");
			return "redirect:qnaList?memberNo="+memberNo;
		}
		else {
			System.out.println(result);
			System.out.println("실패입니다");
			return "redirect:qnaList?memberNo="+memberNo;
		}
		
	}
	
	@GetMapping("/updateQNA")
	public String updateQNA(
			@ModelAttribute Qna qna,
			@RequestParam int qnaNo,
			@RequestParam int memberNo) {
		qna.setQnaNo(qnaNo);
		System.out.println("Qna에 뭐가있지?");
		System.out.println(qna);
		int result = qnaService.updateQNA(qna);
		
		if(result > 0) { //성공
			
			System.out.println("성공입니다.");
			return "redirect:qnaList?memberNo="+memberNo;
		}
		else {
			System.out.println(result);
			System.out.println("실패입니다");
			return "redirect:qnaList?memberNo="+memberNo;
		}
		
	}
	
}
