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

   public void addInternet(String title, String url) {
      internetDAO.insertInternet(title, url);
   }
   
   public List<Internet> getInternetList() {
      return internetDAO.selectInternetList();
   }
}