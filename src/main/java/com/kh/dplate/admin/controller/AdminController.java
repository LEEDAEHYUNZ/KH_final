package com.kh.dplate.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dplate.admin.model.service.AdminService;
import com.kh.dplate.business.model.vo.Business;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.qna.model.vo.Qna;
import com.kh.dplate.restaurant.model.vo.Restaurant;
import com.kh.dplate.review.model.vo.Review;

@Controller
@RequestMapping("/")
public class AdminController {

   @Autowired
   private AdminService adminService;

   // 멤버 조회 페이징처리
   @GetMapping("memberList.do")
   public String memberList(@RequestParam(defaultValue = "1") int currentPage,
         @RequestParam(defaultValue = "1") int sort, @RequestParam(defaultValue = "") String keyword, Model model,
         HttpSession session) {

      if (session.getAttribute("loginUser") == null) {

         session.setAttribute("alertMsg", "로그인 후에 이용하세요.");

         return "redirect:mainList.do";

      } else {

         int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();

         if (memberNo != 1) {

            session.setAttribute("alertMsg", "당신은 관리자가 아닙니다.");

            return "redirect:mainList.do";

         } else {

            int pageLimit = 5;
            int boardLimit = 5;
            int listCount; // done
            int maxPage;
            int startPage;
            int endPage;

            // 변수설정
            listCount = adminService.selectMemberListCount(sort, keyword); // 총개 가져가야함

            maxPage = (int) Math.ceil((double) listCount / boardLimit);
            startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
            endPage = startPage + pageLimit - 1;

            if (endPage > maxPage) {
               endPage = maxPage;
            }

            model.addAttribute("currentPage", currentPage);
            model.addAttribute("sort", sort);
            model.addAttribute("maxPage", maxPage);
            model.addAttribute("startPage", startPage);
            model.addAttribute("endPage", endPage);
            model.addAttribute("keyword", keyword);

            PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

            // sqlSession 을 이용하여 게시글 전체 조회
            List<Member> list = adminService.selectMemberList(pi, sort, keyword);

            // 수하물 => Model 객체
            model.addAttribute("list", list);

            // 응답뷰 지정 => return
            return "admin/memberList";
         }

      }
   }

