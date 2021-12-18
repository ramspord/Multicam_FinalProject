package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.CategoryService;
import com.example.demo.vo.CategoryVO;
import com.example.demo.vo.MemberVO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("category")
	public String category(HttpServletRequest request, CategoryVO categoryVO,ModelMap model,HttpSession session, MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		List<CategoryVO> List =  categoryService.selectCategory();
		model.addAttribute("category", List);
		System.out.println(List);
		return "category";
		}
	
	@RequestMapping("categoryDetail")
	public String categoryDetail(HttpServletRequest request, CategoryVO categoryVO,ModelMap model,HttpSession session, MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		String place = request.getParameter("place");
		ArrayList<CategoryVO> List =  categoryService.selectCategoryDetail(place);
		String placeDetail = (String)List.get(0).getPlace();
		
		model.addAttribute("placeDetail", placeDetail);
		model.addAttribute("categoryDetail", List);
		return "categoryDetail";
		}
}
