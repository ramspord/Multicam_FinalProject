package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.BookmarkService;
import com.example.demo.vo.BookmarkVO;

@Controller
public class BookmarkController {
	@Autowired
	BookmarkService bookmarkService;
@PostMapping("insertBookmark")
@ResponseBody
public ModelAndView insertBookmark( BookmarkVO bookmarkVO) {
	bookmarkService.insertBookmark(bookmarkVO);
	
List<BookmarkVO> list=bookmarkService.bookmarkList();
	
	ModelAndView mav=new ModelAndView("bookmarkList");
	mav.setViewName("bookmarkList");
	mav.addObject("bookmarkList", list);
	return mav;
	
}


}
