package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BookmarkDAO;
import com.example.demo.vo.BookmarkVO;
import com.example.demo.vo.MemberVO;

@Service
public class BookmarkService {
	@Autowired
	BookmarkDAO bookmarkDAO;
public void insertBookmark (BookmarkVO bookmarkVO) {
	try{int i=bookmarkDAO.selectCountByUser_text(bookmarkVO);
	if(i==0) {
	bookmarkDAO.insertBookmark(bookmarkVO);}
	else {
		bookmarkVO.setCount(++i);
		bookmarkDAO.updateCountByUser_text(bookmarkVO);
	}}catch(BindingException e) {
		System.out.println(e.getMessage());
		bookmarkDAO.insertBookmark(bookmarkVO);
	}
}
public List<BookmarkVO> bookmarkList(MemberVO memberVO){
	return bookmarkDAO.bookmarkList(memberVO);
}

public void deleteBookmark(String user_text) {
	bookmarkDAO.deleteBookmark(user_text);
	
}
}