   // 리뷰 신고 조회
   @GetMapping("reviewList.do")
   public String reviewList(@RequestParam(defaultValue = "1") int currentPage,
         @RequestParam(defaultValue = "") String keyword, Model model, HttpSession session) {

      if (session.getAttribute("loginUser") == null) {

         session.setAttribute("alertMsg", "로그인 후에 이용하세요.");

         return "redirect:mainList.do";

      } else {

         int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();

         if (memberNo != 1) {

            session.setAttribute("alertMsg", "당신은 관리자가 아닙니다.");

            return "redirect:mainList.do";

         } else {

            int pageLimit = 5;
            int boardLimit = 5;
            int listCount; // done
            int maxPage;
            int startPage;
            int endPage;

            listCount = adminService.selectReviewListCount(keyword); // 총개 가져가야함

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
            model.addAttribute("keyword", keyword);

            PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

            List<Review> list = adminService.selectReviewList(pi, keyword);

            model.addAttribute("list", list);

            return "admin/reviewList";
         }
      }
   }

// QnA 전체 조회
   @GetMapping("qnaList.do")
   public String qnaList(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "1") int sort,
         @RequestParam(defaultValue = "") String keyword, Model model, HttpSession session) {

      if (session.getAttribute("loginUser") == null) {

         session.setAttribute("alertMsg", "로그인 후에 이용하세요.");

         return "redirect:mainList.do";

      } else {

         int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();

         if (memberNo != 1) {

            session.setAttribute("alertMsg", "당신은 관리자가 아닙니다.");

            return "redirect:mainList.do";

         } else {
            int pageLimit = 5;
            int boardLimit = 5;
            int listCount; // done
            int maxPage;
            int startPage;
            int endPage;

            // 변수설정
            listCount = adminService.selectQnaListCount(sort, keyword); // 총개 가져가야함

            maxPage = (int) Math.ceil((double) listCount / boardLimit);
            startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
            endPage = startPage + pageLimit - 1;

            if (endPage > maxPage) {
               endPage = maxPage;
            }

            model.addAttribute("currentPage", currentPage);
            model.addAttribute("sort", sort);
            model.addAttribute("maxPage", maxPage);
            model.addAttribute("startPage", startPage);
            model.addAttribute("endPage", endPage);
            model.addAttribute("keyword", keyword);

            PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

            List<Qna> list = adminService.selectQnaList(pi, sort, keyword);

            model.addAttribute("list", list);

            return "admin/qnaList";
         }
      }
   }

   // 사업자 전체 조회
   @GetMapping("businessList.do")
   public String businessList(@RequestParam(defaultValue = "1") int currentPage,
         @RequestParam(defaultValue = "1") int sort, @RequestParam(defaultValue = "") String keyword, Model model,
         HttpSession session) {

      if (session.getAttribute("loginUser") == null) {

         session.setAttribute("alertMsg", "로그인 후에 이용하세요.");

         return "redirect:mainList.do";

      } else {

         int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();

         if (memberNo != 1) {

            session.setAttribute("alertMsg", "당신은 관리자가 아닙니다.");

            return "redirect:mainList.do";

         } else {
            int pageLimit = 5;
            int boardLimit = 5;
            int listCount;
            int maxPage;
            int startPage;
            int endPage;

            // 변수설정
            listCount = adminService.selectBusinessListCount(sort, keyword); // 총개 가져가야함
            maxPage = (int) Math.ceil((double) listCount / boardLimit);
            startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
            endPage = startPage + pageLimit - 1;

            if (endPage > maxPage) {
               endPage = maxPage;
            }

            model.addAttribute("currentPage", currentPage);
            model.addAttribute("sort", sort);
            model.addAttribute("maxPage", maxPage);
            model.addAttribute("startPage", startPage);
            model.addAttribute("endPage", endPage);
            model.addAttribute("keyword", keyword);

            PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
            // sqlSession 을 이용하여 게시글 전체 조회
            List<Business> list = adminService.selectBusinessList(pi, sort, keyword);

            // 수하물 => Model 객체
            model.addAttribute("list", list);

            return "admin/businessList";
         }
      }
   }

   // 맛집 전체 조회
   @GetMapping("restaurantList.do")
   public String restaurantList(@RequestParam(defaultValue = "1") int currentPage,
         @RequestParam(defaultValue = "1") int sort, @RequestParam(defaultValue = "") String keyword, Model model,
         HttpSession session) {

      if (session.getAttribute("loginUser") == null) {

         session.setAttribute("alertMsg", "로그인 후에 이용하세요.");

         return "redirect:mainList.do";

      } else {

         int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();

         if (memberNo != 1) {

            session.setAttribute("alertMsg", "당신은 관리자가 아닙니다.");

            return "redirect:mainList.do";

         } else {
            int pageLimit = 5;
            int boardLimit = 5;
            int listCount; // done
            int maxPage;
            int startPage;
            int endPage;

            // 변수설정
            listCount = adminService.selectRestaurantListCount(sort, keyword); // 총개 가져가야함

            maxPage = (int) Math.ceil((double) listCount / boardLimit);
            startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
            endPage = startPage + pageLimit - 1;

            if (endPage > maxPage) {
               endPage = maxPage;
            }

            model.addAttribute("currentPage", currentPage);
            model.addAttribute("sort", sort);
            model.addAttribute("maxPage", maxPage);
            model.addAttribute("startPage", startPage);
            model.addAttribute("endPage", endPage);
            model.addAttribute("keyword", keyword);

            PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

            List<Restaurant> list = adminService.selectRestaurantList(pi, sort, keyword);

            model.addAttribute("list", list);

            return "admin/restaurantList";
         }
      }
   }

   // 멤버 상태값 변경
   @GetMapping("memberStatus.do")
   public String memberUpdate(@RequestParam int memberNo, @RequestParam int memberStatus) {

      Map<String, Integer> param = new HashMap<>();

      param.put("memberNo", memberNo);

      if (memberStatus == 1) {

         param.put("changeStatus", 0);

      } else {

         param.put("changeStatus", 1);
      }

      adminService.memberUpdate(param);

      return "redirect:memberList.do";
   }

   // 맛집 승인 상태 변경
   @GetMapping("restaurantStatus.do")
   public String restaurantUpdate(@RequestParam int resNo, @RequestParam int changeStatus) {

      Map<String, Integer> param = new HashMap<>();

      param.put("resNo", resNo);
      param.put("changeStatus", changeStatus);

      if (changeStatus == 0) {

         int result = adminService.deleteRestaurantStatus(resNo);

      } else {

         int result = adminService.updateRestaurantStatus(param);
      }

      return "redirect:restaurantList.do";
   }

   // 사업자 승인 상태 변경
   @GetMapping("businessStatus.do")
   public String businessStatus(@RequestParam int memberNo, @RequestParam int changeStatus, @RequestParam int resNo) {

      int result = adminService.updateBusinessStatus(memberNo, changeStatus, resNo);

      return "redirect:businessList.do";
   }

   // 리뷰 상태값 변경
   @GetMapping("reviewStatus.do")
   public String qnaStatus(@RequestParam int reviewNo, @RequestParam int changeStatus) {

      if (changeStatus == 0) {

         int result = adminService.deleteReview(reviewNo);

      } else {

         int result = adminService.updateReview(reviewNo);

      }

      return "redirect:reviewList.do";
   }

   // QnA 답변 업데이트
   @PostMapping("qnaAnswer.do")
   public String qnaAnswer(@RequestParam int qnaNo, @RequestParam String qnaAnswer) {

      System.out.println(qnaNo);
      System.out.println(qnaAnswer);

      Map<String, Object> param = new HashMap<>();
      param.put("qnaNo", qnaNo);
      param.put("qnaAnswer", qnaAnswer);

      int result = adminService.updateQnaAnswer(param);

      return "redirect:qnaList.do";
   }

}