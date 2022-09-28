package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller	// viewResolver
public class lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	// 요청 url : http://localhost:8080/lesson04/quiz01/add_seller_view
	@GetMapping("/add_seller_view")	
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		// DB insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		// return view(jsp) 경로
		return "/lesson04/afterAddSeller";
	}
	
	// http://localhost:8080/lesson04/quiz01/seller_info_view
	// http://localhost:8080/lesson04/quiz01/seller_info_view?id=1
	@GetMapping("/seller_info_view")
	public String sellerInfoView(
			@RequestParam(value="id", required=false) Integer id,
			Model model) {
		
		Seller seller = null;
		if (id == null) {
			// DB select => 최근 입력된 seller
			seller = sellerBO.getLastestSeller();			
		} else {
			// id가 있는 경우
			seller = sellerBO.getSellerById(id);
		}
		
		// model에 담는다.
		model.addAttribute("seller", seller);
		
		return "lesson04/sellerInfo";
	}
}
