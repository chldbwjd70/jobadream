package edu.kh.job.qusetions.model.vo;

import java.sql.Timestamp;

public class Reply {

	private int qusetionsCommentNo; 		 		// 댓글 번호
	private String qusetionsCommentContent; 		// 댓글 내용
	private Timestamp qusetionsCommentDt;		// 댓글 작성일
	private int qusetionsNo;			// 댓글이 작성된  번호
	private String qusetionsCommentStatus;				// 댓글 등록 여부
	private String memberNo;			// 회원 구분번호
	private String memberId;			// 회원 구분번호
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public int getQusetionsCommentNo() {
		return qusetionsCommentNo;
	}

	public void setQusetionsCommentNo(int qusetionsCommentNo) {
		this.qusetionsCommentNo = qusetionsCommentNo;
	}

	public String getQusetionsCommentContent() {
		return qusetionsCommentContent;
	}

	public void setQusetionsCommentContent(String qusetionsCommentContent) {
		this.qusetionsCommentContent = qusetionsCommentContent;
	}

	public Timestamp getQusetionsCommentDt() {
		return qusetionsCommentDt;
	}

	public void setQusetionsCommentDt(Timestamp qusetionsCommentDt) {
		this.qusetionsCommentDt = qusetionsCommentDt;
	}

	public int getQusetionsNo() {
		return qusetionsNo;
	}

	public void setQusetionsNo(int qusetionsNo) {
		this.qusetionsNo = qusetionsNo;
	}

	public String getQusetionsCommentStatus() {
		return qusetionsCommentStatus;
	}

	public void setQusetionsCommentStatus(String qusetionsCommentStatus) {
		this.qusetionsCommentStatus = qusetionsCommentStatus;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Reply [qusetionsCommentNo=" + qusetionsCommentNo + ", qusetionsCommentContent="
				+ qusetionsCommentContent + ", qusetionsCommentDt=" + qusetionsCommentDt + ", qusetionsNo="
				+ qusetionsNo + ", qusetionsCommentStatus=" + qusetionsCommentStatus + ", memberNo=" + memberNo
				+ ", memberId=" + memberId + "]";
	}

	
	
	
}