package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class lesson03QQuiz04RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	// 요청 url : http://localhost:8080/lesson03/quiz04/1?id=21
	@RequestMapping("/lesson03/quiz04/1")
	public String quiz04(
		@RequestParam(value = "id") int id) {
		
		// db 삭제 -> service 요청
		int row = realEstateBO.deleteRealEstateById(id);
		
		// 응답값 -> String
		return "삭제 성공 : " + row;
	}
}
