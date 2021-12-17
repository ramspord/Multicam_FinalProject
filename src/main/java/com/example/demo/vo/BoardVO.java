package com.example.demo.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {

	private int no, user_no, count;
	private String title, content;
	private Date registerDate;
	
	
	public BoardVO() {}
	
	public BoardVO(int no, int user_no, int count, String title, String content, Date registerDate) {
		setNo(user_no);
		setNo(no);
		setCount(count);
		setTitle(title);
		setContent(content);
		setRegisterDate(registerDate);
		
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
				
		this.registerDate = registerDate;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", user_no=" + user_no + ", count=" + count + ", title=" + title + ", content="
				+ content + ", registerDate=" + registerDate + "]";
	}

	
	
	
}
