package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.InternetBO;
import com.quiz.lesson06.model.Internet;

@RequestMapping("/lesson06")
@Controller
public class InternetController {

	@Autowired
	private InternetBO internetBO;
	
	// 요청 url : http://localhost:8080/lesson06/quiz01/add_internet_view
	@RequestMapping("/quiz01/add_internet_view")
	public String addInternetView() {
		return "lesson06/addInternet";
	}
	
	// AJAX가 호출하는 API => @ResponseBody 있어야함
	@ResponseBody
	@PostMapping("/quiz01/add_internet")
	public String addInternet(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		internetBO.addInternet(name, url);
		
		return "성공";
	}
	
	@RequestMapping("/quiz01/internet_list_view")
	public String internetListView(Model model) {
		List<Internet> internetList = internetBO.getInternetList();
		model.addAttribute("internetList", internetList);
		return "lesson06/getInternet";
	}
	
	@ResponseBody
	@GetMapping("/quiz02/int_duplication")
	public Map<String, Boolean> intDuplication(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		Internet internet = internetBO.getInternetByUrl(url);
		if (internet == null) {
			result.put("intDuplication", false);
		} else {
			result.put("intDuplication", true);
		}
		
		return result;	// json String
	}
	
	@RequestMapping("/quiz02/int_delete")
	@ResponseBody
	public String InternetDelete(
			@RequestParam("id") int id) {
		
		return "lesson06/getInternet";
	}
}