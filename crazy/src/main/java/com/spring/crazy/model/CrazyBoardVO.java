package com.spring.crazy.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class CrazyBoardVO {
	
	int bno;
	String subject;
	String writer;
	String username;
	String content;
	Date regdate;
	int viewcnt;
	@Override
	public String toString() {
		return "CrazyBoardVO [bno=" + bno + ", subject=" + subject + ", writer=" + writer + ", content=" + content
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
}
