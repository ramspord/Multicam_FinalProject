package com.example.demo.controlloer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;
import com.example.demo.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("registerNotice")
	public String register(HttpServletRequest request, BoardVO boardVO,ModelMap model) {
		System.out.println(boardVO);
		System.out.println("insert");
		int IDX = boardService.selectIdx();
		boardVO.setIdx(IDX+1);
		boardService.registerBoard(boardVO);
		return "redirect:/";
		}
	
	@RequestMapping("notice")
	public String notice(HttpServletRequest request,ModelMap model,BoardVO boardVO) {
		System.out.println("notice.do");
		List<BoardVO> BoardList = boardService.getBoardList(boardVO);
		System.out.println(BoardList);
		model.addAttribute("BoardList", BoardList);
		return "notice";
	}
	
	@RequestMapping("/")
	public String main() {
		return "index";
	}
}
