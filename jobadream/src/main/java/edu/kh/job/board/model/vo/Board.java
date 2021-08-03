package edu.kh.job.board.model.vo;

import java.sql.Timestamp;

public class Board {
	private int boardNo;
	private String boardTitle;
	private int readCount;
	private Timestamp createDate;
	private int memberNo;
	private String memberName;
	private int categoryCode;
	private String boardTime;
	private String boardPlace;
	private int boardPay;
	private String boardContent;
	
	public Board() {
		
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", readCount=" + readCount + ", createDate="
				+ createDate + ", memberNo=" + memberNo + ", memberName=" + memberName + ", categoryCode="
				+ categoryCode + ", boardTime=" + boardTime + ", boardPlace=" + boardPlace + ", boardPay=" + boardPay
				+ ", boardContent=" + boardContent + "]";
	}
	
	
}