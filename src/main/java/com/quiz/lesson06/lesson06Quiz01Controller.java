package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.InternetBO;
import com.quiz.lesson06.model.Internet;

@RequestMapping("/lesson06/quiz01")
@Controller
public class lesson06Quiz01Controller {
	
	@Autowired
	private InternetBO internetBO;
	
	// 요청 url : http://localhost:8080/lesson06/quiz01/add_internet_view
	@RequestMapping("/add_internet_view")
	public String addInternetView() {
		
		return "lesson06/addInternet";
	}
	
	// AJAX가 호출되는 API => @ResponseBody가 있어야 한다.
	@PostMapping("/add_internet")
	@ResponseBody
	public String addInternet(
			@RequestParam("title") String title,
			@RequestParam("url") String url) {
	      
	      internetBO.addInternet(title, url);
	      
	      return "success";
	   }
	   
	   @RequestMapping("/get_internet_view")
	   public String getInternetView(Model model) {
	      List<Internet> internetList = internetBO.getInternetList();
	      
	      model.addAttribute("internetList", internetList);
	      
	      return "lesson06/getInternet";
	   }
}
