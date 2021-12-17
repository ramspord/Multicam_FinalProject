package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.CategoryVO;

@Mapper
@Repository
public interface CategoryDAO {
	public List<CategoryVO> selectCategory() throws DataAccessException;
	public ArrayList<CategoryVO> selectCategoryDetail(String place) throws DataAccessException;
}
