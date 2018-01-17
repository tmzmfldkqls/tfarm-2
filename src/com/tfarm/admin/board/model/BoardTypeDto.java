package com.tfarm.admin.board.model;

public class BoardTypeDto {

	private int btype;
	private String btype_name;

	public int getBtype() {
		return btype;
	}
	
	public void setBtype(int btype) {
		this.btype = btype;
	}

	public String getBtypeName() {
		return btype_name;
	}

	public void setBtypeName(String btypeName) {
		this.btype_name = btypeName;
	}
}
