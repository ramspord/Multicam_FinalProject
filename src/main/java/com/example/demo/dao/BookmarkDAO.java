package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.BookmarkVO;

@Mapper
@Repository
public interface BookmarkDAO {
public void insertBookmark(BookmarkVO bookmarkVO) throws DataAccessException;
public int selectCountByUser_text(BookmarkVO bookmarkVO) throws DataAccessException;
public void updateCountByUser_text(BookmarkVO bookmarkVO) throws DataAccessException;
public List<BookmarkVO> bookmarkList() throws DataAccessException;
}
