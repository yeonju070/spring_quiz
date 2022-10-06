package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Internet;

@Repository
public interface InternetDAO {
	
	public void insertInternet(
			@Param("name") String name, 
			@Param("url") String url);
	
	public List<Internet> selectInternetList();
	
	public List<Internet> selectInternetByUrl(String url);
	
	public int deleteInternetById(int id);
}