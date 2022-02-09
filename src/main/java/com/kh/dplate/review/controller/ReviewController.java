package com.kh.dplate.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dplate.attachment.model.service.AttachmentService;
import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.common.model.vo.MyFileRenamePolicy;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.review.model.service.ReviewService;
import com.kh.dplate.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private AttachmentService attachmentService;
	
	// 리뷰 작성
	@PostMapping("/writeReview")
	public String writeReview(
			@ModelAttribute Review review,
			@RequestParam int memberNo,
			@RequestParam int resNo,
			@RequestParam List<MultipartFile> upfile,
			HttpSession session) {

		review.setMemberNo(memberNo);
		int result = reviewService.writeReview(review);

		if(result > 0) {
			
			int reviewNo = reviewService.selectReviewNo(review);
			
			String filepath = session.getServletContext().getRealPath("/resources/upfiles/");
			
			for(MultipartFile file : upfile) { 
				
				Attachment attachment = new Attachment();
				attachment.setResNo(resNo);
				attachment.setReviewNo(reviewNo);
				attachment.setOriginName((file).getOriginalFilename()); 
				String changeName = new MyFileRenamePolicy().rename(file.getOriginalFilename());
				attachment.setChangeName(changeName);
				attachment.setFilepath("/resources/upfiles/");
				// File 객체를 우선 만들고
				File target = new File(filepath, changeName);
				
				try {
					file.transferTo(target);
				} catch (IllegalStateException | IOException e ) {
					e.printStackTrace();
				}
				
				int result2 = attachmentService.insertReivew(attachment);
					
			}
			
			session.setAttribute("alertMsg", "리뷰가 등록되었습니다.");
			return "redirect:restaurantList/" + resNo;
		}
		else {
			return "redirect:restaurantList/" + resNo + "?error";
		}

	}
	
	// 리뷰 수정
	@PostMapping("/modifyReview")
	public String modifyReview(
			@ModelAttribute Review review,
			@RequestParam String reviewHNo1,
			@RequestParam int reviewRateModify,
			@RequestParam List<MultipartFile> upfile,
			@RequestParam int resNo,
			HttpSession session) {
		
		/*
		for(MultipartFile file : upfile) {
            System.out.println(file.isEmpty());
            System.out.println(file.getOriginalFilename());
            System.out.println("---------");
        }
        */
		
		int reviewNo = Integer.parseInt(reviewHNo1);
		
		review.setReviewNo(reviewNo);
		review.setReviewRate(reviewRateModify);
		
		// 리뷰 수정
		int result1 = reviewService.modifyReview(review);
		
		// 기존 첨부파일 삭제
		int result2 = attachmentService.deleteReview(reviewNo);
		
		if(result1 > 0) {
			
			List<Attachment> list = new ArrayList<Attachment>();
			
			if(upfile != null && !upfile.get(0).isEmpty()) { // 첨부사진이 있다면
            // 사진갯수만큼 반복을 돌려서 한번 반복때마다 추가하겠다.(사진을 다운로드 받고 그담에  Attachment 테이블에 삽입) 

				String filepath = session.getServletContext().getRealPath("/resources/upfiles/");
				
				for(MultipartFile file : upfile) { 
					
					Attachment attachment = new Attachment();
					attachment.setResNo(resNo);
					attachment.setReviewNo(reviewNo);
					attachment.setOriginName((file).getOriginalFilename());
					String changeName = new MyFileRenamePolicy().rename(file.getOriginalFilename());
					attachment.setChangeName(changeName);
					attachment.setFilepath("/resources/upfiles/");
					
					list.add(attachment);
					
					// File 객체를 우선 만들고
					File target = new File(filepath, changeName);
					
					try {
						file.transferTo(target);
					} catch (IllegalStateException | IOException e ) {
						e.printStackTrace();
					}
					
				}

				// 수정 파일 업데이트
				int result3 = attachmentService.updateReview(list);
				System.out.println("첨부파일 수정 : " + result3);
				
				session.setAttribute("alertMsg", "리뷰가 수정되었습니다.");
			}
			
			return "redirect:restaurantList/" + resNo;
		}
		else {
			return "redirect:restaurantList/" + resNo + "?error";
		}
		
	}
	
	// 리뷰 삭제
	@PostMapping("/deleteReview")
	public String deleteReview(
			@ModelAttribute Review review,
			@RequestParam String reviewHNo2,
			@RequestParam int resNo,
			@RequestParam List<MultipartFile> upfile,
			HttpSession session) {
		
		int reviewNo = Integer.parseInt(reviewHNo2);
		review.setReviewNo(reviewNo);

		int result = attachmentService.deleteReview(reviewNo);

		int result1 = reviewService.deleteReview(review);
		
		if(result1 > 0) {
			session.setAttribute("alertMsg", "리뷰가 삭제되었습니다.");
			return "redirect:restaurantList/" + resNo;
		}
		else {
			return "redirect:restaurantList/" + resNo + "?error";
		}
		
	}
	
	// 리뷰 신고
	@PostMapping("/warnReview")
	public String warnReview(
			@ModelAttribute Review review,
			@RequestParam String reviewHNo3,
			@RequestParam int resNo,
			HttpSession session) {
		
		try {
			review.setReviewNo(Integer.parseInt(reviewHNo3));
		} catch(NumberFormatException e) {
			e.getStackTrace();
		}
		
		int result = reviewService.warnReview(review);
		
		System.out.println(review);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "해당 리뷰를 신고했습니다.");
			return "redirect:restaurantList/" + resNo;
		}
		else {
			return "redirect:restaurantList/" + resNo + "?error";
		}
		
	}
	
	//리뷰조회
		@GetMapping("/myReview")
		public String myReviewList(HttpSession session,
								   Model model,
								   @RequestParam(defaultValue = "1") int currentPage) {
			
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
		      listCount = reviewService.reviewCount(memberNo); // 총개 가져가야함  
		      
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

			
			List<Review> list = reviewService.myReviewList(pi,memberNo);

			model.addAttribute("list", list);
			
			return "mypage/reviews";
			} else {
				session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
				return "redirect:/";
			}
		}
	

		// 마이 리뷰 삭제
		@PostMapping("/myDelete")
		public String myDelete(
				@RequestParam int reviewNo,
				HttpSession session
				) {
			
			int result = attachmentService.deleteReview(reviewNo);

			int result1 = reviewService.myDelete(reviewNo);
			
			if(result1 > 0) {
				session.setAttribute("alertMsg", "리뷰가 삭제되었습니다.");
				return "redirect:myReview";
			}
			else {
				return "redirect:myReview?error";
			}
			
		}
		
}
