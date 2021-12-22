package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.BookmarkService;
import com.example.demo.service.Tts;
import com.example.demo.vo.BookmarkVO;
import com.example.demo.vo.MemberVO;



@Controller
public class BookmarkController {
	@Autowired
	BookmarkService bookmarkService;
	@Autowired
	Tts tts;
	
@RequestMapping("insertBookmark")

public String insertBookmark(HttpServletRequest request, BookmarkVO bookmarkVO, HttpSession session,MemberVO memberVO, ModelMap model) {
	System.out.println("insert");
	session = request.getSession();
	memberVO = (MemberVO) session.getAttribute("memberVO");
	if(memberVO==null) {
		return "error";
	}
	bookmarkVO.setId(memberVO.getId());
	System.out.println(bookmarkVO);
	System.out.println(memberVO);
	bookmarkService.insertBookmark(bookmarkVO);
	
	return "redirect:/"; }

	@RequestMapping("bookmarkList")
	public ModelAndView bookmarkList(HttpServletRequest request, BookmarkVO bookmarkVO, HttpSession session,MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		System.out.println(memberVO);
		List<BookmarkVO> list=bookmarkService.bookmarkList(memberVO);
	
	ModelAndView mav=new ModelAndView("bookmarkList");
	mav.setViewName("index");
	mav.addObject("bookmarkList", list);
	System.out.println(bookmarkVO);
	return mav;
}

@RequestMapping("deleteBookmark.do")
public String delete (@RequestParam String user_text) {
	bookmarkService.deleteBookmark(user_text);
	return "redirect:/";
}
@RequestMapping("tts2")
@ResponseBody
public String tts (String text) {
	String language = "ko";
	String name=tts.convertToSoundFileName(text,language);
	return name;
}
}
