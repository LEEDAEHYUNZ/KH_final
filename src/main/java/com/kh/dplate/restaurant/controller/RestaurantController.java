package com.kh.dplate.restaurant.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dplate.attachment.model.service.AttachmentService;
import com.kh.dplate.attachment.model.vo.Attachment;
import com.kh.dplate.bookmark.model.service.BookmarkService;
import com.kh.dplate.bookmark.model.vo.Bookmark;
import com.kh.dplate.common.model.vo.MyFileRenamePolicy;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.service.MemberService;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.restaurant.model.service.RestaurantService;
import com.kh.dplate.restaurant.model.vo.Restaurant;
import com.kh.dplate.review.model.service.ReviewService;
import com.kh.dplate.review.model.vo.Review;



@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	private BookmarkService bookmarkService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/mainList.do")
	public String mainList(
			@ModelAttribute Restaurant restaurant,
			@ModelAttribute Attachment attachment,
			HttpSession session,
			Model model) {
		
		List<Restaurant> list = restaurantService.mainList(restaurant);
		List<Attachment> list2 = attachmentService.atList(attachment);
		
		
		
		for(Restaurant r : list) {
			
			for(Attachment a : list2) {

				if(r.getResNo() == a.getResNo()) {
					r.setImgName(a.getChangeName());
					break;
				}
			}
			
		}
		
		model.addAttribute("loginUser", (Member)session.getAttribute("loginUser"));
		
		
		
		model.addAttribute("main", list);
		
		
		
		return "home";
	}
	
	
	// ?????? ????????? ??????
		@GetMapping("mainKeyword")
		public String mainkeyword(@RequestParam String keyword,
								  @RequestParam int option,
								  @ModelAttribute Attachment attachment,
									Model model) {

			Map<String, Object> param = new HashMap<>();
			
			param.put("option", option);
			param.put("keyword", keyword);
			
			List<Restaurant> list= restaurantService.selectMainKeyword(param);
			
			List<Attachment> list2 = attachmentService.atList(attachment);
			
			for(Restaurant r : list) {
				
				for(Attachment a : list2) {

					if(r.getResNo() == a.getResNo()) {
						r.setImgName(a.getChangeName());
						break;
					}
				}
				
			}
			model.addAttribute("main", list);
			
		
			return "home";
		}
		
		
		@GetMapping("/restaurantList/{resNo}")
		public String restaurantList(
				@PathVariable int resNo,
				@ModelAttribute Review review,
				@ModelAttribute Attachment attachment,
				@ModelAttribute Bookmark bookmark,
				@RequestParam(defaultValue = "1") int currentPage,
				@RequestParam(defaultValue = "0") int sort, 
				HttpSession session,
				Model model) {

			// ?????? ????????? ?????????
			int status0 = reviewService.countRate0(resNo);
			model.addAttribute("s0", status0);
			
			int status1 = reviewService.countRate1(resNo);
			model.addAttribute("s1", status1);
			
			int status2 = reviewService.countRate2(resNo);
			model.addAttribute("s2", status2);
			
			int status3 = reviewService.countRate3(resNo);
			model.addAttribute("s3", status3);
			
			// ??????????????????
			int pageLimit = 5;
		    int boardLimit = 5;
		    int listCount; 
		    int maxPage;
		    int startPage;
		    int endPage;
		    
		    listCount = reviewService.reviewListCount(resNo, sort);
		    
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
	        model.addAttribute("sort", sort);
	        
	        // ?????? ??????
	 		List<Review> reviewList = reviewService.reviewList(pi, resNo, sort);
	 		model.addAttribute("reviewList", reviewList);
	        

			
			List<Attachment> attReviewList = attachmentService.attReview(attachment);
			model.addAttribute("attReview", attReviewList);
			
			System.out.println(attReviewList);
			

			
			Restaurant res = restaurantService.restaurantList(resNo);
			List<Attachment> list3 = attachmentService.atList(attachment);
			List<Bookmark> list4 = bookmarkService.boselectList(bookmark);
			System.out.println(list4);
			model.addAttribute("loginUser", (Member)session.getAttribute("loginUser"));
			model.addAttribute("res", res);
			model.addAttribute("list3", list3);
			model.addAttribute("boolist", list4);
			
			return "restaurant/restaurantList";
		}	
	
		
		// ?????? ?????? - GET
	      @GetMapping("/insert.do")
	      public String insert(HttpSession session, Model model) {

	         if (session.getAttribute("loginUser") == null) {

	            session.setAttribute("alertMsg", "????????? ??? ??????????????????!");
	            
	            return "redirect:mainList.do";

	         } else {

	            int resNo = ((Member) session.getAttribute("loginUser")).getResNo();

	            if (resNo != 0) {

	               session.setAttribute("alertMsg", "?????? ????????? ????????? ????????????!");

	               return "redirect:mainList.do";
	               
	            } else {
	               
	               return "restaurant/insert";
	            }
	         }

	      }
	      
	      // ?????? ?????? - POST
	      @PostMapping("/insert.do")
	      public String insert(@ModelAttribute Restaurant restaurant,
	                      @ModelAttribute Member m,
	                      @RequestParam List<MultipartFile> upfile,
	                      HttpSession session) {
	         
	         // Service ????????? ??????
	         int result = restaurantService.insertRestaurant(restaurant); // ???????????? ?????? ????????? 
	         
	         if(result > 0) { // ??????????????? 
	            // ???????????? ??????
	            int restaurantNumber = restaurantService.selectRestaurantNo(restaurant);
	            // ?????? : ?????? ?????? ????????? ?????? ?????? ?????? ????????? ??????????????? ????????? ????????????????????? ?????? ???????????? 
	            
	            m.setResNo(restaurantNumber);
	            
	            int result0 = memberService.updateresno(m);
	            
	            for(MultipartFile file : upfile) { // ???????????????????????? ?????? 
	               
	               Attachment a = new Attachment();
	               a.setResNo(restaurantNumber); // 
	               a.setOriginName((file).getOriginalFilename()); // ????????? ??????
	               String changeName = new MyFileRenamePolicy().rename(file.getOriginalFilename());
	               a.setChangeName(changeName);
	               String filepath = session.getServletContext().getRealPath("/resources/images/"); // ??????
	               a.setFilepath("/resources/images/"); //  DB
	               
	               // File ????????? ?????? ?????????
	               File target = new File(filepath, changeName);
	               try {
	                  file.transferTo(target);
	               } catch (IllegalStateException | IOException e ) {
	                  e.printStackTrace();
	               }
	               
	               int result2 = attachmentService.insertRestaurant(a);
	               
	            }
	            session.setAttribute("alertMsg", "?????? ??????????????? ?????????????????????");
	            return "redirect:mainList.do";
	         }
	         else {
	            session.setAttribute("alertMsg", "?????? ??????????????? ?????????????????????");
	            return "redirect:mainList.do";
	         }
	      }
	      
	      
	      // ?????? ?????? - GET
	      @GetMapping("/update/{resNo}")
	      public String update(Model model, @PathVariable int resNo, HttpSession session) {
	         
	         if (session.getAttribute("loginUser") == null) {

	            session.setAttribute("alertMsg", "????????? ??? ??????????????????!");
	            return "redirect:/mainList.do";

	         } else {
	            
	            int resNo2 = ((Member) session.getAttribute("loginUser")).getResNo();
	            
	            if (resNo != resNo2) {
	               
	               session.setAttribute("alertMsg", "????????? ????????? ????????? ???????????? ????????? ????????? ????????????.");
	               
	               return "redirect:/mainList.do";
	               
	            } else {
	               
	               Restaurant res = restaurantService.select(resNo);

	               model.addAttribute("res", res);
	               
	               return "restaurant/update"; 
	            }
	         }
	      }
	      
	      // ?????? ??????
	      @PostMapping("/update.do")
	      public String update(@ModelAttribute Restaurant restaurant,
	                      @RequestParam int resNo,
	                       @RequestParam List<MultipartFile> upfile,
	                       HttpSession session) {   
	            
	            List<Attachment> list = new ArrayList<Attachment>();
	            for(MultipartFile file : upfile) { // ???????????????????????? ?????? 
	               
	               Attachment a = new Attachment();
	               a.setResNo(resNo); 
	               a.setOriginName((file).getOriginalFilename()); // ????????? ??????
	               String changeName = new MyFileRenamePolicy().rename(file.getOriginalFilename());
	               a.setChangeName(changeName);
	               String filepath = session.getServletContext().getRealPath("/resources/images/");
	               a.setFilepath("/resources/images/");
	               
	               list.add(a);
	               
	               // File ????????? ?????? ?????????
	               File target = new File(filepath, changeName);
	               try {
	                  file.transferTo(target);
	               } catch (IllegalStateException | IOException e ) {
	                  e.printStackTrace();
	               }
	               
	               int result2 = attachmentService.updateRestaurant(list, restaurant); // attachmentDao ?????? sqlSession 3??? ??????
	            }
	            
	            session.setAttribute("alertMsg", "?????? ????????? ?????????????????????");
	            
	            // ????????? ???????????? ???????????? ?????????
	            return "redirect:mainList.do";
	      }
	         
	      
	      // ?????? ??????
	      @GetMapping("/delete/{resNo}")
	      public String delete(Model model, @PathVariable int resNo, HttpSession session) {

	         if (session.getAttribute("loginUser") == null) {

	            session.setAttribute("alertMsg", "????????? ??? ??????????????????!");
	            
	            return "redirect:/mainList.do";

	         } else {
	            
	            int resNo2 = ((Member) session.getAttribute("loginUser")).getResNo();
	            
	            if (resNo != resNo2) {
	               
	               session.setAttribute("alertMsg", "????????? ????????? ????????? ???????????? ????????? ????????? ????????????.");
	               
	               return "redirect:/mainList.do";

	            } else {
	               
	               Restaurant res = restaurantService.select(resNo);

	               model.addAttribute("res", res);
	               
	               return "restaurant/delete"; 
	            }
	         }
	      }
	      
	      // ?????? ??????   
	      @PostMapping("/delete.do")
	      public String delete(@ModelAttribute Restaurant restaurant, HttpSession session,
	                      @RequestParam int resNo) {

	         int result = restaurantService.deleteRestaurant(resNo);
	         
	         session.setAttribute("alertMsg", "?????? ????????? ?????????????????????");
	         // ????????? ?????? ???????????? ????????????~
	         return "redirect:mainList.do";
	      }
	      
		// ??????
	    @GetMapping("/search.do")
	    public String search(
	    		@RequestParam String resName,
	    		Model model) {
	    	
			Map<String, String> param = new HashMap<>(); // ?????????
			// Map ????????? ?????? ????????? ?????? ????????? => put(???, ??????);
			param.put("resName", resName);
	    	
	    	List<Restaurant> list = sqlSession.selectList("restaurant.search", param);
	    	System.out.println("list :"+ list);
	    	model.addAttribute("list", list);
	    	
	    	return "member/businessForm";
	    }
	    
	 // ???????????????
		@GetMapping("/business.do")
		public String business(Model model,
				HttpSession session) {
			
			List<Restaurant> list = restaurantService.resList();
			
			model.addAttribute("list2", list);
			
			if (session.getAttribute("loginUser") == null) {
				session.setAttribute("alertMsg", "????????? ?????? ???????????????.");
				return "redirect:mainList.do";
			} else {
				String memberStatus = ((Member) session.getAttribute("loginUser")).getMemberStatus();
				int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
				if (memberNo == 1) {
					session.setAttribute("alertMsg", "????????? ????????????.");
					return "redirect:mainList.do";
				} else if (memberStatus.equals("1")) {
						return "member/businessForm";
					} else if (memberStatus.equals("3")) {
						session.setAttribute("alertMsg", "?????? ???????????? ?????? ?????? ????????????.");
						return "redirect:mainList.do";
						
						}else if (memberStatus.equals("4")) {
							session.setAttribute("alertMsg", "?????????????????? ????????? ????????? ?????????.");
							return "redirect:mainList.do";
							}
					}
	     
	      			return "redirect:mainList.do";
		}
}
