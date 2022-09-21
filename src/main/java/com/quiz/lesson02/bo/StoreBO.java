package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service	// spring bean
public class StoreBO {
	
	@Autowired
	private StoreDAO storeDAO;	// DAO 객체 가져오기

	// input : x, output : List<Store>
	public List<Store> getStoreList() {
		return storeDAO.selectStoreList();
	}
}
