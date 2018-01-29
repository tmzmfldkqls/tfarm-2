package com.tfarm.admin.board.model;

public class ArticleDto {

	private int rownum;
	private String target;
	private int logtime;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public int getLogtime() {
		return logtime;
	}
	public void setLogtime(int logtime) {
		this.logtime = logtime;
	}
}
