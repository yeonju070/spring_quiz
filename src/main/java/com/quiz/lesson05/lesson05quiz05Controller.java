package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05")
@Controller
public class lesson05quiz05Controller {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/quiz05")
	public String quiz05(Model model) {
		List<WeatherHistory> weatherHistory = new ArrayList<>();
		Date date = new Date();
		
		model.addAttribute("weatherHistory", weatherHistory);
		model.addAttribute("date", date);
		
		 return "lesson05/quiz05";
	}
}
