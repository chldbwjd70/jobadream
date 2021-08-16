package edu.kh.job.member.model.vo;

import java.sql.Timestamp;

public class Board {
	private int boardNo;
	private String boardTitle;
	private int readCount;
	private Timestamp createDate;
	private String boardStatus;
	private int memberNo;
	private int categoryCode;
	
	private String boardTime;
	private String boardPlace;
	private int boardPay;
	private String boardContent;
	
	private String progressStatus;
	private String memberName;
	private String memberPoint;
	
	private Timestamp progressDt;
	
	
	public Board() {}
	
	
	
	public String getMemberPoint() {
		return memberPoint;
	}



	public void setMemberPoint(String memberPoint) {
		this.memberPoint = memberPoint;
	}


	public String getProgressStatus() {
		return progressStatus;
	}

	public void setProgressStatus(String progressStatus) {
		this.progressStatus = progressStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getBoardTime() {
		return boardTime;
	}

	public void setBoardTime(String boardTime) {
		this.boardTime = boardTime;
	}

	public String getBoardPlace() {
		return boardPlace;
	}

	public void setBoardPlace(String boardPlace) {
		this.boardPlace = boardPlace;
	}

	public int getBoardPay() {
		return boardPay;
	}

	public void setBoardPay(int boardPay) {
		this.boardPay = boardPay;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Timestamp getProgressDt() {
		return progressDt;
	}
	public void setProgressDt(Timestamp progressDt) {
		this.progressDt = progressDt;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", readCount=" + readCount + ", createDate="
				+ createDate + ", boardStatus=" + boardStatus + ", memberNo=" + memberNo + ", categoryCode="
				+ categoryCode + ", boardTime=" + boardTime + ", boardPlace=" + boardPlace + ", boardPay=" + boardPay
				+ ", boardContent=" + boardContent + ", progressStatus=" + progressStatus + ", memberName=" + memberName
				+ ", memberPoint=" + memberPoint + ", progressDt=" + progressDt + "]";
	}

	
}
