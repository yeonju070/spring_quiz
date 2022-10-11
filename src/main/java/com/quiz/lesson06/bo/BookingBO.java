package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBooking(int id) {
		return bookingDAO.deleteBooking(id);
	}
	
	public int addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getLatesBooking(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectBookingListByNamePhoneNumber(name, phoneNumber);		// [], 채워져 있다.(null은 없다.)
		if (CollectionUtils.isEmpty(bookingList)) {		// 만약 booking이 비어있다면 false
			return null;
		}
		
		return bookingList.get(bookingList.size() - 1);	// 마지막 index 데이터 가져오기
	}
}
