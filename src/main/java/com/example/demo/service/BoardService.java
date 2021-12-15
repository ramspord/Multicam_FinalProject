package com.example.demo.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDAO;
import com.example.demo.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	public int selectIdx() {
		int idx = boardDAO.selectIdx();
		return idx;
	}
	
	public void registerBoard(BoardVO boardVO) {
		int maxIdx = boardDAO.selectIdx();
		if (boardVO.getIdx() > maxIdx) {
			 boardDAO.insertBoard(boardVO);
		} else {
			 boardDAO.updateBoard(boardVO);
		}

	}

	public BoardVO getBoardDetail(int idx) {
		return boardDAO.selectBoardDetail(idx);
	}

	public void deleteBoard(int idx) {

		BoardVO board = boardDAO.selectBoardDetail(idx);

		if (board != null /* && "N".equals(board.getDeleteYn()) */) {
			boardDAO.deleteBoard(idx);
		}

	}

	public int BoardListCount() {
		int boardTotalCount = boardDAO.selectBoardTotalCount();
		return boardTotalCount;
	}
	public List<BoardVO> getBoardList(BoardVO boardVO) {
		List<BoardVO> boardList = Collections.emptyList();

		int boardTotalCount = boardDAO.selectBoardTotalCount();

		if (boardTotalCount > 0) {
			boardList = boardDAO.selectBoardList(boardVO);
		}

		return boardList;
	}
}
