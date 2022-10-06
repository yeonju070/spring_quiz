package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.InternetDAO;
import com.quiz.lesson06.model.Internet;

@Service
public class InternetBO {
	
	@Autowired
	private InternetDAO internetDAO;

	public void addInternet(String name, String url) {
		internetDAO.insertInternet(name, url);
	}
	
	public List<Internet> getInternetList() {
		return internetDAO.selectInternetList();
	}
	
	public Internet getInternetByUrl(String url) {
		List<Internet> internetList =  internetDAO.selectInternetByUrl(url);
		if (internetList.isEmpty()) {
			return null;	// 중복이 아닐 경우 null로 return
		}
		return internetList.get(0);	// 중복이면 첫번째 데이터를 return한다.
	}
	
	public int deleteInternetById(int id) {
		return internetDAO.deleteInternetById(id);
	}
}