package com.groupone.vo;

public class CommentsVO {
	String id;
	int bno;
	int bbno;
	String comments;
	String bbindate; 
	
	public int getBbno() {
		return bbno;
	}
	public void setBbno(int bbno) {
		this.bbno = bbno;
	}
	public String getBbindate() {
		return bbindate.substring(0,16);
	}
	public void setBbindate(String bbindate) {
		this.bbindate = bbindate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
	
}
