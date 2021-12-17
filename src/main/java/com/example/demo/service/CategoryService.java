package com.example.demo.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CategoryDAO;
import com.example.demo.vo.CategoryVO;

@Service
public class CategoryService {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	public List<CategoryVO> selectCategory() {
		List<CategoryVO> List = categoryDAO.selectCategory();
		return List;
	}
	
	public ArrayList<CategoryVO> selectCategoryDetail(String place) {
		ArrayList<CategoryVO> List = categoryDAO.selectCategoryDetail(place);
		return List;
	}
}
