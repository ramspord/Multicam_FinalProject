package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.AdminPageService;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.CategoryVO;
import com.example.demo.vo.MemberVO;

@Controller
public class AdminPageController {
	
	@Autowired
	AdminPageService adminpageService;
	
	@RequestMapping("adminPage")
	@ResponseBody
	public String adminPage() {
		return "adminPage";
	}
	
	//관리자페이지 -> 게시판관리 호출
	@RequestMapping("adminpage_board")
	public String adminpage_board(HttpServletRequest request, HttpSession session, ModelMap model, MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		model.addAttribute("memberVO", memberVO);
		
		List<BoardVO> boardlist = adminpageService.BoardList();
		model.addAttribute("boardlist", boardlist);
		System.out.println("게시판관리 호출 "+boardlist);
				
		return "adminPage_Board";
	}
	
	//관리자게시판 -> 게시판관리->삭제처리
	@RequestMapping("adminPage_BoardDelete")
	public String adminPage_BoardDelete(BoardVO boardVO) {
		
		System.out.println("삭제될 게시번호 " + boardVO);
		
		adminpageService.BoardDelete(boardVO);
		
		return "redirect:/adminpage_board";
	}
	
	//관리자페이지->멤버관리->페이지호출
	@RequestMapping("adminpage_member")
	public String adminPage_MemberList(HttpServletRequest request, HttpSession session, ModelMap model, MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		model.addAttribute("memberVO", memberVO);
		
		List<MemberVO> list = adminpageService.MemberList();
		model.addAttribute("list",list);		
		System.out.println("멤버관리 호출  " + list);
		
		return "adminPage_Member";
	}
	
	//관리자페이지 -> 멤버관리->업데이트폼 호출
	@RequestMapping("adminPage_Member_UpdateForm")
	public String adminPage_Member_UpdateForm(MemberVO memberVO, Model model) {
		
		System.out.println("수정값 " +memberVO);
		List<MemberVO> data = adminpageService.MemberUpdateForm(memberVO);
		model.addAttribute("data", data);
		
		System.out.println("받아온값 : "+ data);
		
		return "adminPage_Member_UpdateForm";
	}
	
	//관리자게시판-> 멤버관리->수정처리
	@RequestMapping("adminPageMember_Update")
	public String adminPage_Member_Update(MemberVO memberVO) {
		
		System.out.println("업데이트값  " + memberVO);
		adminpageService.MemberUpdate(memberVO);
		
		return "redirect:/adminpage_member";
	}
	
	//관리자페이지-> 멤버관리-> 삭제처리
	@RequestMapping("adminPage_MemberDelete")
	public String adminPage_MemberDelete(MemberVO memberVO) {
	
		System.out.println("삭제될값 정보 "+memberVO);
		adminpageService.MemberDelete(memberVO);
		
		return "redirect:/adminpage_member";
	}
	
	//관리자페이지 -> 카테고리관리 호출
	@RequestMapping("adminpage_category")
	public String adminpage_category(HttpServletRequest request, HttpSession session, ModelMap model, MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		model.addAttribute("memberVO", memberVO);
		
		
		List<CategoryVO> categoryList = adminpageService.categoryList();
		model.addAttribute("categoryList", categoryList);	
		
		System.out.println("카테고리페이지 호출값 " + categoryList);
		
		
		return "adminPage_Category";
	}
	
	//관리자페이지 -> 카테고리관리 ->삭제처리
	@RequestMapping("adminPage_CategoryDelete")
	public String adminPage_CategoryDelete(CategoryVO categoryVO) {
		
		System.out.println("카테고리 삭제 NO : " + categoryVO);
		
		adminpageService.categoryDelete(categoryVO);
		
		return "redirect:/adminpage_category";
	}
	
	//관리자페이지 -> 카테고리관리->카테고리추가 창호출
	@RequestMapping("adminPage_Category_InsertForm")
	public String adminPage_Category_InsertForm() {
		return "adminPage_Category_InsertForm";
	}
	
	//관리자게시판 ->카테고리관리->카테고리추가
	@RequestMapping("adminPage_Category_Insert")
	public String adminPage_Category_Insert(CategoryVO categoryVO) {
		
		System.out.println("category 추가 값 " + categoryVO);
		
		adminpageService.categoryInsert(categoryVO);
		
		return "redirect:/adminpage_category"; 
	}
	
	//관리자페이지->카테고리관리->텍스트추가 화면호출(select)
	@RequestMapping("adminPage_CategoryText_InsertForm")
	public String adminPage_CategoryText_InsertForm(Model model) {
		
		List<CategoryVO> categoryTextList = adminpageService.categoryTextList();
		model.addAttribute("categoryTextList", categoryTextList);
		
		return "adminPage_CategoryText_InsertForm";
	}
	
	//관리자페이지 -> 카테고리 관리->텍스트추가
	@RequestMapping("adminPage_CategoryText_Insert")
	public String adminPage_CategoryText_Insert(CategoryVO categoryVO) {
		System.out.println("텍스트 추가값 " + categoryVO);
		
		adminpageService.categoryTextInsert(categoryVO);		
		
		return "redirect:/adminpage_category"; 
	}
	
}
