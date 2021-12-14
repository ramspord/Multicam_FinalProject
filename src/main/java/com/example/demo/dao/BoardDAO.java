package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.BoardVO;

@Mapper
@Repository
public interface BoardDAO {
	public int selectIdx();
	
	public void insertBoard(BoardVO boardVO) throws DataAccessException; 


	public BoardVO selectBoardDetail(Long idx); 


	public int updateBoard(BoardVO boardVO); 


	public int deleteBoard(Long idx); 


	public List<BoardVO> selectBoardList(BoardVO boardVO); 


	public int selectBoardTotalCount(); 
}
