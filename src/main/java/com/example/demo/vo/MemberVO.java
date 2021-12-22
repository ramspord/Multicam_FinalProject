package com.example.demo.vo;

public class MemberVO {

	
	private String id,pw,name,email,phone_no,user_no;
	private String user_type = "U";
	private String certified;

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
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

	 public String getCertified() {
			return certified;
	}

		public void setCertified(String certified) {
			this.certified = certified;
	}
	
	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", phone_no=" + phone_no
				+ ", user_no=" + user_no + ", certified=" + certified +", user_type=" + user_type + "]";
	}

	public MemberVO(String id, String pw, String name, String email, String phone_no, String user_no,
			String user_type, String certified) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone_no = phone_no;
		this.user_no = user_no;
		this.user_type = user_type;
		this.certified = certified;
	}

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}


}

