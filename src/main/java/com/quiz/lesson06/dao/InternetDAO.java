package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Internet;

@Repository
public interface InternetDAO {

   public void insertInternet(
         @Param("title") String title,
         @Param("url") String url);
   
   public List<Internet> selectInternetList();
}