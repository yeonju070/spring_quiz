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

import com.quiz.lesson06.bo.InternetBO;
import com.quiz.lesson06.model.Internet;

@RequestMapping("/lesson06")
@Controller
public class InternetController {

	@Autowired
	private InternetBO internetBO;
	
	@RequestMapping("/add_internet_view")
	public String addInternetView() {
		return "lesson06/addInternet";
	}
	
	// AJAX가 호출하는 API => @ResponseBody 있어야함
	@ResponseBody
	@PostMapping("/add_internet")
	public String addInternet(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		internetBO.addInternet(name, url);
		
		return "성공";
	}
	
	@RequestMapping("/internet_list_view")
	public String internetListView(Model model) {
		List<Internet> internetList = internetBO.getInternetList();
		model.addAttribute("internetList", internetList);
		
		return "lesson06/getInternet";
	}
	
	// quiz02
	
	// AJAX 호출하는 API => @ResponseBody
	@ResponseBody
	@PostMapping("/is_duplication_url")
	public Map<String, Boolean> isDuplicationUrl(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		Internet internet = internetBO.getInternetByUrl(url);
		if (internet == null) {
			result.put("isDuplication", false);
		} else {
			result.put("isDuplication", true);
		}
		
		return result; // json string
	}
	
	// AJAX가 호출 -> ResponseBody
	@ResponseBody
	@DeleteMapping("/delete_internet")
	public Map<String, Object> deleteInternet(
			@RequestParam("id") int id) {
		
		Map<String, Object> result = new HashMap<>();
		
		int deleteRow = internetBO.deleteInternet(id);
		if (deleteRow > 0) {
			result.put("code", 100); // 100 이면 성공 => 서버가 지정
			result.put("result", "성공");
		} else {
			result.put("code", 500); // 500 이면 실패 => 서버가 지정
			result.put("errorMessage", "삭제하는데 실패하였습니다.");
		}
		
		return result;
	}
}