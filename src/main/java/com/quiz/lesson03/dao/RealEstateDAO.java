package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstateById(int id);
	
	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);
	
	// @Param은 하나의 Map을 만들어준다.
	// @Param은 repository DAO에서만 사용
	public List<RealEstate> selectRealEstateListByAreaNPrice(
			@Param("area") int area,
			@Param("price") int price
			);
}
