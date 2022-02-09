package com.kh.dplate.bookmark.controller;



import java.util.List;

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

import com.kh.dplate.bookmark.model.service.BookmarkService;
import com.kh.dplate.bookmark.model.vo.Bookmark;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;



@Controller
public class BookmarkController {
	// 빈하트 클릭시 하트 저장
	
	@Autowired
	private BookmarkService bookmarkService;
	
	@ResponseBody
	@RequestMapping("/saveHeart.do")
	public int saveheart(@RequestParam int no,
							   @RequestParam int memberNo,
							   @ModelAttribute Bookmark to,
							   Model model) {

		
		
	    to.setResNo(no);
	    to.setMemberNo(memberNo);
	    
	    int pto = bookmarkService.saveheart(to);
	    
	    return pto;
	}

	// 꽉찬하트 클릭시 하트 해제
	@ResponseBody
	@RequestMapping("/removeHeart.do")
	public int removeheart(@RequestParam int no,
							    @RequestParam int memberNo,
							    @ModelAttribute Bookmark to,
							    Model model) {
		to.setResNo(no);
	    
	    to.setMemberNo(memberNo);

	    // -1된 하트 갯수를 담아오기위함
	    int pto = bookmarkService.removeheart(to);

	    return pto;
	}
	
	// 북마크 전체 목록을 보여주는 화면을 띄워주는 메소드
		@GetMapping("/bookmark")
		public String bookmarkList(
				HttpSession session,
				@RequestParam(defaultValue = "1") int currentPage,
				Model model) {
			
			if (((Member) session.getAttribute("loginUser")) != null) {
			
			Member m =(Member)session.getAttribute("loginUser");
			int memberNo = m.getMemberNo();
			
			  int pageLimit = 5;
		      int boardLimit = 5;
		      int listCount; // done
		      int maxPage;
		      int startPage;
		      int endPage;

		      // 변수설정
		      listCount = bookmarkService.bookmarkCount(memberNo); // 총개 가져가야함  
		      
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
			List<Bookmark> list = bookmarkService.bookmarkList(pi,memberNo);
			
			// 수하물 => bookmark 객체
			model.addAttribute("list", list);
			
			System.out.println("리스트에 담겨있나?");
			System.out.println(list);
			
			return "mypage/bookmark";
			} else {
				session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
				return "redirect:/";
			}
			
		}
		
			@PostMapping("/myBookmarkDelete")
			public String myBookmarkDelete(@RequestParam int bookmarkNo, HttpSession session
				) {
			
			
			int result = bookmarkService.myBookmarkDelete(bookmarkNo);
			System.out.println(result);
			session.setAttribute("alertMsg", "삭제가 완료 되었습니다");
			return "redirect:bookmark";
		}
}
