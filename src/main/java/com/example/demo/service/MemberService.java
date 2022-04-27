package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	public void contact(MemberVO memberVO) throws DataAccessException{
		memberDAO.insertMember(memberVO);
	}
	
	public MemberVO login(MemberVO memberVO) throws DataAccessException{
		return memberDAO.login(memberVO);
	}

	public List<MemberVO> myInfo(MemberVO memberVO) throws DataAccessException {
		return memberDAO.myInfo(memberVO);
	}

	public void myInfo_update(MemberVO memberVO) throws DataAccessException{
		memberDAO.myInfo_update(memberVO);
		
	}

	public void myInfo_delete(MemberVO memberVO) throws DataAccessException{
		memberDAO.myInfo_delete(memberVO);
		
	}

}

