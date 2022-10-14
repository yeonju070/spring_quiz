package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/booking_list_view")
	public String bookingListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/bookingList";
	}
	
	@DeleteMapping("/delete_booking")
	@ResponseBody
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id) {
		
		// 삭제 DB
		int deleteCount = bookingBO.deleteBooking(id);
		
		Map<String, Object> result = new HashMap<>();
		
		if (deleteCount > 0) {
			result.put("code", 100);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "삭제할 예약 내역이 없습니다.");
		}
		
		return result;
	}
	
	@RequestMapping("/booking_confirm_view")
	public String bookingConfirmView() {
		
		return "lesson06/bookingConfirm";
	}

	// AJAX 호출
	@ResponseBody
	@PostMapping("/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		int addCount = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		if (addCount > 0) {
			result.put("code", 100);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "데이터를 입력하는데 실패했습니다.");
		}
		
		return result;
	}
	
	@RequestMapping("/booking_homepage_view")
	public String bookingHomepageView() {
		
		return "lesson06/bookingHomepage";
	}
	
	// AJAX의 요청
		@ResponseBody
		@PostMapping("/search_booking")
		public Map<String, Object> searchBooking(
				@RequestParam("name") String name,
				@RequestParam("phoneNumber") String phoneNumber) {
			
			Booking booking = bookingBO.getLatesBooking(name, phoneNumber);
			
			Map<String, Object> result = new HashMap<>();
			if (booking != null) {
				result.put("code", 100);		// 데이터 있음
				result.put("booking", booking);
			} else {
				result.put("code", 400);	// 데이터 없음
			}
			
			return result;
		}
}