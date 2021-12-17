package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.BoardVO;
import com.example.demo.vo.MemberVO;

@Mapper
@Repository
public interface AdminPageDAO {

	public List<MemberVO> memberList() throws DataAccessException;

	public void memberDelete(MemberVO memberVO) throws DataAccessException;

	public List<MemberVO> memberUpdateForm(MemberVO memberVO) throws DataAccessException;

	public void memberUpdate(MemberVO memberVO) throws DataAccessException;

	public List<BoardVO> boardList() throws DataAccessException;

	public void boardDelete(BoardVO boardVO) throws DataAccessException; 
	
}
