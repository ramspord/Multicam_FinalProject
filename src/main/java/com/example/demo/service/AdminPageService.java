package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.AdminPageDAO;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.CategoryVO;
import com.example.demo.vo.MemberVO;

@Service
public class AdminPageService {

	@Autowired
	AdminPageDAO adminPageDAO;
	
		public List<BoardVO> BoardList() throws DataAccessException{
		
			return adminPageDAO.boardList();
		}

		public void BoardDelete(BoardVO boardVO) {
			adminPageDAO.boardDelete(boardVO);
			
		}

		public List<MemberVO> MemberList() {
			return adminPageDAO.memberList();
		}

		public List<MemberVO> MemberUpdateForm(MemberVO memberVO) {
			return adminPageDAO.memberUpdateForm(memberVO);
		}

		public void MemberUpdate(MemberVO memberVO) {
			adminPageDAO.memberUpdate(memberVO);
			
		}

		public void MemberDelete(MemberVO memberVO) {
			adminPageDAO.memberDelete(memberVO);
			
		}

		public List<CategoryVO> categoryList() {			
			return adminPageDAO.categoryList();
		}

		public void categoryDelete(CategoryVO categoryVO) {
			adminPageDAO.categoryDelete(categoryVO);
			
		}

		public void categoryInsert(CategoryVO categoryVO) {
			adminPageDAO.categoryInsert(categoryVO);
			
		}

		public List<CategoryVO> categoryTextList() {
			return adminPageDAO.categoryTextList();
		}

		public void categoryTextInsert(CategoryVO categoryVO) {
			adminPageDAO.categoryTextInsert(categoryVO);
			
		}

}
