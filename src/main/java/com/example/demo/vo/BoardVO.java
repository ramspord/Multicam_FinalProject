package com.example.demo.vo;

import java.time.LocalDateTime;

public class BoardVO {
	/** 번호 (PK) */
	private int idx;

	/** 제목 */
	private String title;

	/** 내용 */
	private String content;
	
	/** 등록일 */
	private LocalDateTime insertTime;
	
	/** 조회 수 */
	private int count;

	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", title=" + title + ", content=" + content + ", insertTime=" + insertTime
				+ ", count=" + count + "]";
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public LocalDateTime getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(LocalDateTime insertTime) {
		this.insertTime = insertTime;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
