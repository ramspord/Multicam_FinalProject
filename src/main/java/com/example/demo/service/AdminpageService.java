package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.AdminPageDAO;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.MemberVO;

@Service
public class AdminpageService {

	@Autowired
	AdminPageDAO adminpageDAO;
	
	public List<MemberVO> MemberList() throws DataAccessException{		
		return adminpageDAO.memberList();
		
	}

	public void MemberDelete(MemberVO memberVO) throws DataAccessException{
		adminpageDAO.memberDelete(memberVO);
		
	}

	public List<MemberVO> MemberUpdateForm(MemberVO memberVO) throws DataAccessException{
		return adminpageDAO.memberUpdateForm(memberVO);
		
	}

	public void MemberUpdate(MemberVO memberVO) throws DataAccessException{
		adminpageDAO.memberUpdate(memberVO);
		
	}

	public List<BoardVO> BoardList() throws DataAccessException{
		return adminpageDAO.boardList();
	}

	public void BoardDelete(BoardVO boardVO) throws DataAccessException{
		adminpageDAO.boardDelete(boardVO);
		
	}

}
