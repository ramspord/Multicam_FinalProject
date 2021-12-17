package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("registerNotice")
	public String registerNotice(HttpServletRequest request, BoardVO boardVO,ModelMap model) {
		System.out.println("insert");
		int IDX = boardService.selectIdx();
		boardVO.setIdx(IDX+1);
		System.out.println(boardVO);
		boardService.registerBoard(boardVO);
		return "notice";
		}
	
	@RequestMapping("registerProposal")
	public String registerProposal(HttpServletRequest request, BoardVO boardVO,ModelMap model,HttpSession session,MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		boardVO.setUser_no(memberVO.getUser_no());
		int IDX = boardService.selectIdx2();
		boardVO.setIdx(IDX+1);
		System.out.println(boardVO);
		boardService.registerProposal(boardVO);
		return "redirect:/proposal";
		}
	
	@RequestMapping("deleteNotice")
	public String delete(HttpServletRequest request, BoardVO boardVO,ModelMap model) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		boardService.deleteBoard(idx);
		List<BoardVO> BoardList = boardService.getBoardList(boardVO);
		model.addAttribute("BoardList", BoardList);
		return "notice";
	}
	
	@RequestMapping("updateNotice")
	public String update(HttpServletRequest request, BoardVO boardVO,ModelMap model) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardVO board = boardService.getBoardDetail(idx);
		model.addAttribute("board", board);
		return "writeNotice";
	}
	
	@RequestMapping("notice")
	public String notice(HttpServletRequest request,HttpSession session,ModelMap model,BoardVO boardVO,MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		System.out.println(memberVO);
		List<BoardVO> BoardList = boardService.getBoardList(boardVO);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("BoardList", BoardList);
		return "notice";
	}
	
	@RequestMapping("proposal")
	public String proposal(HttpServletRequest request,HttpSession session,ModelMap model,BoardVO boardVO,MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		System.out.println("proposal.do");
		List<BoardVO> BoardList = boardService.getProposalList(boardVO);
		System.out.println(memberVO);
		System.out.println(BoardList);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("BoardList", BoardList);
		return "proposal";
	}
	
	@RequestMapping("/")
	public String main(HttpServletRequest request, HttpSession session, ModelMap model, MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		return "index";
	}
}
