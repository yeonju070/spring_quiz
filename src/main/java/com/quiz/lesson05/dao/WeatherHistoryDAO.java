package com.quiz.lesson05.dao;

import java.util.List;

import com.quiz.lesson05.model.WeatherHistory;

public interface WeatherHistoryDAO {
	
	public List<WeatherHistory> selectWeatherHistoryList();
}
