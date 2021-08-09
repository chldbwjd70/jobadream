package edu.kh.job.board.model.vo;

public class BoardProgress {
	private int memberNo;
	private int boardNo;
	private String progressStatus;
	private int memberScore;
	
	public BoardProgress() {}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getProgressStatus() {
		return progressStatus;
	}

	public void setProgressStatus(String progressStatus) {
		this.progressStatus = progressStatus;
	}

	public int getMemberScore() {
		return memberScore;
	}

	public void setMemberScore(int memberScore) {
		this.memberScore = memberScore;
	}

	@Override
	public String toString() {
		return "BoardProgress [memberNo=" + memberNo + ", boardNo=" + boardNo + ", progressStatus=" + progressStatus
				+ ", memberScore=" + memberScore + "]";
	}
	
}
