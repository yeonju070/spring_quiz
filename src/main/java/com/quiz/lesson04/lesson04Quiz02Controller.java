package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class lesson04Quiz02Controller {
	
	@Autowired
	private RealtorBO realtorBO;
	
	// 요청 url : http://localhost:8080/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String addRealterView() {
		return "/lesson04/addRealter";
	}
	
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		realtorBO.addRealtor(realtor);
		
		Realtor realtor2 = realtorBO.getRealtorById(realtor.getId());
		
		model.addAttribute("realtor", realtor2);
		model.addAttribute("info", "공인중개사 정보");
		
		return "lesson04/afterAddRealtor";
	}
}
