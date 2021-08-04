package edu.kh.job.qusetions.model.vo;

import java.sql.Date;

import edu.kh.job.member.model.vo.Member;

public class Qusetions {
	
	private int qusetionsNo;
	private String qusetionsTitle;
	private String qusetionsContent;
	private Date qusetionsDt;
	private String qusetionsStatus;
	private String qusetionsReplyStatus;
	private String qusetionsReply;
	private int memberNo;
	
	private Member mem; // join
	
	public Qusetions() {
		// TODO Auto-generated constructor stub
	}

	public int getQusetionsNo() {
		return qusetionsNo;
	}

	public void setQusetionsNo(int qusetionsNo) {
		this.qusetionsNo = qusetionsNo;
	}

	public String getQusetionsTitle() {
		return qusetionsTitle;
	}

	public void setQusetionsTitle(String qusetionsTitle) {
		this.qusetionsTitle = qusetionsTitle;
	}

	public String getQusetionsContent() {
		return qusetionsContent;
	}

	public void setQusetionsContent(String qusetionsContent) {
		this.qusetionsContent = qusetionsContent;
	}

	public Date getQusetionsDt() {
		return qusetionsDt;
	}

	public void setQusetionsDt(Date qusetionsDt) {
		this.qusetionsDt = qusetionsDt;
	}

	public String getQusetionsStatus() {
		return qusetionsStatus;
	}

	public void setQusetionsStatus(String qusetionsStatus) {
		this.qusetionsStatus = qusetionsStatus;
	}

	public String getQusetionsReplyStatus() {
		return qusetionsReplyStatus;
	}

	public void setQusetionsReplyStatus(String qusetionsReplyStatus) {
		this.qusetionsReplyStatus = qusetionsReplyStatus;
	}

	public String getQusetionsReply() {
		return qusetionsReply;
	}

	public void setQusetionsReply(String qusetionsReply) {
		this.qusetionsReply = qusetionsReply;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}

	@Override
	public String toString() {
		return "Qusetions [qusetionsNo=" + qusetionsNo + ", qusetionsTitle=" + qusetionsTitle + ", qusetionsContent="
				+ qusetionsContent + ", qusetionsDt=" + qusetionsDt + ", qusetionsStatus=" + qusetionsStatus
				+ ", qusetionsReplyStatus=" + qusetionsReplyStatus + ", qusetionsReply=" + qusetionsReply
				+ ", memberNo=" + memberNo + ", mem=" + mem + "]";
	}

	
	

}
