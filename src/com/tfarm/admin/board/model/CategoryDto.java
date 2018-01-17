package com.tfarm.admin.board.model;

public class CategoryDto {

	private int ctype;
	private String cname;

	public int getCcode() {
		return ctype;
	}

	public void setCcode(int ccode) {
		this.ctype = ccode;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

}
