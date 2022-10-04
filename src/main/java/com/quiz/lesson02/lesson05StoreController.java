package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@Controller
public class lesson05StoreController {
	
	@Autowired
	private StoreBO storeBO;
	
	// 요청 url : http://localhost:8080/lesson05/store_view
	@RequestMapping("/lesson05/store_view")
	public String storeView(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		
		model.addAttribute("storeList", storeList);
		
		return "lesson05/storeView";
	}
}
