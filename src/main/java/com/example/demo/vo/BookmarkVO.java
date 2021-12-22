package com.example.demo.vo;

public class BookmarkVO {
	private int count;
	private String user_text,id;
	
	public BookmarkVO( int count, String user_text, String id) {
		setId(id);
		setCount(count);
		setUser_text(user_text);
	}
	public BookmarkVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUser_text() {
		return user_text;
	}
	public void setUser_text(String user_text) {
		this.user_text = user_text;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "BookmarkVO [ count=" + count + ", user_text=" + user_text + ", id=" + id + "]";
	}
	
	
}
