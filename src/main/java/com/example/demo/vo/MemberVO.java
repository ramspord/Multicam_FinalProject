package com.example.demo.vo;

public class MemberVO {

	int user_no;
	String id, pw, email, phone_no, user_type;
	
	
	public MemberVO() {}	
	

	public MemberVO(int user_no, String id, String pw, String email, String phone_no, String user_type) {
		setUser_no(user_no);
		setId(id);
		setPw(pw);
		setEmail(email);
		setPhone_no(phone_no);
		setUser_type(user_type);
	}
	
	
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [user_no=" + user_no + ", id=" + id + ", pw=" + pw + ", email=" + email + ", phone_no="
				+ phone_no + ", user_type=" + user_type + "]";
	}
}
