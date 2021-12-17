package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.AdminpageService;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.MemberVO;

@Controller
public class AdminPageController {

	@Autowired
	AdminpageService adminpageService;
	
	//관리자페이지->멤버관리->페이지호출
	@RequestMapping("adminpage_member")
	public String adminPage_MemberList(Model model) {		
		
		List<MemberVO> list = adminpageService.MemberList();
		model.addAttribute("list",list);		
		System.out.println("멤버관리 호출  " + list);
		
		return "adminPage_Member";
	}
	
	//관리자페이지 -> 게시판관리 호출
	@RequestMapping("adminpage_board")
	public String adminpage_board(Model model) {
		
		List<BoardVO> boardlist = adminpageService.BoardList();
		model.addAttribute("boardlist", boardlist);
		System.out.println("게시판관리 호출 "+boardlist);
				
		return "adminPage_Board";
	}
	
	//관리자페이지-> 멤버관리-> 삭제처리
	@RequestMapping("adminPage_MemberDelete")
	public String adminPage_MemberDelete(MemberVO memberVO) {
	
		System.out.println("삭제될값 정보 "+memberVO);
		adminpageService.MemberDelete(memberVO);
		
		return "redirect:/adminpage_member";
	}
	
	//관리자게시판 -> 게시판관리->삭제처리
	@RequestMapping("adminPage_BoardDelete")
	public String adminPage_BoardDelete(BoardVO boardVO) {
		
		System.out.println("삭제될 게시번호 " + boardVO);
		
		adminpageService.BoardDelete(boardVO);
		
		return "redirect:/adminpage_board";
	}
	
	//관리자페이지 -> 멤버관리->업데이트폼 호출
	@RequestMapping("adminPage_Member_UpdateForm")
	public String adminPage_Member_UpdateForm(MemberVO memberVO, Model model) {
		
		System.out.println("수정값 "+memberVO);
				
		List<MemberVO> data = adminpageService.MemberUpdateForm(memberVO);
		model.addAttribute("data", data);
		
		System.out.println("받아온값 : "+ data);
		
		return "adminPage_Member_UpdateForm";
	}
	
	//관리자게시판-> 멤버관리->수정처리
	@RequestMapping("adminPageMember_Update")
	@ResponseBody
	public String adminPage_Member_Update(MemberVO memberVO) {
		
		System.out.println("업데이트값  " + memberVO);
		adminpageService.MemberUpdate(memberVO);
		
		return "redirect:/adminpage_member";
	}
	

	
}
