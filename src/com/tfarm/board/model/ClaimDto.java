package com.tfarm.board.model;

public class ClaimDto extends ClaimReasonDto{
	
	private int cseq;
	private int seq;
	private int claimer;
	private int claimed;
	
	
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getClaimer() {
		return claimer;
	}
	public void setClaimer(int claimer) {
		this.claimer = claimer;
	}
	public int getClaimed() {
		return claimed;
	}
	public void setClaimed(int claimed) {
		this.claimed = claimed;
	}
	
}
