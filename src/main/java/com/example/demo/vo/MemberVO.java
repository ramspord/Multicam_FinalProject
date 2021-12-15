package com.example.demo.vo;

public class MemberVO {
	
	private String id,pw,name,email,phone_no;

	
	
	public MemberVO() {}
	
	
	public MemberVO(String id, String pw, String name, String email, String phone_no) {
		setId(id);
		setPw(pw);
		setName(name);
		setEmail(email);
		setPhone_no(phone_no);
		
		
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


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email
				+ ", phone_no=" + phone_no + "]";
	}
	
	

		
	

}