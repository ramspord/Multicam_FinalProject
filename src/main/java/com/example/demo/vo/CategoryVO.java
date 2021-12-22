package com.example.demo.vo;

public class CategoryVO {
	private String place,place_text;
	
	private int user_no, category_no;

	public CategoryVO() {}
	
	public CategoryVO(String place, String place_text, int user_no, int category_no) {
		setPlace(place);
		setPlace_text(place_text);
		setUser_no(user_no);
		setCategory_no(category_no);
	}

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

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	@Override
	public String toString() {
		return "CategoryVO [place=" + place + ", place_text=" + place_text + ", user_no=" + user_no + ", category_no="
				+ category_no + "]";
	}
	
	
	
	
	
	
	
}
