package com.kh.dplate.reservation.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.dplate.common.model.vo.PageInfo;
import com.kh.dplate.member.model.vo.Member;
import com.kh.dplate.reservation.model.service.ReservationService;
import com.kh.dplate.reservation.model.vo.Reservation;
import com.kh.dplate.reservationtime.model.vo.ReservationTime;
import com.kh.dplate.restaurant.model.service.RestaurantService;
import com.kh.dplate.restaurant.model.vo.Restaurant;
@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	// 예약 추가 화면
	@GetMapping("/make/{resNo}")
	public String make(@ModelAttribute Reservation reservation,
			Model model,
			@PathVariable int resNo,
			HttpSession session) {
		
	      if (session.getAttribute("loginUser") == null) {
	         
	          session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
	         
	          return "redirect:/";
	      }
	      else {
	    	  Restaurant res = reservationService.select(resNo);
	    		
	  		model.addAttribute("res", res);
	  		
	  		return "reservation/reservationMake";
	      }
	}
	
	// 예약 추가
	@PostMapping("/make")
	public String make1(@ModelAttribute Reservation reservation,
			@ModelAttribute ReservationTime reservationtime,
			Model model,@RequestParam int resNo,
			HttpSession session) {
		
		List<ReservationTime> list2 = reservationService.select2(resNo);
		model.addAttribute("list2", list2);
		
		for (int i=0; i<list2.size(); i++) {
			if(reservation.getReTime().equals(list2.get(i).getReTime())  && reservation.getReVisitdate().equals(list2.get(i).getReVisitdate()) ) {
				if(list2.get(i).getRePeople() >= reservation.getReStatus() ) {
					
					reservation.setTimeNo(list2.get(i).getTimeNo());
					reservationtime.setRePeople(list2.get(i).getRePeople() - reservation.getReStatus());
					reservationtime.setTimeNo(list2.get(i).getTimeNo());
					int result = reservationService.repeople(reservation);	
					
					int result2 = reservationService.updatep(reservationtime);
					
					session.setAttribute("alertMsg", "예약을 성공했습니다.");
					return "redirect:mainList.do";
				}
			}
		}
		
			session.setAttribute("alertMsg", "해당 시간의 예약 가능한 인원수가 초과되어 예약이 불가능합니다.");
			return "redirect:mainList.do";
	}
	
	// 사업자 예약 리스트 창 띄우기
	@GetMapping("/reservationList")
	public String reservationList(@ModelAttribute Reservation reservation,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model,
			HttpSession session) {
		
		  if (session.getAttribute("loginUser") == null) {
		        
		         session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
		        
		         return "redirect:/";
		        
		      } else {
		    	 
		    	 
		    	  String memberStatus = ((Member)session.getAttribute("loginUser")).getMemberStatus();
		           
		          if (!memberStatus.equals("3")) {
		              
		             session.setAttribute("alertMsg", "당신은 사업자가 아닙니다.");
		              
		            return "redirect:/";
		      } else {
		    	 
	
		 
		  int pageLimit = 5;
	      int boardLimit = 5;
	      int listCount; // done
	      int maxPage;
	      int startPage;
	      int endPage;
	      // 변수설정
	      listCount = reservationService.selectReservationListCount(); // 총개 가져가야함
	     
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
		
		List<Reservation> list = reservationService.reservationList(pi);
		
		model.addAttribute("list", list);
		
		return "reservation/reservationList";
		      	}
	   }
	
	}
	
	// 사업자 예약 리스트 예약 취소
	@PostMapping("/reservationList")
	public String delete(@ModelAttribute Reservation reservation,
						 @ModelAttribute ReservationTime reservationtime,
						Model model,
						@RequestParam int resNo,
						HttpSession session) {
		
	
		List<ReservationTime> list2 = reservationService.select2(resNo);
		model.addAttribute("list2", list2);
		System.out.println(list2);
		System.out.println(reservation);
		
		for (int i=0; i<list2.size(); i++) {
			if(reservation.getReTime().equals(list2.get(i).getReTime())  && reservation.getReVisitdate().equals(list2.get(i).getReVisitdate()) ) {
				
					reservationtime.setRePeople(list2.get(i).getRePeople() + (reservation.getReStatus()));
					reservationtime.setTimeNo(list2.get(i).getTimeNo());
					
					int result4 = reservationService.updatepp(reservationtime);	
					
					 int result5 = reservationService.delete(reservation);
				
				
			}
		}
			session.setAttribute("alertMsg", "예약 삭제를 성공했습니다.");		
			return "redirect:reservationList"; // restaurantList 로 보내기
		
		}
	
	// 맛집 정보
	@GetMapping("/insert/{resNo}")
	public String insert(Model model,
			@PathVariable int resNo,
			HttpSession session) {
		
		if (session.getAttribute("loginUser") == null) {
	        
	         session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
	        
	         return "redirect:/";
	        
	      } else {
	    	 
	    	 
	    	  String memberStatus = ((Member)session.getAttribute("loginUser")).getMemberStatus();
	           
	          if (!memberStatus.equals("3")) {
	              
	             session.setAttribute("alertMsg", "당신은 사업자가 아닙니다.");
	              
	            return "redirect:/";
	      } else {
		
		Restaurant res = restaurantService.select(resNo);
		
		model.addAttribute("res", res);
		
		return "reservation/reservationInsert";
	
	}
	      }
	}
	
	@PostMapping("/insert")
	public String insert1(@ModelAttribute ReservationTime reservationtime,
			HttpSession session ) {
		
		int result = reservationService.insert(reservationtime);
		
		session.setAttribute("alertMsg", "예약 추가를 성공했습니다.");
		return "redirect:mainList.do";
		
	}
	//나의 예약 지우기
		@PostMapping("/myRedelete")
		public String myDelete(@RequestParam int timeNo,
							   @RequestParam int reNo,
							   @RequestParam int memberNo,
							   @ModelAttribute ReservationTime reservationtime,
							   Model model) {
			
			List<ReservationTime> list1 = reservationService.select3(timeNo);
			List<Reservation> list2 = reservationService.select4(reNo);
			System.out.println(list1);
			System.out.println(list2);
			
			reservationtime.setRePeople(list1.get(0).getRePeople() + (list2.get(0).getReStatus()));
			reservationtime.setTimeNo(list1.get(0).getTimeNo());
			System.out.println(list1);
			
			
			int result1 = reservationService.myUpdate(reservationtime);
		    int result2 = reservationService.myDelete(reNo);
			
			return "redirect:myRe";
		}
		
			
		
		//마이페이지 예약 리스트 띄우기
		@GetMapping("/myRe")
		public String myReservationList(Reservation reservation,
										HttpSession session,
										@RequestParam(defaultValue = "1") int currentPage,
										Model model
										) {
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
		      listCount = reservationService.reservationCount(memberNo); // 총개 가져가야함
		     
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
			List<Reservation> list = reservationService.myReservationList(pi ,memberNo);
			model.addAttribute("list", list);
			
			return "mypage/reservation";
			} else {
				session.setAttribute("alertMsg", "로그인 후에 이용하세요.");
				return "redirect:/";
			}
			
		}
				
	}