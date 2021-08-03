package edu.kh.job.notice.model.vo;

import java.sql.Timestamp;

public class Notice {
	
	private int noticeNo;
	private String noticeContent;
	private String noticeStatus;
	private Timestamp createDt;
	private int memberNo;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	public Timestamp getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeContent=" + noticeContent + ", noticeStatus=" + noticeStatus
				+ ", createDt=" + createDt + ", memberNo=" + memberNo + "]";
	}
	
	

}
