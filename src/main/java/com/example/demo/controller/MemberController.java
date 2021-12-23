package com.example.demo.controller;

<<<<<<< HEAD
=======
import java.util.List;
import java.util.Random;
>>>>>>> branch 'TestMaster' of https://github.com/LYHTemptation/Multicam_FinalProject.git

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.example.demo.service.MemberService;
import com.example.demo.service.UserSha256;
import com.example.demo.vo.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
    MemberService memberService;
	
	@PostMapping("contact")
	public String contact(HttpServletRequest request, MemberVO memberVO) {  
		
		System.out.println("회원가입 폼 넘어온 값 "+memberVO);
		
		String encryPassword = UserSha256.encrypt(memberVO.getPw());
		memberVO.setPw(encryPassword);
		System.out.println(memberVO.getPw());
		
		
		if(memberVO.getId() ==null || memberVO.getId().equals("") || 
				memberVO.getPw()==null || memberVO.getPw().equals("") 
				|| memberVO.getName()==null || memberVO.getName().equals("")) {
			System.out.println("여기서 오류");
			return "바";
		}
		
		
		try {
			memberService.contact(memberVO);
			
			return "index";
		}catch(DataAccessException e) {
			System.out.println(e.getMessage());
			return "ok";
		}
	}
	
	@PostMapping("login")
	public String login(HttpServletRequest request, HttpSession session,MemberVO memberVO) {
		session = request.getSession();
		System.out.println("login memberVO " + memberVO);	
		JSONObject jo=new JSONObject();
		
		if(memberVO.getId() ==null || memberVO.getId().equals("") || 
				memberVO.getPw()==null || memberVO.getPw().equals("")) {
			jo.put("msg", "아이디와 비밀번호는 필수 항목입니다.");
			return jo.toJSONString();
		}
		
		String encryPassword = UserSha256.encrypt(memberVO.getPw());
		memberVO.setPw(encryPassword);
		System.out.println(memberVO.getPw());
		
		try {
			MemberVO vo=memberService.login(memberVO);
			if(vo!=null) {
				session.setAttribute("memberVO", vo);
				System.out.println("vo "+vo);
				jo.put("id", vo.getId());
				jo.put("pw", vo.getPw());
				if(jo.size()>0) {
					return "redirect:/";
				}
			}else {
				jo.put("msg", "아이디와 비밀번호를 확인해주세요");
			}
		}catch(DataAccessException e) {
			System.out.println(e.getMessage());
			jo.put("msg", e.getMessage());
		}		
		return jo.toJSONString();
		
	}
	
	@PostMapping("logout")
	public String logout(HttpSession session) {
		JSONObject jo=new JSONObject();
		
		try {
			session.invalidate();
			
			return "redirect:/";
		}catch(Exception e) {
			jo.put("msg", e.getMessage());
		}
		
		return jo.toJSONString();
	}

	@RequestMapping("/")
	public String main(HttpServletRequest request, HttpSession session, ModelMap model, MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		System.out.println("index.do memberVO : "+ memberVO);
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO);
		}
		
		model.addAttribute("memberVO", memberVO);
		return "index";
	}

	


	@RequestMapping("myInfo")
	public String myInfo(MemberVO memberVO, Model model) {		
		
		System.out.println("내정보 보낼값 " +memberVO);
		List<MemberVO> data = memberService.myInfo(memberVO);
		model.addAttribute("data", data);
		
		System.out.println("받은값 "+ data);
		
		return "myInfo";
	}
	
	@RequestMapping("myInfo_Update")
	public String myInfo_Update(MemberVO memberVO) {
		
		System.out.println("내정보수정 값 " + memberVO);
		
		String encryPassword = UserSha256.encrypt(memberVO.getPw());
		memberVO.setPw(encryPassword);
		System.out.println("변경할 비밀번호 : " +memberVO.getPw());
		
		memberService.myInfo_update(memberVO);
		
		return "redirect:/";
	}
	
	@RequestMapping("myInfo_Delete")
	public String myInfo_Delete(MemberVO memberVO) {
		
		System.out.println("삭제할 멤버 값 " + memberVO);
		memberService.myInfo_delete(memberVO);
		
		return "redirect:/";
	}
	 

}

