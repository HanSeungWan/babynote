package com.babynote.beans;

public class SignInInfo {
	public SignInInfo(String id, String pw){
		this.id=id;
		this.pw=pw;
	}
	private String id;
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
	private String pw;
	
}
