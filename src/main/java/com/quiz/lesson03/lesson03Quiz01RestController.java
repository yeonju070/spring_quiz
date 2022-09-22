package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz01")
@RestController
public class lesson03Quiz01RestController {
	@Autowired
	private RealEstateBO realEstateBO;
	
	// request -> response
	@RequestMapping("/1")
	public RealEstate quiz01_1(
			@RequestParam(value="id") int id		// 필수 파라미터
	) {
		return realEstateBO.getRealEstateById(id);
	}
	
	// 요청 url : http://localhost:8080/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2(
			@RequestParam("rent_price") int rentPrice) {
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	// 요청 url : http://localhost:8080/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/3")
	public List<RealEstate> quiz01_2(
			@RequestParam("area") int area,
			@RequestParam("price") int price) {
		return realEstateBO.getRealEstateListByInfo(area, price);
	}
}
