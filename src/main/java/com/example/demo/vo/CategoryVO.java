package com.example.demo.vo;

public class CategoryVO {
	private String place,place_text,user_no,user_text;

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPlace_text() {
		return place_text;
	}

	public void setPlace_text(String place_text) {
		this.place_text = place_text;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getUser_text() {
		return user_text;
	}

	public void setUser_text(String user_text) {
		this.user_text = user_text;
	}

	@Override
	public String toString() {
		return "CategoryVO [place=" + place + ", place_text=" + place_text + ", user_no=" + user_no + ", user_text="
				+ user_text + "]";
	}

	public CategoryVO(String place, String place_text, String user_no, String user_text) {
		super();
		this.place = place;
		this.place_text = place_text;
		this.user_no = user_no;
		this.user_text = user_text;
	}
	
	
}
