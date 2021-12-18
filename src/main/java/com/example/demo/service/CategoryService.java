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
	
	public ArrayList<CategoryVO> selectCategoryDetail(String place,String user_no) {
		ArrayList<CategoryVO> List = null;
		if(user_no.equals("2")) {
			List = categoryDAO.selectCategoryDetailAdmin(place);
		}else {
			List = categoryDAO.selectCategoryDetail(place,user_no);			
		}
		return List;
	}
	
	public void addUserText(CategoryVO categoryVO) {
		categoryDAO.addUserText(categoryVO);
	}
	
	public void deleteUserText(CategoryVO categoryVO) {
		categoryDAO.deleteUserText(categoryVO);
	}
}
