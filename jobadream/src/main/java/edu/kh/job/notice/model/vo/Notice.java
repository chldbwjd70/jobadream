package edu.kh.job.notice.model.vo;

import java.sql.Timestamp;
import java.util.List;

import edu.kh.job.member.model.vo.Member;

public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeStatus;
	private Timestamp createDt;
	private int memberNo;
	
	private Member mem;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
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

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeStatus=" + noticeStatus + ", createDt=" + createDt + ", memberNo=" + memberNo + ", mem="
				+ mem + "]";
	}

	
	
	

}
